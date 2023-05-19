/*
 * Copyright (C) 2019      Kai Ludwig, DG4KLU
 * Copyright (C) 2019-2020 Alex, DL4LEX
 * Copyright (C) 2019-2022 Roger Clark, VK3KYY / G4KYF
 *                         Daniel Caujolle-Bert, F1RMB
 *                         Colin Durbridge, G4EML
 *                         Oleg Belousov, R1CBU
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

#include <lvgl.h>

#include "io/keyboard.h"
#include "interfaces/pit.h"
#include "functions/settings.h"
#include "interfaces/gpio.h"
#include "interfaces/adc.h"
#include "io/buttons.h"

typedef struct {
	GPIO_TypeDef  *GPIOPort;
	uint16_t       GPIOPin;
	uint16_t       Key;
} KeyboardKeySetting_t;

volatile bool keypadAlphaEnable;
volatile bool keypadLocked = false;
static bool rotaryDebounceDone = true;

volatile rotaryData_t rotaryData = {
		.Count = 0,
		.Direction = 0
};

static const char keypadAlphaMap[11][31] = {
		"0 ",
		"1.!,@-:?()~/[]#<>=*+$%'`&|_^{}",
		"abc2ABC",
		"def3DEF",
		"ghi4GHI",
		"jkl5JKL",
		"mno6MNO",
		"pqrs7PQRS",
		"tuv8TUV",
		"wxyz9WXYZ",
		"*"
};

#define KEYBOARD_KEYS_PER_ROW  8U

static lv_indev_drv_t	keyboard_indev_drv;
static lv_indev_t		*keyboard_indev;
static lv_group_t		*keyboard_group;
static uint16_t			keyboard_prev_keycode = 0;

static lv_indev_drv_t	rotary_indev_drv;
static lv_indev_t		*rotary_indev;

static const struct {
	GPIO_TypeDef         *GPIOCtrlPort;
	uint16_t              GPIOCtrlPin;
	KeyboardKeySetting_t  Rows[KEYBOARD_KEYS_PER_ROW];
} KeyboardMatrix[] =
{
		{
				KEYPAD_ROW0_GPIO_Port,
				KEYPAD_ROW0_Pin,
				{
						{ LCD_D0_GPIO_Port, LCD_D0_Pin, '1'     },
						{ LCD_D1_GPIO_Port, LCD_D1_Pin, '2'     },
						{ LCD_D2_GPIO_Port, LCD_D2_Pin, '3'     },
						{ LCD_D3_GPIO_Port, LCD_D3_Pin, '4'     },
						{ LCD_D4_GPIO_Port, LCD_D4_Pin, '5'     },
						{ LCD_D5_GPIO_Port, LCD_D5_Pin, '6'     },
						{ LCD_D6_GPIO_Port, LCD_D6_Pin, '0'     },
						{ LCD_D7_GPIO_Port, LCD_D7_Pin, '*'  	}
				}
		},
		{
				KEYPAD_ROW1_GPIO_Port,
				KEYPAD_ROW1_Pin,
				{
						{ LCD_D0_GPIO_Port, LCD_D0_Pin, LV_KEY_ENTER	},
						{ LCD_D1_GPIO_Port, LCD_D1_Pin, LV_KEY_UP    	},
						{ LCD_D2_GPIO_Port, LCD_D2_Pin, LV_KEY_DOWN  	},
						{ LCD_D3_GPIO_Port, LCD_D3_Pin, '7'     		},
						{ LCD_D4_GPIO_Port, LCD_D4_Pin, '8'     		},
						{ LCD_D5_GPIO_Port, LCD_D5_Pin, '9'     		},
						{ LCD_D6_GPIO_Port, LCD_D6_Pin, '#'  			},
						{ LCD_D7_GPIO_Port, LCD_D7_Pin, LV_KEY_ESC   	}
				}
		},
		{
				KEYPAD_ROW2_GPIO_Port,
				KEYPAD_ROW2_Pin,
				{
						{ LCD_D0_GPIO_Port, LCD_D0_Pin, KEY_NONE 	},
						{ LCD_D1_GPIO_Port, LCD_D1_Pin, KEY_NONE    },
						{ LCD_D2_GPIO_Port, LCD_D2_Pin, KEY_NONE  	},
						{ LCD_D3_GPIO_Port, LCD_D3_Pin, KEY_NONE    },
						{ LCD_D4_GPIO_Port, LCD_D4_Pin, KEY_NONE    },
						{ LCD_D5_GPIO_Port, LCD_D5_Pin, KEY_NONE    },
						{ LCD_D6_GPIO_Port, LCD_D6_Pin, KEY_NONE  	},
						{ LCD_D7_GPIO_Port, LCD_D7_Pin, KEY_NONE   	}
				}
		}
};

static void keyboard_read_cb(lv_indev_drv_t *drv, lv_indev_data_t *data) {
	uint16_t keycode = 0;

	GPIO_InitTypeDef GPIO_InitStruct = {0};

	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	GPIO_InitStruct.Pull = GPIO_PULLDOWN;

	GPIO_InitStruct.Pin = LCD_D0_Pin | LCD_D1_Pin | LCD_D2_Pin | LCD_D3_Pin;
	HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

	GPIO_InitStruct.Pin = LCD_D4_Pin | LCD_D5_Pin | LCD_D6_Pin | LCD_D7_Pin;
	HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

	for (size_t i = 0; i < (sizeof(KeyboardMatrix) / sizeof(KeyboardMatrix[0])); i++) {
		/* Set the Row Pin as Output */

		GPIO_InitStruct.Pin = KeyboardMatrix[i].GPIOCtrlPin;
		GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
		GPIO_InitStruct.Pull = GPIO_NOPULL;
		GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
		HAL_GPIO_Init(KeyboardMatrix[i].GPIOCtrlPort, &GPIO_InitStruct);

		/* Set the row pin high to select that row of keys */

		HAL_GPIO_WritePin(KeyboardMatrix[i].GPIOCtrlPort, KeyboardMatrix[i].GPIOCtrlPin, GPIO_PIN_SET);

		for (volatile int xx = 0; xx < 100; xx++); /* arbitrary settling delay */

		for (size_t k = 0; k < KEYBOARD_KEYS_PER_ROW; k++) {
			if (HAL_GPIO_ReadPin(KeyboardMatrix[i].Rows[k].GPIOPort, KeyboardMatrix[i].Rows[k].GPIOPin) == GPIO_PIN_SET) {
				keycode = KeyboardMatrix[i].Rows[k].Key;
				break;
			}
		}

		/* set the row pin back to floating. This prevents conflicts between multiple key presses. */

		GPIO_InitStruct.Pin = KeyboardMatrix[i].GPIOCtrlPin;
		GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
		GPIO_InitStruct.Pull = GPIO_NOPULL;
		GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
		HAL_GPIO_Init(KeyboardMatrix[i].GPIOCtrlPort, &GPIO_InitStruct);

		/* Stop on first down key (we don't support multiple key presses). */

		if (keycode != 0) {
			break;
		}
	}

	if (keycode != 0) {
		keyboard_prev_keycode = keycode;
		data->key = keycode;
		data->state = LV_INDEV_STATE_PRESSED;
	} else {
		data->key = keyboard_prev_keycode;
		data->state = LV_INDEV_STATE_RELEASED;
	}
}

