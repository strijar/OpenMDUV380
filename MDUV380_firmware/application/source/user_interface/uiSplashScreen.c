/*
 * Copyright (C) 2019-2022 Roger Clark, VK3KYY / G4KYF
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

#include <lvgl.h>
#include "user_interface/styles.h"

#include "user_interface/uiSplashScreen.h"
#include "functions/settings.h"
#include "user_interface/uiUtilities.h"
#include "functions/codeplug.h"
#include "user_interface/uiLocalisation.h"
#include "functions/ticks.h"

void uiSplashScreen() {
	lv_obj_t *main_obj = lv_obj_create(NULL);

	lv_obj_set_style_bg_img_src(main_obj, &wallpaper, LV_PART_MAIN);

	lv_obj_t *obj = lv_label_create(main_obj);

	lv_label_set_text(obj, "OpenMDUV-NG");
	lv_obj_add_style(obj, &splash_item_style, 0);
	lv_obj_set_height(obj, 28);
	lv_obj_set_pos(obj, 2, 2);

	/* * */

	char line1[(SCREEN_LINE_BUFFER_SIZE * 2) + 1];
	char line2[SCREEN_LINE_BUFFER_SIZE];

	codeplugGetBootScreenData(line1, line2, NULL);

	obj = lv_label_create(main_obj);

	lv_label_set_text_fmt(obj, "%s\n%s", line1, line2);
	lv_obj_add_style(obj, &splash_item_style, 0);
	lv_obj_set_height(obj, 44);
	lv_obj_center(obj);

	strcat(line1, " ");
	strcat(line1, line2);
	HRC6000SetTalkerAlias(line1);

	lv_scr_load(main_obj);

#if 0
	uint8_t melodyBuf[512];

	if (isFirstRun)
	{
#if ! defined(PLATFORM_GD77S)
		if (pinHandled)
		{
			pinHandled = false;
			keyboardReset();
		}
		else
		{
			int pinLength = codeplugGetPasswordPin(&pinCode);

			if (pinLength != 0)
			{
				snprintf(uiDataGlobal.MessageBox.message, MESSAGEBOX_MESSAGE_LEN_MAX, "%s", currentLanguage->pin_code);
				uiDataGlobal.MessageBox.type = MESSAGEBOX_TYPE_PIN_CODE;
				uiDataGlobal.MessageBox.pinLength = pinLength;
				uiDataGlobal.MessageBox.validatorCallback = validatePinCodeCallback;
				menuSystemPushNewMenu(UI_MESSAGE_BOX);

				(void)addTimerCallback(pincodeAudioAlert, 500, UI_MESSAGE_BOX, false); // Need to delay playing this for a while, because otherwise it may get played before the volume is turned up enough to hear it.
				return MENU_STATUS_SUCCESS;
			}
		}
#endif

		initialEventTime = ev->time;

#if defined(PLATFORM_GD77S)
		// Don't play boot melody when the 77S is already speaking, otherwise if will mute the speech halfway
		if (voicePromptsIsPlaying() == false)
#endif
		{
			if (codeplugGetOpenGD77CustomData(CODEPLUG_CUSTOM_DATA_TYPE_BEEP, melodyBuf))
			{
				if ((melodyBuf[0] == 0) && (melodyBuf[1] == 0))
				{
					char line1[(SCREEN_LINE_BUFFER_SIZE * 2) + 1];
					char line2[SCREEN_LINE_BUFFER_SIZE];
					uint8_t bootScreenType;

					exitSplashScreen();

					// Load TA text even if Splash screen is not shown
					codeplugGetBootScreenData(line1, line2, &bootScreenType);
					HRC6000SetTalkerAlias(line1);

					return MENU_STATUS_SUCCESS;
				}
				else
				{
					soundCreateSong(melodyBuf);
					soundSetMelody(melody_generic);
				}
			}
			else
			{
				soundSetMelody(MELODY_POWER_ON);
			}
		}

		updateScreen();
	}
	else
	{
		handleEvent(ev);
	}

	return MENU_STATUS_SUCCESS;
