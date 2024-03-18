/*
 * Copyright (C) 2019-2023 Roger Clark, VK3KYY / G4KYF
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
#include "user_interface/menuSystem.h"
#include "user_interface/uiLocalisation.h"
#include "user_interface/uiUtilities.h"


enum
{
	FIRMWARE_INFO_BUILD_DETAILS = 0 /* then all credits pages */
};

#if defined(PLATFORM_RD5R)
#define maxDisplayedCreditsLines  3
#elif defined(PLATFORM_MD380) || defined(PLATFORM_MDUV380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
#define maxDisplayedCreditsLines  11
#else
#define maxDisplayedCreditsLines  5
#endif

static const char *creditTexts[] = { "Roger VK3KYY", "Daniel F1RMB", "Kai DG4KLU", "Colin G4EML", "Alex DL4LEX", "Dzmitry EW1ADG", "Jason VK7ZJA" };
static const int maxCredits = (sizeof(creditTexts) / sizeof(creditTexts[0]));
static const int maxCreditsPages = (maxCredits / maxDisplayedCreditsLines) + ((maxCredits % maxDisplayedCreditsLines) == 0 ? 0 : 1);

static void displayCredits(bool playVP, uint32_t pageNumber);
static void displayBuildDetails(bool playVP);
static void updateScreen(bool playVP);
static void handleEvent(uiEvent_t *ev);
static int displayMode = FIRMWARE_INFO_BUILD_DETAILS;
static uint32_t menuFirmwareInfoNextUpdateTime;
static bool blink = false;

menuStatus_t menuFirmwareInfoScreen(uiEvent_t *ev, bool isFirstRun)
{
	if (isFirstRun)
	{
		menuDataGlobal.numItems = 0;
		updateScreen(isFirstRun);
	}
	else
	{
		if (ev->time > menuFirmwareInfoNextUpdateTime)
		{
			menuFirmwareInfoNextUpdateTime = ev->time + 500;
			updateScreen(false);
		}

		if (ev->hasEvent)
		{
			handleEvent(ev);
		}
	}
	return MENU_STATUS_SUCCESS;
}

static void updateScreen(bool playVP)
{
	switch(displayMode)
	{
		case FIRMWARE_INFO_BUILD_DETAILS:
			displayBuildDetails(playVP);
			break;

		default:
			displayCredits(playVP, displayMode);
			break;
	}

	blink = !blink;
}


static void handleEvent(uiEvent_t *ev)
{
	if (ev->events & BUTTON_EVENT)
	{
		if (repeatVoicePromptOnSK1(ev))
		{
			return;
		}
	}

	if ((ev->events & FUNCTION_EVENT) && (ev->function == FUNC_REDRAW))
	{
		updateScreen(false);
		return;
	}

	if (EVENTCHECK_SHORTUP(ev->keys))
	{
		switch(ev->keys.key)
		{
			case KEY_RED:
				menuSystemPopPreviousMenu();
				return;
				break;

			case KEY_UP:
				if (displayMode > FIRMWARE_INFO_BUILD_DETAILS)
				{
					displayMode--;
					updateScreen(true);
				}
				break;

			case KEY_DOWN:
				if (displayMode < maxCreditsPages)
				{
					displayMode++;
					updateScreen(true);
				}
				break;
		}
	}
}

static void displayBuildDetails(bool playVP)
{
#if !defined(PLATFORM_GD77S)
	char versionBuf[SCREEN_LINE_BUFFER_SIZE];
	const char *radioModel = currentLanguage->openGD77;
	char dateTimeBuf[SCREEN_LINE_BUFFER_SIZE];

	displayClearBuf();

	sprintf(dateTimeBuf, "%d%02d%02d%02d%02d%02d", BUILD_YEAR, BUILD_MONTH, BUILD_DAY, BUILD_HOUR, BUILD_MIN, BUILD_SEC);

#if defined(PLATFORM_MD9600) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
	snprintf(versionBuf, SCREEN_LINE_BUFFER_SIZE, "[ %s", XSTRINGIFY(GITVERSION));
#else
	snprintf(versionBuf, SCREEN_LINE_BUFFER_SIZE, "[ %s", GITVERSION);
#endif
	versionBuf[9] = 0; // git hash id 7 char long;
	strcat(versionBuf, (uiDataGlobal.dmrDisabled ? " F ]" : " D ]"));


#if defined(PLATFORM_RD5R)
	displayPrintCentered(0, radioModel, FONT_SIZE_3);
	displayPrintCentered(10, currentLanguage->built, FONT_SIZE_2);
	displayPrintCentered(20, dateTimeBuf , FONT_SIZE_2);
	displayPrintCentered(30, versionBuf, FONT_SIZE_2);
#else
	displayPrintCentered(5, radioModel, FONT_SIZE_3);
	displayPrintCentered(20, currentLanguage->built, FONT_SIZE_2);
	displayPrintCentered(30, dateTimeBuf , FONT_SIZE_2);
	displayPrintCentered(40, versionBuf, FONT_SIZE_2);
#endif

// STM32 platforms (Genuine or Clone)
#if defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_MD9600) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
	char cpuTypeBuf[SCREEN_LINE_BUFFER_SIZE] = {0};

#if defined(PLATFORM_MD9600)
	strncpy(cpuTypeBuf,
#if defined(MD9600_VERSION_1)
			"HW v1 "
#elif defined(MD9600_VERSION_2)
			"HW v2 "
#elif defined(MD9600_VERSION_4)
			"HW v4 "
#elif defined(MD9600_VERSION_5)
			"HW v5 "
#endif
	, SCREEN_LINE_BUFFER_SIZE);
#endif

	strncat(cpuTypeBuf, (NumInterruptPriorityBits == 4) ? "CPU:STM" : " CPU:TYT", (SCREEN_LINE_BUFFER_SIZE - (strlen(cpuTypeBuf) - 1)));
	displayPrintCentered(50, cpuTypeBuf , FONT_SIZE_2);
#endif

	if (playVP && (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_THRESHOLD))
	{
		voicePromptsInit();
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		voicePromptsAppendLanguageString(radioModel);
		voicePromptsAppendLanguageString(currentLanguage->built);
		voicePromptsAppendString(dateTimeBuf);
		voicePromptsAppendLanguageString(currentLanguage->gitCommit);
		voicePromptsAppendString(versionBuf);
#if defined(PLATFORM_MD9600) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
		voicePromptsAppendString(cpuTypeBuf);
#endif
		promptsPlayNotAfterTx();
	}

	displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
	displayRender();
#endif
}

static void displayCredits(bool playVP, uint32_t pageNumber)
{
	if (playVP && (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_THRESHOLD))
	{
		voicePromptsInit();
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		voicePromptsAppendLanguageString(currentLanguage->credits);
		voicePromptsAppendLanguageString(currentLanguage->menu);
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		promptsPlayNotAfterTx();
	}

	displayClearBuf();
	menuDisplayTitle(currentLanguage->credits);

	pageNumber = (pageNumber - 1) * maxDisplayedCreditsLines;

	for(int i = pageNumber, y = 0; (i < (pageNumber + maxDisplayedCreditsLines)) && (i < maxCredits); i++, y++)
	{
		displayPrintCentered(y * 8 + 16, (char *)creditTexts[i], FONT_SIZE_1);
	}

	if ((maxCreditsPages > 1) && (pageNumber <= maxCreditsPages))
	{
		displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
	}

	displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);

	displayRender();
}
