/*
 * Copyright (C) 2021-2022 Roger Clark, VK3KYY / G4KYF
 *                         Colin Durbridge, G4EML
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

#include <hardware/HX8353E.h>
#include <stdbool.h>
#include <memory.h>
#include <malloc.h>
#include <stdio.h>
#include <lvgl.h>

#include "interfaces/adc.h"
#include "interfaces/batteryRAM.h"
#include "hardware/SPI_Flash.h"
#include "interfaces/adc.h"
#include "hardware/radioHardwareInterface.h"

#include "io/buttons.h"
#include "usb/usb_com.h"
#include "usb_device.h"
#include "user_interface/menuSystem.h"
#include "user_interface/uiUtilities.h"
#include "functions/ticks.h"
#include "interfaces/batteryAndPowerManagement.h"
#include "interfaces/gps.h"
#include "interfaces/settingsStorage.h"
#include "interfaces/adc.h"
#include "functions/rxPowerSaving.h"

#if defined(USING_EXTERNAL_DEBUGGER)
#include "SeggerRTT/RTT/SEGGER_RTT.h"
#endif

volatile bool mainIsRunning = true;
static bool updateMessageOnScreen = false;
int lastVolume = 0;


#if (__NVIC_PRIO_BITS != 3)
#error Files need to be manually after regernation using the STM32Cube configuration tool to support the non-genuine CPU

/*
 * To support the Non-genuine CPU in newer radios, the folling changes must be made
 *
 * stm32f405xx.h line 49 needs to be changed to
 * #define __NVIC_PRIO_BITS          3U       // VK3KYY changed this to 3 to fix problem with clone CPU. Genuine STM32F4XX uses 4 Bits for the Priority Levels
 *
 * FreeRTOS
 *
 * FreeRTOSConfig.h
 *
 * line 132
 *
 *  #define configPRIO_BITS         3
 *
 *  port.c
 *
 *  line 346
 *
 * 	configASSERT( ( portMAX_PRIGROUP_BITS - ulMaxPRIGROUPValue ) >= configPRIO_BITS );
 *
 * Also     HAL_NVIC_SetPriority(PendSV_IRQn, 15, 0);  has to be changed to HAL_NVIC_SetPriority(PendSV_IRQn, 7, 0); in stm32f4xx_hal_msp.h
 *
 */

#endif

#if false
static void hexDump(uint8_t *ptr, int len)
{
	char buf[8];
	char msg[128];

	msg[0] = 0;
	for (int i = 0; i < len; i++)
	{
		if ((i != 0) && (i%16 == 0))
		{
			strcat(msg,"\n");
			CDC_Transmit_FS((uint8_t *)msg,strlen(msg));
			msg[0] = 0;
		}
		else
		{
			sprintf(buf,"%02x ",*ptr);
			strcat(msg,buf);
		}
		ptr++;
		osDelay(1);
	}
}
#endif


static void keyBeepHandler(uiEvent_t *ev, bool ptttoggleddown)
{
	bool isScanning = (uiVFOModeIsScanning() || uiChannelModeIsScanning()) && !uiVFOModeSweepScanning(false);

	// Do not send any beep while scanning, otherwise enabling the AMP will be handled as a valid signal detection.
	if (((ev->keys.event & (KEY_MOD_LONG | KEY_MOD_PRESS)) == (KEY_MOD_LONG | KEY_MOD_PRESS)) ||
			((ev->keys.event & KEY_MOD_UP) == KEY_MOD_UP))
	{

		if ((ptttoggleddown == false) && (isScanning == false))
		{
			if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_BEEP)
			{
				soundSetMelody(nextKeyBeepMelody);
			}
			else
			{
				soundSetMelody(MELODY_KEY_BEEP);
			}
			nextKeyBeepMelody = (int *)MELODY_KEY_BEEP;// set back to the default beep
		}
		else
		{ 	// Reset the beep sound if we are scanning, otherwise the AudioAssist
			// beep will be played instead of the normal one.

			if (isScanning)
			{
				if (melody_play != NULL)
				{
					soundStopMelody();
				}
			}
			else
			{
				soundSetMelody(MELODY_KEY_BEEP);
			}
		}
	}
	else
	{
		if ((ev->keys.event & (KEY_MOD_LONG | KEY_MOD_DOWN)) == (KEY_MOD_LONG | KEY_MOD_DOWN))
		{
			if ((ptttoggleddown == false) && (isScanning == false))
			{
				if (nextKeyBeepMelody != MELODY_KEY_BEEP)
				{
					soundSetMelody(nextKeyBeepMelody);
					nextKeyBeepMelody = (int *)MELODY_KEY_BEEP;
				}
				else
				{
					soundSetMelody(MELODY_KEY_LONG_BEEP);
				}
			}
		}
	}
}

static bool rxBeepsMustPlayMelody(uint8_t rxBitOption)
{
	return ((nonVolatileSettings.beepOptions & rxBitOption) && (settingsUsbMode != USB_MODE_HOTSPOT) &&
			((uiDataGlobal.Scan.active == false) || (uiDataGlobal.Scan.active && (uiDataGlobal.Scan.state == SCAN_PAUSED))) &&
			(nonVolatileSettings.audioPromptMode != AUDIO_PROMPT_MODE_SILENT) && (voicePromptsIsPlaying() == false));
}

