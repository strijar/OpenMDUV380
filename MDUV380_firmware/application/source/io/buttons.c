/*
 * Copyright (C) 2020-2022 Roger Clark, VK3KYY / G4KYF
 *                         Daniel Caujolle-Bert, F1RMB
 *
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer
 *    in the documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * 4. Use of this source code or binary releases for commercial purposes is strictly forbidden. This includes, without limitation,
 *    incorporation in a commercial product or incorporation into a product or project which allows commercial use.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <lvgl.h>
#include "interfaces/adc.h"
#include "io/buttons.h"
#include "io/display.h"
#include "main.h"

uint32_t 				EVENT_BUTTON;

static button_state_t	buttons_state[BUTTON_MAX] = { BUTTON_RELEASE, BUTTON_RELEASE, BUTTON_RELEASE };
static lv_timer_t		*button_timer[BUTTON_MAX] = { NULL, NULL, NULL};

static uint32_t prevButtonState;
static uint32_t mbuttons;
volatile bool   PTTLocked = false;

#define MBUTTON_PRESSED        (1 << 0)
#define MBUTTON_LONG           (1 << 1)
#define MBUTTON_EXTRA_LONG     (1 << 2)

typedef enum
{
	MBUTTON_ORANGE,
	MBUTTON_SK1,
	MBUTTON_SK2,
	MBUTTON_MAX
} MBUTTON_t;

static void send_button_event(button_t button, button_state_t state) {
	buttons_state[button] = state;

	event_button_t *event = lv_mem_alloc(sizeof(event_button_t));

	event->button = button;
	event->state = state;

	lv_event_send(lv_scr_act(), EVENT_BUTTON, event);
	displayLightTrigger(true);
}

void press_timeout(lv_timer_t * timer) {
	button_t button = (button_t) timer->user_data;

	send_button_event(button, BUTTON_LONG);
	button_timer[button] = NULL;
}

static void check_button(button_t button, bool on) {
	if (on) {
		switch (buttons_state[button]) {
			case BUTTON_RELEASE:
			case BUTTON_LONG_RELEASE:
				send_button_event(button, BUTTON_PRESS);

				if (button_timer[button]) {
					lv_timer_del(button_timer[button]);
				}

				button_timer[button] = lv_timer_create(press_timeout, 1000, (void *) button);
				lv_timer_set_repeat_count(button_timer[button], 1);
				break;

			default:
				break;
		}
	} else {
		switch (buttons_state[button]) {
			case BUTTON_PRESS:
				send_button_event(button, BUTTON_RELEASE);

				if (button_timer[button]) {
					lv_timer_del(button_timer[button]);
					button_timer[button] = NULL;
				}
				break;

			case BUTTON_LONG:
				send_button_event(button, BUTTON_LONG_RELEASE);
				break;

			default:
				break;
		}
	}
}

void buttonsRead() {
	GPIO_InitTypeDef GPIO_InitStruct = {0};

	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	GPIO_InitStruct.Pull = GPIO_PULLDOWN;

	GPIO_InitStruct.Pin = LCD_D6_Pin | LCD_D7_Pin;
	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

	/* Set ROW2 (K3) in OUTPUT mode, as keyboard code sets it to floating (avoiding Multiple key press combination problems). */

	GPIO_InitStruct.Pin = KEYPAD_ROW2_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(KEYPAD_ROW2_GPIO_Port, &GPIO_InitStruct);

	/* set the row pin high to select that row of keys */

	HAL_GPIO_WritePin(KEYPAD_ROW2_GPIO_Port, KEYPAD_ROW2_Pin, GPIO_PIN_SET);

	for (volatile int xx = 0; xx < 100; xx++) {} /* arbitrary settling delay */

	check_button(BUTTON_SK1, HAL_GPIO_ReadPin(LCD_D7_GPIO_Port, LCD_D7_Pin) == GPIO_PIN_SET);
	check_button(BUTTON_SK2, HAL_GPIO_ReadPin(LCD_D6_GPIO_Port, LCD_D6_Pin) == GPIO_PIN_SET);

	/* set the row2 pin back to floating. This prevents conflicts between multiple key presses. */

	GPIO_InitStruct.Pin = KEYPAD_ROW2_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(KEYPAD_ROW2_GPIO_Port, &GPIO_InitStruct);

	bool ptt = ((HAL_GPIO_ReadPin(PTT_GPIO_Port, PTT_Pin) == GPIO_PIN_RESET) || (HAL_GPIO_ReadPin(PTT_EXTERNAL_GPIO_Port, PTT_EXTERNAL_Pin) == GPIO_PIN_RESET));

	check_button(BUTTON_PTT, ptt);
}