static void rotary_read_cb(lv_indev_drv_t *drv, lv_indev_data_t *data) {
	if (rotaryData.Direction < 0) {
		data->key = LV_KEY_LEFT;
		data->state = LV_INDEV_STATE_PRESSED;
		rotaryData.Direction = 0;
	} else if (rotaryData.Direction > 0) {
		data->key = LV_KEY_RIGHT;
		data->state = LV_INDEV_STATE_PRESSED;
		rotaryData.Direction = 0;
	} else {
		data->state = LV_INDEV_STATE_RELEASED;
	}
}

void keyboardInit(void) {
	keyboard_group = lv_group_create();
	lv_group_set_default(keyboard_group);

	/* * */

	lv_indev_drv_init(&keyboard_indev_drv);

	keyboard_indev_drv.type = LV_INDEV_TYPE_KEYPAD;
	keyboard_indev_drv.read_cb = keyboard_read_cb;

	keyboard_indev = lv_indev_drv_register(&keyboard_indev_drv);
	lv_indev_set_group(keyboard_indev, keyboard_group);

	/* * */

	lv_indev_drv_init(&rotary_indev_drv);

	rotary_indev_drv.type = LV_INDEV_TYPE_KEYPAD;
	rotary_indev_drv.read_cb = rotary_read_cb;

	rotary_indev = lv_indev_drv_register(&rotary_indev_drv);
	lv_indev_set_group(rotary_indev, keyboard_group);
}

void keyboardReset(void) {
}

bool keyboardKeyIsDTMFKey(char key)
{
	switch (key)
	{
		case KEY_0 ... KEY_9:
		case KEY_STAR:
		case KEY_HASH:
		case KEY_A:
		case KEY_B:
		case KEY_C:
		case KEY_D:
			return true;
	}
	return false;
}

void rotaryEncoderISR(void) {
	if (rotaryDebounceDone) {
		int pinA = HAL_GPIO_ReadPin(ROTARY_SW_A_GPIO_Port, ROTARY_SW_A_Pin);
		int pinB = HAL_GPIO_ReadPin(ROTARY_SW_B_GPIO_Port, ROTARY_SW_B_Pin);

		if (pinB == pinA) {
			rotaryData.Direction = -1;
		} else {
			rotaryData.Direction = 1;
		}

		rotaryData.Count += rotaryData.Direction;
		rotaryDebounceDone=false;
		addTimerCallback(keyboardRotaryDebounceCallback, 5, -1, false);
	}
}

void keyboardRotaryDebounceCallback(void) {
	rotaryDebounceDone=true;
}

void keyboardCheckKeyEvent(keyboardCode_t *keys, int *event) {
}