static void rxBeepsCarrierEndCallback(void)
{
	soundSetMelody(MELODY_RX_BEEP_END_BEEP);
}

static bool rxBeepsHandler(void)
{
	if (uiDataGlobal.rxBeepState & RX_BEEP_CARRIER_HAS_STARTED_EXEC)
	{
		// Don't clear the RF start beep when scanning, it has to be played, so wait the scan has paused.
		if ((uiDataGlobal.Scan.active &&
				((uiDataGlobal.Scan.state == SCAN_SCANNING) || (uiDataGlobal.Scan.state == SCAN_SHORT_PAUSED))) == false)
		{
			uiDataGlobal.rxBeepState &= ~RX_BEEP_CARRIER_HAS_STARTED_EXEC;
		}

		if (rxBeepsMustPlayMelody(BEEP_RX_CARRIER))
		{
			// Cancel queued rx end beep, if any. In this case, there is no
			// need to play another start beep, as the previous one has already
			// been heard.
			if (cancelTimerCallback(rxBeepsCarrierEndCallback, MENU_ANY) == false)
			{
				soundSetMelody(MELODY_RX_BEEP_BEGIN_BEEP);
			}

			return true;
		}
	}
	else if (uiDataGlobal.rxBeepState & RX_BEEP_TALKER_HAS_STARTED_EXEC)
	{
		uiDataGlobal.rxBeepState &= ~(RX_BEEP_TALKER_HAS_STARTED_EXEC | RX_BEEP_TALKER_HAS_ENDED | RX_BEEP_TALKER_HAS_ENDED_EXEC);

		if ((nonVolatileSettings.beepOptions & BEEP_RX_TALKER_BEGIN) && rxBeepsMustPlayMelody(BEEP_RX_TALKER))
		{
			soundSetMelody(MELODY_RX_BEEP_CALLER_BEGIN_BEEP);

			return true;
		}
	}
	else if (uiDataGlobal.rxBeepState & RX_BEEP_TALKER_HAS_ENDED_EXEC)
	{
		// FM: Replace Carrier beeps with Talker beeps if Caller beep option is selected.
		if ((trxGetMode() == RADIO_MODE_ANALOG) && ((nonVolatileSettings.beepOptions & BEEP_RX_CARRIER) == 0) && (nonVolatileSettings.beepOptions & BEEP_RX_TALKER))
		{
			uiDataGlobal.rxBeepState = RX_BEEP_UNSET;
		}
		else
		{
			uiDataGlobal.rxBeepState &= ~(RX_BEEP_TALKER_HAS_ENDED_EXEC | RX_BEEP_TALKER_HAS_STARTED | RX_BEEP_TALKER_HAS_STARTED_EXEC | RX_BEEP_TALKER_IDENTIFIED);
		}

		if (rxBeepsMustPlayMelody(BEEP_RX_TALKER))
		{
			soundSetMelody(MELODY_RX_BEEP_CALLER_END_BEEP);

			return true;
		}
	}
	else if (uiDataGlobal.rxBeepState & RX_BEEP_CARRIER_HAS_ENDED)
	{
		uiDataGlobal.rxBeepState = RX_BEEP_UNSET;

		if (rxBeepsMustPlayMelody(BEEP_RX_CARRIER))
		{
			// Delays end beep tone by 100ms, as it could played immediately after CALLER_END_BEEP on some conditions
			(void)addTimerCallback(rxBeepsCarrierEndCallback, 150, MENU_ANY, false);

			return true;
		}
	}

	return false;
}

static bool validateUpdateCallback(void)
{
	if (uiDataGlobal.MessageBox.keyPressed == KEY_GREEN)
	{
		updateMessageOnScreen = false;
		settingsSetOptionBit(BIT_SETTINGS_UPDATED, false);
		return true;
	}

	return false;
}

static void settingsUpdateAudioAlert(void)
{
	if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
	{
		voicePromptsInit();
		voicePromptsAppendPrompt(PROMPT_SETTINGS_UPDATE);
		voicePromptsPlay();
	}
	else
	{
		soundSetMelody(MELODY_ACK_BEEP);
	}
}