void buttonsInit(void) {
	EVENT_BUTTON = lv_event_register_id();
}

button_state_t buttonsState(button_t button) {
	return buttons_state[button];
}

bool buttonsPressed(button_t button) {
	return buttons_state[button] == BUTTON_PRESS || buttons_state[button] == BUTTON_LONG;
}

static bool isMButtonPressed(MBUTTON_t mbutton)
{
	return (((mbuttons >> (mbutton * 3)) & MBUTTON_PRESSED) & MBUTTON_PRESSED);
}

static bool isMButtonLong(MBUTTON_t mbutton)
{
	return (((mbuttons >> (mbutton * 3)) & MBUTTON_LONG) & MBUTTON_LONG);
}

static bool isMButtonExtraLong(MBUTTON_t mbutton)
{
	return (((mbuttons >> (mbutton * 3)) & MBUTTON_EXTRA_LONG) & MBUTTON_EXTRA_LONG);
}

static void setMButtonsStateAndClearLong(uint32_t *buttons, MBUTTON_t mbutton, uint32_t buttonID)
{
	if (*buttons & buttonID)
	{
		mbuttons |= (MBUTTON_PRESSED << (mbutton * 3));
	}
	else
	{
		mbuttons &= ~(MBUTTON_PRESSED << (mbutton * 3));
	}

	taskENTER_CRITICAL();
	switch (mbutton)
	{
		case MBUTTON_SK1:
		case MBUTTON_SK2:
		case MBUTTON_ORANGE:
			timer_mbuttons[mbutton] = (*buttons & buttonID) ? (nonVolatileSettings.keypadTimerLong * 100) : 0;
			break;

		default:
			break;
	}
	taskEXIT_CRITICAL();

	mbuttons &= ~(MBUTTON_LONG << (mbutton * 3));
	mbuttons &= ~(MBUTTON_EXTRA_LONG << (mbutton * 3));
}

static void checkMButtonState(uint32_t *buttons, MBUTTON_t mbutton, uint32_t buttonID)
{
	if (isMButtonPressed(mbutton) == false)
	{
		setMButtonsStateAndClearLong(buttons, mbutton, buttonID);
	}
}

static uint32_t buttonsReadOld()
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	uint32_t result = BUTTON_NONE;
#if 0
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	GPIO_InitStruct.Pull = GPIO_PULLDOWN;

	GPIO_InitStruct.Pin = LCD_D6_Pin | LCD_D7_Pin;
	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

	// Set ROW2 (K3) in OUTPUT mode, as keyboard code sets it to floating (avoiding Multiple key press combination problems).
	GPIO_InitStruct.Pin = KEYPAD_ROW2_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(KEYPAD_ROW2_GPIO_Port, &GPIO_InitStruct);

	//set the row pin high to select that row of keys
	HAL_GPIO_WritePin(KEYPAD_ROW2_GPIO_Port, KEYPAD_ROW2_Pin, GPIO_PIN_SET);

	for (volatile int xx = 0; xx < 100; xx++)
	{
		// arbitrary settling delay
	}

#if defined (PLATFORM_MDUV380)
	if (HAL_GPIO_ReadPin(LCD_D7_GPIO_Port, LCD_D7_Pin) == GPIO_PIN_SET)