#endif
}

#if 0
static void updateScreen(void)
{
	char line1[(SCREEN_LINE_BUFFER_SIZE * 2) + 1];
	char line2[SCREEN_LINE_BUFFER_SIZE];
	uint8_t bootScreenType;
	bool customDataHasImage = false;

	codeplugGetBootScreenData(line1, line2, &bootScreenType);

	if (bootScreenType == 0)
	{
#if defined (PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
		uint8_t *dataBuf = (uint8_t *)displayGetScreenBuffer();

		displayClearBuf();
		customDataHasImage = codeplugGetOpenGD77CustomData(CODEPLUG_CUSTOM_DATA_TYPE_IMAGE, dataBuf);
		if (customDataHasImage)
		{
			displayConvertGD77ImageData(dataBuf);
		}
#else
		customDataHasImage = codeplugGetOpenGD77CustomData(CODEPLUG_CUSTOM_DATA_TYPE_IMAGE, (uint8_t *)displayGetScreenBuffer());
#endif

	}

	if (!customDataHasImage)
	{
		displayClearBuf();

#if defined(PLATFORM_RD5R)
		displayPrintCentered(0, "OpenRD5R", FONT_SIZE_3);
#elif defined(PLATFORM_GD77)
		displayPrintCentered(8, "OpenGD77", FONT_SIZE_3);
#elif defined(PLATFORM_DM1801)
		displayPrintCentered(8, "OpenDM1801", FONT_SIZE_3);
#elif defined(PLATFORM_DM1801A)
		displayPrintCentered(8, "OpenDM1801A", FONT_SIZE_3);
#elif defined(PLATFORM_MD9600)
		displayPrintCentered(8, "OpenMD9600", FONT_SIZE_3);
#elif defined(PLATFORM_MDUV380)
		displayPrintCentered(8, "OpenMDUV380", FONT_SIZE_3);
#elif defined(PLATFORM_MD380)
		displayPrintCentered(8, "OpenMD380", FONT_SIZE_3);
#elif defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)		
	displayPrintCentered(8, "OpenDM1701", FONT_SIZE_3);
#endif

		displayPrintCentered((DISPLAY_SIZE_Y / 4) * 2, line1, FONT_SIZE_3);
		displayPrintCentered((DISPLAY_SIZE_Y / 4) * 3, line2, FONT_SIZE_3);
	}

	strcat(line1, line2);
	HRC6000SetTalkerAlias(line1);

	displayRender();
}

static void handleEvent(uiEvent_t *ev)
{
	if (nonVolatileSettings.audioPromptMode != AUDIO_PROMPT_MODE_SILENT)
	{
		if ((melody_play == NULL) || (ev->events != NO_EVENT))
		{
			// Any button or key event, stop the melody then leave
			if (melody_play != NULL)
			{
				soundStopMelody();
			}

			exitSplashScreen();
		}
	}
	else
	{
		if ((ev->events != NO_EVENT) || ((ev->time - initialEventTime) > SILENT_PROMPT_HOLD_DURATION_MILLISECONDS))
		{
			exitSplashScreen();
		}
	}
}

static void exitSplashScreen(void)
{
	menuSystemSetCurrentMenu(nonVolatileSettings.initialMenuNumber);
}

#if ! defined(PLATFORM_GD77S)
static bool validatePinCodeCallback(void)
{
	if (uiDataGlobal.MessageBox.keyPressed == KEY_GREEN)
	{
		if (freqEnterRead(0, uiDataGlobal.MessageBox.pinLength, false) == pinCode)
		{
			pinHandled = true;
			return true;
		}
	}
	else if (uiDataGlobal.MessageBox.keyPressed == KEY_RED)
	{
		freqEnterReset();
	}

	return false;
}

static void pincodeAudioAlert(void)
{
	if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
	{
		voicePromptsInit();
		voicePromptsAppendLanguageString(&currentLanguage->pin_code);
		voicePromptsPlay();
	}
	else
	{
		soundSetMelody(MELODY_ACK_BEEP);
	}
}

#endif

#endif