void applicationMainTask(void)
{
	keyboardCode_t	keys;
	int				key_event = EVENT_KEY_NONE;
	uint32_t		buttons = 0;
	int				button_event = EVENT_BUTTON_NONE;
	uint32_t		rotary = 0;
	int				rotary_event = EVENT_ROTARY_NONE;
	int				function_event = 0;
	bool			keyOrButtonChanged = false;
	int				*quickkeyPushedMenuMelody = NULL;
	int 			keyFunction;
	bool 			wasRestoringDefaultsettings = false;
	bool 			hasSignal = false;

	uiEvent_t ev = {
		.buttons = 0,
		.keys = NO_KEYCODE,
		.rotary = 0,
		.function = 0,
		.events = NO_EVENT,
		.hasEvent = false,
		.time = ticksGetMillis()
	};

#if 0
	HAL_GPIO_WritePin(PWR_SW_GPIO_Port, PWR_SW_Pin, GPIO_PIN_SET); // keep the power on
#endif

	batteryRAM_Init();
	adcStartDMA();

	displayLCD_Type = SPI_Flash_readSingleSecurityRegister(0x301D);
	displayLCD_Type &= 0x03;

	lv_init();

	buttonsInit();
	keyboardInit();
	rotaryEncoderISR();

	displayInit();
	gpioInitDisplay();

	lv_disp_set_bg_color(lv_disp_get_default(), lv_color_black());
	lv_disp_set_bg_opa(lv_disp_get_default(), LV_OPA_COVER);

	if (!SPI_Flash_init()) {
	}

	displayEnableBacklight(true, 100);
	gpioSetDisplayBacklightIntensityPercentage(50);

	/* * */

	lv_obj_t * btn = lv_btn_create(lv_scr_act());

	lv_obj_set_size(btn, 120, 32);
	lv_obj_center(btn);

	lv_obj_t * label = lv_label_create(btn);

	lv_label_set_text(label, "Button");
	lv_obj_center(label);
	lv_obj_set_style_text_font(label, &lv_font_24, 0);

	uint8_t 	led = 1;
	uint16_t	count = 0;
	int32_t		tick = 0;

	while (true) {
		uint32_t now = ticksGetMillis();

		if (count++ > 100) {
			count = 0;
			led = led ? 0 : 1;

			LedWriteDirect(LED_GREEN, led);

			lv_label_set_text_fmt(label, "Button %i", tick++);
		}

		lv_timer_handler();

		osDelay(pdMS_TO_TICKS(5));
		lv_tick_inc(ticksGetMillis() - now);
	}

	/* * */

	// Operator asked for settings reset.
	// With the modified frontpanel button Col/Row, it's not
	// possible to use anything else than P3 if the transceiver was
	// powered off using the power button.

	buttonsCheckButtonsEvent(&buttons, &button_event, false);

	if (buttons & BUTTON_SK2)
	{
		wasRestoringDefaultsettings = true;
		settingsRestoreDefaultSettings();
		settingsLoadSettings();
	}
	else
	{
		wasRestoringDefaultsettings = settingsLoadSettings();
	}

	radioPowerOn();

	uiDataGlobal.dmrDisabled = !codecIsAvailable();  // Check if DMR codec is available

	radioInit();

	calibrationInit();

	HRC6000Init();

	radioPostinit();

	HAL_ADC_Start_IT(&hadc1);

	HRC6000InitTask();

	voxInit();

	menuRadioInfosInit();
	batteryUpdate();

	soundInitBeepTask();

	lastheardInitList();
	codeplugInitCaches();
	dmrIDCacheInit();
	voicePromptsCacheInit();

	keyboardCheckKeyEvent(&keys, &key_event); // Read keyboard state and event

	if (wasRestoringDefaultsettings || KEYCHECK_DOWN(keys, KEY_HASH))
	{
		enableVoicePromptsIfLoaded(KEYCHECK_DOWN(keys, KEY_HASH));
	}

	// Need to take care if the user has already been fully notified about the settings update
	wasRestoringDefaultsettings = settingsIsOptionBitSet(BIT_SETTINGS_UPDATED);

	// Should be initialized before the splash screen, as we don't want melodies when VOX is enabled
	voxSetParameters(nonVolatileSettings.voxThreshold, nonVolatileSettings.voxTailUnits);

	codeplugGetSignallingDTMFDurations(&uiDataGlobal.DTMFContactList.durations);

	uiDataGlobal.dateTimeSecs = getRtcTime_custom();

	menuSystemInit();

	ticksTimerStart(&apoTimer, ((nonVolatileSettings.apo * 30) * 60000U));

	if (nonVolatileSettings.gps > GPS_MODE_OFF)
	{
		gpsOn();
	}


	if (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_MANUAL)
	{
		displayEnableBacklight(true, 100);
	}

	/* Infinite loop */
	for(;;)
	{
		uint32_t startTime = ticksGetMillis();
		mainIsRunning = true;
		keyOrButtonChanged = false;

		tick_com_request();
		handleTimerCallbacks();
		batteryUpdate();

		keyboardCheckKeyEvent(&keys, &key_event); // Read keyboard state and event

		buttonsCheckButtonsEvent(&buttons, &button_event, (keys.key != 0)); // Read button state and event

		// hack to allow SK1 + Up / Down to be Left / Right
		if (buttons & BUTTON_SK1)
		{
			bool clearSK1 = false;
/*
			if (keys.key == KEY_UP)
			{
				keys.key = KEY_LEFT;
				clearSK1 = true;
			}
			else if (keys.key == KEY_DOWN)
			{
				keys.key = KEY_RIGHT;
				clearSK1 = true;
			}
*/
			if (keys.key == KEY_GREEN)
			{
				// Translate keyboard SK1+GREEN to ORANGE button events

				buttons |= BUTTON_ORANGE;
				button_event = EVENT_BUTTON_CHANGE;
				clearSK1 = true;

				if ((keys.event & (KEY_MOD_PRESS | KEY_MOD_LONG)) == (KEY_MOD_PRESS | KEY_MOD_LONG))
				{
					buttons |= BUTTON_ORANGE_EXTRA_LONG_DOWN;
				}
				else if ((keys.event & (KEY_MOD_DOWN | KEY_MOD_LONG)) == (KEY_MOD_DOWN | KEY_MOD_LONG))
				{
					buttons |= BUTTON_ORANGE_LONG_DOWN;
				}
				else if ((keys.event & (KEY_MOD_UP | KEY_MOD_LONG)) == KEY_MOD_UP)
				{
					buttons |= BUTTON_ORANGE_SHORT_UP;
				}
				else if (keys.event & KEY_MOD_UP)
				{
					buttons = EVENT_BUTTON_NONE;
				}

				keys.event = EVENT_KEY_NONE;
				keys.key = 0;
			}

			if (clearSK1)
			{
				// Clear all SK1 flags
				buttons &= ~(BUTTON_SK1 | BUTTON_SK1_SHORT_UP | BUTTON_SK1_LONG_DOWN | BUTTON_SK1_EXTRA_LONG_DOWN);

				if (buttons == BUTTON_NONE)
				{
					button_event = EVENT_BUTTON_NONE;
				}
			}
		}

		if (((key_event != EVENT_KEY_NONE) && (keys.key != 0)) || (button_event != EVENT_BUTTON_NONE) || (rotary_event != EVENT_ROTARY_NONE))
		{
			keyOrButtonChanged = true;
		}

		// Settings reset information screen
		if (wasRestoringDefaultsettings && (menuSystemGetRootMenuNumber() != UI_SPLASH_SCREEN))
		{
			wasRestoringDefaultsettings = false;
			updateMessageOnScreen = true;

			menuSystemPushNewMenu(MENU_LANGUAGE);// As language menu is now in Options, present the operator with the Language menu after the "Settings updated" message has been displayed.

			snprintf(uiDataGlobal.MessageBox.message, MESSAGEBOX_MESSAGE_LEN_MAX, "%s", "Settings\nUpdated");
			uiDataGlobal.MessageBox.type = MESSAGEBOX_TYPE_INFO;
			uiDataGlobal.MessageBox.decoration = MESSAGEBOX_DECORATION_FRAME;
			uiDataGlobal.MessageBox.buttons =
#if defined(PLATFORM_MD9600)
					MESSAGEBOX_BUTTONS_ENT;
#else
					MESSAGEBOX_BUTTONS_OK;
#endif
			uiDataGlobal.MessageBox.validatorCallback = validateUpdateCallback;
			menuSystemPushNewMenu(UI_MESSAGE_BOX);

			(void)addTimerCallback(settingsUpdateAudioAlert, 100, UI_MESSAGE_BOX, false);// Need to delay playing this for a while, because otherwise it may get played before the volume is turned up enough to hear it.
		}

		// VOX Checking
		if (voxIsEnabled())
		{
			// if a key/button event happen, reset the VOX.
			if ((key_event == EVENT_KEY_CHANGE) || (button_event == EVENT_BUTTON_CHANGE) || (keys.key != 0) || (buttons != BUTTON_NONE))
			{
				voxReset();
			}
			else
			{
				if (!trxTransmissionEnabled && voxIsTriggered() && ((buttons & BUTTON_PTT) == 0))
				{
					button_event = EVENT_BUTTON_CHANGE;
					buttons |= BUTTON_PTT;
				}
				else if (trxTransmissionEnabled && ((voxIsTriggered() == false) || (keys.event & KEY_MOD_PRESS)))
				{
					button_event = EVENT_BUTTON_CHANGE;
					buttons &= ~BUTTON_PTT;
				}
				else if (trxTransmissionEnabled && voxIsTriggered())
				{
					// Any key/button event reset the vox
					if ((button_event != EVENT_BUTTON_NONE) || (keys.event != EVENT_KEY_NONE))
					{
						voxReset();
						button_event = EVENT_BUTTON_CHANGE;
						buttons &= ~BUTTON_PTT;
					}
					else
					{
						buttons |= BUTTON_PTT;
					}
				}
			}
		}

		// If the settings update message is still on screen, don't permit to start xmitting.
		if (updateMessageOnScreen && (buttons & BUTTON_PTT))
		{
			button_event = EVENT_BUTTON_CHANGE;
			buttons &= ~BUTTON_PTT;
		}

		if (headerRowIsDirty == true)
		{
			int currentMenu = menuSystemGetCurrentMenuNumber();

			if ((currentMenu == UI_CHANNEL_MODE) || (currentMenu == UI_VFO_MODE) ||
					((currentMenu == MENU_SATELLITE) && menuSatelliteIsDisplayingHeader()))
			{
				bool sweeping;
				if ((sweeping = uiVFOModeSweepScanning(true)))
				{
					displayFillRect(0, 0, DISPLAY_SIZE_X, 9, true);
				}
				else
				{
#if defined(PLATFORM_RD5R)
					displayFillRect(0, 0, DISPLAY_SIZE_X, 9, true);
#else
					displayClearRows(0, 2, false);
#endif
				}
				uiUtilityRenderHeader(uiVFOModeDualWatchIsScanning(), sweeping);
				displayRenderRows(0, 2);
			}

			headerRowIsDirty = false;
		}

		if (keypadLocked || PTTLocked)
		{
			if (keypadLocked && ((buttons & BUTTON_PTT) == 0))
			{
				if (key_event == EVENT_KEY_CHANGE)
				{
					bool continueToFilterKeys = true;

					// A key is pressed, but a message box is currently displayed (probably a private call notification)
					if (menuSystemGetCurrentMenuNumber() == UI_MESSAGE_BOX)
					{
						// Clear any key but RED and GREEN
						if ((keys.key == KEY_RED) || (keys.key == KEY_GREEN))
						{
							continueToFilterKeys = false;
						}
					}

					if (continueToFilterKeys)
					{
						if ((PTTToggledDown == false) && (menuSystemGetCurrentMenuNumber() != UI_LOCK_SCREEN))
						{
							menuSystemPushNewMenu(UI_LOCK_SCREEN);
						}

						key_event = EVENT_KEY_NONE;
					}

					if ((nonVolatileSettings.bitfieldOptions & BIT_PTT_LATCH) && PTTToggledDown)
					{
						PTTToggledDown = false;
					}
				}

				// Lockout ORANGE AND BLUE (BLACK stay active regardless lock status, useful to trigger backlight)
				if ((button_event == EVENT_BUTTON_CHANGE) && ((buttons & BUTTON_ORANGE) || (buttons & BUTTON_SK2)))
				{
					if ((PTTToggledDown == false) && (menuSystemGetCurrentMenuNumber() != UI_LOCK_SCREEN))
					{
						menuSystemPushNewMenu(UI_LOCK_SCREEN);
					}

					button_event = EVENT_BUTTON_NONE;

					if ((nonVolatileSettings.bitfieldOptions & BIT_PTT_LATCH) && PTTToggledDown)
					{
						PTTToggledDown = false;
					}
				}
			}
			else if (PTTLocked)
			{
				if ((buttons & BUTTON_PTT) && (button_event == EVENT_BUTTON_CHANGE))
				{
					// PTT button is pressed, but a message box is currently displayed, and PC allowance is set to PTT,
					// hence it's probably a private call accept, so let the PTT button being handled later in the code
					if (((menuSystemGetCurrentMenuNumber() == UI_MESSAGE_BOX) && (nonVolatileSettings.privateCalls == ALLOW_PRIVATE_CALLS_PTT)) == false)
					{
						soundSetMelody(MELODY_ERROR_BEEP);

						if (menuSystemGetCurrentMenuNumber() != UI_LOCK_SCREEN)
						{
							menuSystemPushNewMenu(UI_LOCK_SCREEN);
						}

						button_event = EVENT_BUTTON_NONE;
						// Clear PTT button
						buttons &= ~BUTTON_PTT;
					}
				}
				else if ((buttons & BUTTON_SK2) && KEYCHECK_DOWN(keys, KEY_STAR))
				{
					if (menuSystemGetCurrentMenuNumber() != UI_LOCK_SCREEN)
					{
						menuSystemPushNewMenu(UI_LOCK_SCREEN);
					}
				}
			}
		}

		int trxMode = trxGetMode();

		// Long press RED
		if ((key_event == EVENT_KEY_CHANGE) && ((buttons & BUTTON_PTT) == 0) && (keys.key != 0))
		{
			int currentMenu = menuSystemGetCurrentMenuNumber();

			// Longpress RED send back to root menu, it's only available from
			// any menu but VFO, Channel and CPS
			if (((currentMenu != UI_CHANNEL_MODE) && (currentMenu != UI_VFO_MODE) && (currentMenu != UI_CPS)) &&
					KEYCHECK_LONGDOWN(keys, KEY_RED) && (uiVFOModeIsScanning() == false) && (uiChannelModeIsScanning() == false))
			{
				uiDataGlobal.currentSelectedContactIndex = 0;
				menuSystemPopAllAndDisplayRootMenu();
				soundSetMelody(MELODY_KEY_BEEP);

				// Clear button/key event/state.
				buttons = BUTTON_NONE;
				rotary = 0;
				key_event = EVENT_KEY_NONE;
				button_event = EVENT_BUTTON_NONE;
				rotary_event = EVENT_ROTARY_NONE;
				keys.key = 0;
				keys.event = 0;
			}
		}
		//
		// PTT toggle feature
		//
		// PTT is locked down, but any button, except SK1 or SK2(1750Hz in FM) or DTMF Key in Analog,
		// or Up/Down with LH on screen in Digital, is pressed, virtually release PTT
		if (((nonVolatileSettings.bitfieldOptions & BIT_PTT_LATCH) && PTTToggledDown) &&
				(((button_event & EVENT_BUTTON_CHANGE) && (
#if ! defined(PLATFORM_RD5R)
						(buttons & BUTTON_ORANGE) ||
#endif
						((trxMode != RADIO_MODE_ANALOG) && (buttons & BUTTON_SK2)))) ||
						((keys.key != 0) && (keys.event & KEY_MOD_UP) &&
								(((trxMode == RADIO_MODE_ANALOG) && keyboardKeyIsDTMFKey(keys.key)) == false) &&
								(((trxMode == RADIO_MODE_DIGITAL) && menuTxScreenDisplaysLastHeard() && ((keys.key == KEY_UP) || (keys.key == KEY_DOWN))) == false))))
		{
			PTTToggledDown = false;
			button_event = EVENT_BUTTON_CHANGE;
			buttons = BUTTON_NONE;
			key_event = EVENT_KEY_NONE;
			keys.key = 0;
		}

		// PTT toggle action
		if (nonVolatileSettings.bitfieldOptions & BIT_PTT_LATCH)
		{
			if (button_event == EVENT_BUTTON_CHANGE)
			{
				if (buttons & BUTTON_PTT)
				{
					if (PTTToggledDown == false)
					{
						// PTT toggle works only if a TOT value is defined.
						if (currentChannelData->tot != 0)
						{
							PTTToggledDown = true;
						}
					}
					else
					{
						PTTToggledDown = false;
					}
				}
			}

			if (PTTToggledDown && ((buttons & BUTTON_PTT) == 0))
			{
				buttons |= BUTTON_PTT;
			}
		}
		else
		{
			if (PTTToggledDown)
			{
				PTTToggledDown = false;
			}
		}

		hasSignal = false;

		if(trxGetMode()== RADIO_MODE_ANALOG)
		{
			hasSignal = trxCheckAnalogSquelch();
		}
		else
		{
			if (slotState == DMR_STATE_IDLE)
			{
				trxReadRSSIAndNoise(false);

				hasSignal = trxCheckDigitalSquelch();
			}
			else
			{
				if (ticksTimerHasExpired((ticksTimer_t *)&readDMRRSSITimer))
				{
					trxReadRSSIAndNoise(false);
					ticksTimerStart((ticksTimer_t *)&readDMRRSSITimer, 10000); // hold of for a very long time
				}
				hasSignal = true;
			}
		}

		if (!trxTransmissionEnabled && (updateLastHeard == true))
		{
			lastHeardListUpdate((uint8_t *)DMR_frame_buffer, false);
			updateLastHeard = false;
		}

		if ((nonVolatileSettings.hotspotType == HOTSPOT_TYPE_OFF) ||
				((nonVolatileSettings.hotspotType != HOTSPOT_TYPE_OFF) && (settingsUsbMode != USB_MODE_HOTSPOT))) // Do not filter anything in HS mode.
		{
			if ((uiDataGlobal.PrivateCall.state == PRIVATE_CALL_DECLINED) &&
					(slotState == DMR_STATE_IDLE))
			{
				menuPrivateCallClear();
			}

			if ((trxTransmissionEnabled == false) && (trxIsTransmitting == false) &&
					(uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA) && (nonVolatileSettings.privateCalls > ALLOW_PRIVATE_CALLS_OFF))
			{
				if (HRC6000GetReceivedTgOrPcId() == (trxDMRID | (PC_CALL_FLAG << 24)))
				{
					int receivedSrcId = HRC6000GetReceivedSrcId();

					if ((uiDataGlobal.PrivateCall.state == PRIVATE_CALL_NOT_IN_CALL) &&
							(trxTalkGroupOrPcId != (receivedSrcId | (PC_CALL_FLAG << 24))) &&
							(receivedSrcId != uiDataGlobal.PrivateCall.lastID))
					{
						if ((receivedSrcId & 0xFFFFFF) >= 1000000)
						{
							menuSystemPushNewMenu(UI_PRIVATE_CALL);
						}
					}
				}
			}
		}

		if (button_event == EVENT_BUTTON_CHANGE)
		{
			// Toggle backlight
			if (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_MANUAL)
			{
				if (buttons == BUTTON_SK1) // SK1 alone
				{
					displayEnableBacklight(! displayIsBacklightLit(), nonVolatileSettings.displayBacklightPercentageOff);
				}
			}
			else
			{
				displayLightTrigger(true);
			}
			if ((buttons & BUTTON_PTT) != 0)
			{
				int currentMenu = menuSystemGetCurrentMenuNumber();

				if ((trxGetMode() != RADIO_MODE_NONE) &&
						(settingsUsbMode != USB_MODE_HOTSPOT) &&
						(currentMenu != UI_POWER_OFF) &&
						(currentMenu != UI_SPLASH_SCREEN) &&
						(currentMenu != UI_TX_SCREEN)&&
						(currentMenu != MENU_CALIBRATION))
				{
					bool wasScanning = false;

					if (uiDataGlobal.Scan.active || uiDataGlobal.Scan.toneActive)
					{
						if (currentMenu == UI_VFO_MODE)
						{
							uiVFOModeStopScanning();
						}
						else
						{
							uiChannelModeStopScanning();
						}
						wasScanning = true;
					}
					else
					{
						if (currentMenu == UI_LOCK_SCREEN)
						{
							menuLockScreenPop();
						}
					}

					currentMenu = menuSystemGetCurrentMenuNumber();

					if (wasScanning)
					{
						// Mode was blinking, hence it needs to be redrawn as it could be in its hidden phase.
						uiUtilityRedrawHeaderOnly(false, false);
					}
					else
					{
						if (((currentMenu == UI_MESSAGE_BOX) && (menuSystemGetPreviousMenuNumber() == UI_PRIVATE_CALL))
								&& (nonVolatileSettings.privateCalls == ALLOW_PRIVATE_CALLS_PTT))
						{
							acceptPrivateCall(uiDataGlobal.receivedPcId, uiDataGlobal.receivedPcTS);
							menuPrivateCallDismiss();
						}
						else if (((currentMenu == MENU_CONTACT_LIST_SUBMENU) || (currentMenu == MENU_CONTACT_QUICKLIST)) && dtmfSequenceIsKeying())
						{
							dtmfSequenceReset();
						}

						// Need to call menuSystemGetCurrentMenuNumber() again, as something has probably
						// changed since last above calls
						if (menuSystemGetCurrentMenuNumber() != UI_MESSAGE_BOX)
						{
							rxPowerSavingSetState(ECOPHASE_POWERSAVE_INACTIVE);

							menuSystemPushNewMenu(UI_TX_SCREEN);
						}
						else
						{
							button_event = EVENT_BUTTON_NONE;
							buttons &= ~BUTTON_PTT;
						}
					}
				}
			}
		}

		ev.function = 0;
		function_event = NO_EVENT;
		keyFunction = NO_EVENT;
		int currentMenu = menuSystemGetCurrentMenuNumber();
		if (KEYCHECK_SHORTUP_NUMBER(keys) && (buttons & BUTTON_SK2) && ((currentMenu == UI_VFO_MODE) || (currentMenu == UI_CHANNEL_MODE)))
		{
			keyFunction = codeplugGetQuickkeyFunctionID(keys.key);
			int menuFunction = QUICKKEY_MENUID(keyFunction);

#if 0 // For demo screen
			if (keys.key == '0')
			{
				static uint8_t demo = 90;
				keyFunction = (UI_HOTSPOT_MODE << 8) | demo; // Hotspot demo mode (able to take screengrabs)

				if (++demo > 99)
				{
					demo = 90;
				}
			}
#endif

#if defined(PLATFORM_RD5R)
			if (keys.key == '5')
			{
				menuFunction = 0;
				keyFunction = FUNC_TOGGLE_TORCH;
				keyboardReset();
			}
			else
			{
#endif
				if ((keyFunction != 0) &&
						((currentMenu == UI_CHANNEL_MODE) || (currentMenu == UI_VFO_MODE) || (currentMenu == menuFunction)))
				{
					if (QUICKKEY_TYPE(keyFunction) == QUICKKEY_MENU)
					{
						bool inChannelMenu;
						bool qkIsValid = true;

						//
						// QuickMenu special cases:
						//
						//   It's permited to share filter quickkeys between Channels and VFO screen.
						//   For this, the itemIndex value needs to be tweaked.
						//
						//   Other QuickMenu entries will simply be ignored if the current Channel/VFO screen doesn't
						//   match the QuickKey menuId.
						//
						if ((inChannelMenu = (currentMenu == UI_CHANNEL_MODE)) || (currentMenu == UI_VFO_MODE))
						{
							// The current QuickKey menu destination doesn't match the current menu (Channel or VFO)
							if (menuFunction == (inChannelMenu ? UI_VFO_QUICK_MENU : UI_CHANNEL_QUICK_MENU))
							{
								int entryId = QUICKKEY_ENTRYID(keyFunction);

								// Convert filters positions
								if ((entryId >= (inChannelMenu ? VFO_SCREEN_QUICK_MENU_FILTER_FM : CH_SCREEN_QUICK_MENU_FILTER_FM))
										&& (entryId <= (inChannelMenu ? VFO_SCREEN_QUICK_MENU_FILTER_DMR_TS : CH_SCREEN_QUICK_MENU_FILTER_DMR_TS)))
								{
									// Apply entry offset to match the filter position on the opposite screen
									if (inChannelMenu)
									{
#if defined(PLATFORM_DM1801)
										entryId -= 1;
#else
										entryId -= 2;
#endif
									}
									else
									{
#if defined(PLATFORM_DM1801)
										entryId += 1;
#else
										entryId += 2;
#endif
									}

									int kf = QUICKKEY_MENUVALUE((inChannelMenu ? UI_CHANNEL_QUICK_MENU : UI_VFO_QUICK_MENU), entryId, QUICKKEY_FUNCTIONID(keyFunction));
									keyFunction = kf;
									menuFunction = (inChannelMenu ? UI_CHANNEL_QUICK_MENU : UI_VFO_QUICK_MENU);
								}
								else
								{
									// We can't use other VFO/Channel QuickMenu entry in a mismatching screen.
									qkIsValid = false;
									keyFunction = NO_EVENT;
								}
							}
						}

						if (qkIsValid)
						{
							if ((menuFunction > 0) && (menuFunction < NUM_MENU_ENTRIES))
							{
								if (currentMenu != menuFunction)
								{
									menuSystemPushNewMenu(menuFunction);

									// Store the beep build by the new menu status. It will be restored after
									// the call of menuSystemCallCurrentMenuTick(), below
									quickkeyPushedMenuMelody = nextKeyBeepMelody;
								}
							}
							ev.function = keyFunction;
							buttons = BUTTON_NONE;
							rotary = 0;
							key_event = EVENT_KEY_NONE;
							button_event = EVENT_BUTTON_NONE;
							rotary_event = EVENT_ROTARY_NONE;
							keys.key = 0;
							keys.event = 0;
							function_event = FUNCTION_EVENT;
						}
						else
						{
							menuFunction = 0;
						}
					}
					else if ((QUICKKEY_TYPE(keyFunction) == QUICKKEY_CONTACT) && (currentMenu != menuFunction))
					{
						int contactIndex = QUICKKEY_CONTACTVALUE(keyFunction);

						if ((contactIndex >= CODEPLUG_CONTACTS_MIN) && (contactIndex <= CODEPLUG_CONTACTS_MAX))
						{
							if (codeplugContactGetDataForIndex(contactIndex, &currentContactData))
							{
								// Use quickkey contact as overrides (contact and its TS, if any)
								menuPrivateCallClear();
								setOverrideTGorPC(currentContactData.tgNumber, (currentContactData.callType == CONTACT_CALLTYPE_PC));

								trxTalkGroupOrPcId = currentContactData.tgNumber;
								if (currentContactData.callType == CONTACT_CALLTYPE_PC)
								{
									trxTalkGroupOrPcId |= (PC_CALL_FLAG << 24);
								}

								// Contact has a TS override set
								if ((currentContactData.reserve1 & 0x01) == 0x00)
								{
									int ts = ((currentContactData.reserve1 & 0x02) >> 1);
									trxSetDMRTimeSlot(ts, true);
									tsSetManualOverride(((menuSystemGetRootMenuNumber() == UI_CHANNEL_MODE) ? CHANNEL_CHANNEL : (CHANNEL_VFO_A + nonVolatileSettings.currentVFONumber)), (ts + 1));
								}
								ev.function = FUNC_REDRAW;
								function_event = FUNCTION_EVENT;
							}
						}
					}
				}
				keyboardReset();
#if defined(PLATFORM_RD5R)
			}
#endif
		}
		ev.buttons = buttons;
		ev.keys = keys;
		ev.rotary = rotary;
		ev.events = function_event | (button_event << 1) | (rotary_event << 3) | key_event;
		ev.hasEvent = keyOrButtonChanged || (function_event != NO_EVENT);
		ev.time = ticksGetMillis();


		// Clear the Quickkey slot on SK2 + longdown 0..9 KEY
		if (KEYCHECK_LONGDOWN_NUMBER(ev.keys) && BUTTONCHECK_DOWN(&ev, BUTTON_SK2))
		{
			// Only allow quick keys to be cleared on the 2 main screens
			if (currentMenu == UI_CHANNEL_MODE || currentMenu == UI_VFO_MODE)
			{
				saveQuickkeyMenuLongValue(ev.keys.key, 0, 0);
				soundSetMelody(MELODY_QUICKKEYS_CLEAR_ACK_BEEP);
			}
			else
			{
				soundSetMelody(MELODY_NACK_BEEP);
			}

			// Reset keyboard and event, as this keyboard event HAVE to
			// be ignore by the current menu.
			keyboardReset();
			ev.buttons = BUTTON_NONE;
			ev.keys.event = 0;
			ev.keys.key = 0;
			ev.rotary = 0;
			ev.events = NO_EVENT;
			ev.hasEvent = false;
		}




		menuSystemCallCurrentMenuTick(&ev);


		// Restore the beep built when a menu was pushed by the quickkey above.
		if (quickkeyPushedMenuMelody)
		{
			nextKeyBeepMelody = quickkeyPushedMenuMelody;
			quickkeyPushedMenuMelody = NULL;
			ev.keys.event = KEY_MOD_UP; // Trick to force keyBeepHandler() to set that beep
		}

		// Beep sounds aren't allowed in these modes.
		if (((nonVolatileSettings.audioPromptMode == AUDIO_PROMPT_MODE_SILENT) || voicePromptsIsPlaying()) /*|| (nonVolatileSettings.audioPromptMode == AUDIO_PROMPT_MODE_VOICE)*/)
		{
			if (melody_play != NULL)
			{
				soundStopMelody();
			}

			(void)rxBeepsHandler(); // It will remain silent, only clearing the rxToneState bits.
		}
		else
		{
			if (rxBeepsHandler() == false)
			{
				if ((menuSystemGetCurrentMenuNumber() != UI_SPLASH_SCREEN) &&
						((((key_event == EVENT_KEY_CHANGE) || (button_event == EVENT_BUTTON_CHANGE))
								&& ((buttons & BUTTON_PTT) == 0) && (ev.keys.key != 0))
								|| (function_event == FUNCTION_EVENT)))
				{
					keyBeepHandler(&ev, PTTToggledDown);
				}
			}
		}

		if (uiNotificationHasTimedOut())
		{
			uiNotificationHide(true);
		}

		batteryChecking();

#if !defined(PLATFORM_GD77S)
		// APO checkings
		apoTick((keyOrButtonChanged || (function_event != NO_EVENT) ||
				(settingsIsOptionBitSet(BIT_APO_WITH_RF) ? (getAudioAmpStatus() & AUDIO_AMP_MODE_RF) : false)));
#endif

		if (((nonVolatileSettings.backlightMode == BACKLIGHT_MODE_AUTO)
				|| (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_BUTTONS)
				|| (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_SQUELCH)) && (menuDataGlobal.lightTimer > 0))
		{
			// Countdown only in (AUTO), (BUTTONS) or (SQUELCH + no audio)
			if ((nonVolatileSettings.backlightMode == BACKLIGHT_MODE_AUTO) || (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_BUTTONS) ||
					((nonVolatileSettings.backlightMode == BACKLIGHT_MODE_SQUELCH) && ((getAudioAmpStatus() & AUDIO_AMP_MODE_RF) == 0)))
			{
				menuDataGlobal.lightTimer--;
			}

			if (menuDataGlobal.lightTimer == 0)
			{
				displayEnableBacklight(false, nonVolatileSettings.displayBacklightPercentageOff);
			}
		}

		voicePromptsTick();
		soundTickMelody();
		voxTick();
		gpsTick();
		settingsSaveIfNeeded(false);
		if (!trxTransmissionEnabled && !trxIsTransmitting)
		{
			rxPowerSavingTick(&ev, hasSignal);
		}
		int latestVolume = getVolumeControl();
		if (latestVolume != lastVolume)
		{
			lastVolume = latestVolume;
			HRC6000SetDmrRxGain(latestVolume);
			//USB_DEBUG_printf("%d\n",s);
		}

		while(ticksGetMillis() < startTime + 1)				// ensure this Task runs at 1ms intervals. Regardless of clock speed.
		{
		vTaskDelay(0);
		}
	}
}