#elif defined (PLATFORM_DM1701)
	if (HAL_GPIO_ReadPin(LCD_D5_GPIO_Port, LCD_D5_Pin) == GPIO_PIN_SET)
#endif
	{
#if defined(PLATFORM_MD380)
		result |= BUTTON_SK2_OLD;
		checkMButtonState(&result, MBUTTON_SK2, BUTTON_SK2_OLD);
#else
		result |= BUTTON_SK1_OLD;
		checkMButtonState(&result, MBUTTON_SK1, BUTTON_SK1_OLD);
#endif
	}

	if (HAL_GPIO_ReadPin(LCD_D6_GPIO_Port, LCD_D6_Pin) == GPIO_PIN_SET)
	{
#if defined(PLATFORM_MD380)
		result |= BUTTON_SK1_OLD;
		checkMButtonState(&result, MBUTTON_SK1, BUTTON_SK1_OLD);
#else
		result |= BUTTON_SK2_OLD;
		checkMButtonState(&result, MBUTTON_SK2, BUTTON_SK2_OLD);
#endif
	}

	//set the row2 pin back to floating. This prevents conflicts between multiple key presses.
	GPIO_InitStruct.Pin = KEYPAD_ROW2_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(KEYPAD_ROW2_GPIO_Port, &GPIO_InitStruct);

	if ((HAL_GPIO_ReadPin(PTT_GPIO_Port, PTT_Pin) == GPIO_PIN_RESET) ||
			(HAL_GPIO_ReadPin(PTT_EXTERNAL_GPIO_Port, PTT_EXTERNAL_Pin) == GPIO_PIN_RESET))
	{
		result |= BUTTON_PTT_OLD;
	}
#endif
	return result;
}

static void checkMButtons(uint32_t *buttons, MBUTTON_t mbutton, uint32_t buttonID, uint32_t buttonShortUp, uint32_t buttonLong, uint32_t buttonExtraLong)
{
	taskENTER_CRITICAL();
	uint32_t tmp_timer_mbutton = timer_mbuttons[mbutton];
	taskEXIT_CRITICAL();

	// Note: Short press are send async

	if ((*buttons & buttonID) && isMButtonPressed(mbutton) && isMButtonLong(mbutton) && (isMButtonExtraLong(mbutton) == false))
	{
		// button is still down
		*buttons |= buttonLong;

		if (tmp_timer_mbutton == 0)
		{
			// Long extra long press
			mbuttons |= (MBUTTON_EXTRA_LONG << (mbutton * 3));

			// Clear LONG and set EXTRA_LONG bits
			*buttons &= ~buttonLong;
			*buttons |= buttonExtraLong;
		}
	}
	else if ((*buttons & buttonID) && isMButtonPressed(mbutton) && isMButtonLong(mbutton) && isMButtonExtraLong(mbutton))
	{
		// button is still down
		*buttons |= buttonLong;
		// Clear LONG and set EXTRA_LONG bits
		*buttons &= ~buttonLong;
		*buttons |= buttonExtraLong;
	}
	else if ((*buttons & buttonID) && isMButtonPressed(mbutton) && (isMButtonLong(mbutton) == false))
	{
		if (tmp_timer_mbutton == 0)
		{
			// Long press
			mbuttons |= (MBUTTON_LONG << (mbutton * 3));

			// Set LONG bit
			*buttons |= buttonLong;

			// Reset the timer for extra long down usage
			taskENTER_CRITICAL();
			timer_mbuttons[mbutton] = (((nonVolatileSettings.keypadTimerLong * 3) >> 1) * 100);
			taskEXIT_CRITICAL();
		}
	}
	else if (((*buttons & buttonID) == 0) && isMButtonPressed(mbutton) && (isMButtonLong(mbutton) == false) && (tmp_timer_mbutton != 0))
	{
		// Short press/release cycle
		mbuttons &= ~(MBUTTON_PRESSED << (mbutton * 3));
		mbuttons &= ~(MBUTTON_LONG << (mbutton * 3));
		mbuttons &= ~(MBUTTON_EXTRA_LONG << (mbutton * 3));

		taskENTER_CRITICAL();
		timer_mbuttons[mbutton] = 0;
		taskEXIT_CRITICAL();

		// Set SHORT press
		*buttons |= buttonShortUp;
		*buttons &= ~buttonLong;
		*buttons &= ~buttonExtraLong;
	}
	else if (((*buttons & buttonID) == 0) && isMButtonPressed(mbutton) && isMButtonLong(mbutton))
	{
		// Button was still down after a long press, now handle release
		mbuttons &= ~(MBUTTON_PRESSED << (mbutton * 3));
		mbuttons &= ~(MBUTTON_LONG << (mbutton * 3));
		mbuttons &= ~(MBUTTON_EXTRA_LONG << (mbutton * 3));

		// Remove LONG and EXTRA_LONG
		*buttons &= ~buttonLong;
		*buttons &= ~buttonExtraLong;
	}
}

void buttonsCheckButtonsEvent(uint32_t *buttons, int *event, bool keyIsDown)
{
	*buttons = buttonsReadOld();

	// Handles buttons states
	if ((*buttons != BUTTON_NONE) || (mbuttons & BUTTON_WAIT_NEW_STATE))
	{
		// A key is down, just leave DOWN bit
		if (keyIsDown)
		{
			mbuttons |= BUTTON_WAIT_NEW_STATE;

			// Clear stored states
			setMButtonsStateAndClearLong(buttons, MBUTTON_SK1, BUTTON_SK1_OLD);
			setMButtonsStateAndClearLong(buttons, MBUTTON_SK2, BUTTON_SK2_OLD);
#if ! (defined(PLATFORM_RD5R) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017))
			setMButtonsStateAndClearLong(buttons, MBUTTON_ORANGE, BUTTON_ORANGE);
#endif

			// Won't send a CHANGE event, as the key turns to be a modifier now
			prevButtonState = *buttons;
			*event = EVENT_BUTTON_NONE;
			return;
		}
		else
		{
			if (mbuttons & BUTTON_WAIT_NEW_STATE)
			{
				if (*buttons != prevButtonState)
				{
					mbuttons &= ~BUTTON_WAIT_NEW_STATE;

					// Clear stored states
					setMButtonsStateAndClearLong(buttons, MBUTTON_SK1, BUTTON_SK1_OLD);
					setMButtonsStateAndClearLong(buttons, MBUTTON_SK2, BUTTON_SK2_OLD);
#if ! (defined(PLATFORM_RD5R) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017))
					setMButtonsStateAndClearLong(buttons, MBUTTON_ORANGE, BUTTON_ORANGE);
#endif
					prevButtonState = *buttons;
					*event = EVENT_BUTTON_CHANGE;
					return;
				}

				*event = EVENT_BUTTON_NONE;
				return;
			}
		}
	}

	// Check state for every single button
#if ! (defined(PLATFORM_RD5R) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017))
	checkMButtons(buttons, MBUTTON_ORANGE, BUTTON_ORANGE, BUTTON_ORANGE_SHORT_UP, BUTTON_ORANGE_LONG_DOWN, BUTTON_ORANGE_EXTRA_LONG_DOWN);
#endif // ! PLATFORM_RD5R
	checkMButtons(buttons, MBUTTON_SK1, BUTTON_SK1_OLD, BUTTON_SK1_OLD_SHORT_UP, BUTTON_SK1_OLD_LONG_DOWN, BUTTON_SK1_OLD_EXTRA_LONG_DOWN);
	checkMButtons(buttons, MBUTTON_SK2, BUTTON_SK2_OLD, BUTTON_SK2_OLD_SHORT_UP, BUTTON_SK2_OLD_LONG_DOWN, BUTTON_SK2_OLD_EXTRA_LONG_DOWN);

	if (prevButtonState != *buttons)
	{
		prevButtonState = *buttons;
		*event = EVENT_BUTTON_CHANGE;
	}
	else
	{
		*event = EVENT_BUTTON_NONE;
	}
}
