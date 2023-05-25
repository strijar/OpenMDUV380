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
#include "user_interface/menuSystem.h"
#include "user_interface/uiLocalisation.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/colors.h"
#include "functions/settings.h"
#include "functions/ticks.h"

menuDataGlobal_t menuDataGlobal =
{
		.currentItemIndex 		= 0, // each menu can re-use this var to hold the position in their display list. To save wasted memory if they each had their own variable
		.startIndex 			= 0, // as above
		.numItems 				= 0, // as above
		.lightTimer 			= -1,
		.currentMenuList		= NULL,

		.controlData =
		{
				.stackPosition 	= 0,
				.stack 			=
				{
						MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY
				}
		},

		/*
		 * ---------------------- IMPORTANT ----------------------------
		 *
		 * The menuFunctions array and the menusData array.....
		 *
		 * MUST match the enum MENU_SCREENS in menuSystem.h
		 *
		 * ---------------------- IMPORTANT ----------------------------
		 */
		.data 					=
		{
				&menuDataMainMenu,
				&menuDataContact,
				NULL,// zone
				NULL,// RadioInfos
				NULL,// RSSI
				NULL,// LastHeard
				&menuDataOptions,// Options
				NULL,// General options
				NULL,// Radio options
				NULL,// Display options
				NULL,// Sound options
				NULL,// SatelliteScreen
				NULL,// GPS
				NULL,// Contact List
				NULL,// DTMF Contact List
				NULL,// Contact Quick List (SK2+#)
				NULL,// Contact List Quick Menu
				NULL,// Contact Details
				NULL,// Language
				NULL,// Quick menu - Channel
				NULL,// Quick menu - VFO
				NULL,// Calibration
				NULL,// Channel Details
				// *** Add new menus to be accessed using quickkey (ID: 0..31) above this line ***
				NULL,// MessageBox
				NULL,// hotspot mode
				NULL,// CPS
				NULL,// Numerical entry
				NULL,// Tx
				NULL,// splash
				NULL,// power off
				NULL,// vfo mode
				NULL,// channel mode
				NULL,// Firmwareinfo
				NULL,// Lock screen
				NULL,// Private Call
				NULL,// New Contact

		}
};

static menuFunctionData_t menuFunctions[] =
{
		{ menuDisplayMenuList,      0 },// display Main menu using the menu display system
		{ menuDisplayMenuList,      0 },// display Contact menu using the menu display system
		{ menuZoneList,             0 },
		{ menuRadioInfos,           0 },
		{ menuRSSIScreen,           0 },
		{ menuLastHeard,            0 },
		{ menuDisplayMenuList,      0 },
		{ menuGeneralOptions,	    0 },
		{ menuRadioOptions,			0 },
		{ menuDisplayOptions,       0 },
		{ menuSoundOptions,         0 },
		{ menuSatelliteScreen,      0 },
		{ menuGPS, 		            0 },
		{ menuContactList,          0 },
		{ menuContactList,          0 },
		{ menuContactList,          0 },
		{ menuContactListSubMenu,   0 },
		{ menuContactDetails,       0 },
		{ menuLanguage,             0 },
		{ NULL,   					0 },	/* Was uiChannelModeQuickMenu */
		{ NULL,       				0 },	/* Was uiVFOModeQuickMenu */
		{ menuCalibration,          0 },
		{ menuChannelDetails,       0 },
		{ menuFirmwareInfoScreen,   0 },
		// *** Add new menus to be accessed using quickkey (ID: 0..31) above this line ***
		{ uiMessageBox,             0 },
		{ menuHotspotMode,          0 },
		{ uiCPS,                    0 },
		{ menuNumericalEntry,       0 },
		{ NULL,             		0 },	/* Was menuTxScreen */
		{ NULL,           			0 },	/* Was Splash */
		{ NULL,               		0 },	/* Was Poweroff	*/
		{ NULL,                		0 },	/* Was VFOMode */
		{ NULL,            			0 },	/* Was ChannelMode */
		{ menuLockScreen,           0 },
		{ menuPrivateCall,          0 },
		{ menuContactDetails,       0 }, // Contact New
};

static void menuSystemCheckForFirstEntryAudible(menuStatus_t status)
{
	if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_BEEP)
	{
		// If VP is currently playing, we should not set the next beep, otherwise it
		// will be played at the wrong time (e.g  entering TG/PC input window, ACK beep will be
		// played on the next beep playback event
		if ((nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1) && voicePromptsIsPlaying())
		{
			return;
		}

		if (status & MENU_STATUS_ERROR)
		{
			nextKeyBeepMelody = (int *)MELODY_ERROR_BEEP;
		}
		else if (((status & MENU_STATUS_LIST_TYPE) && (menuDataGlobal.currentItemIndex == 0)) || (status & MENU_STATUS_FORCE_FIRST))
		{
			nextKeyBeepMelody = (int *)MELODY_KEY_BEEP_FIRST_ITEM;
		}
		else if (status & MENU_STATUS_INPUT_TYPE)
		{
			nextKeyBeepMelody = (int *)MELODY_ACK_BEEP;
		}
	}
}

static void menuSystemPushMenuFirstRun(void)
{
	uiEvent_t ev = { .buttons = 0, .keys = NO_KEYCODE, .rotary = 0, .function = 0, .events = NO_EVENT, .hasEvent = false, .time = ticksGetMillis() };
	menuStatus_t status;

	if (uiNotificationIsVisible())
	{
		uiNotificationHide(false);
	}

	// Due to QuickKeys, menu list won't go through menuDisplayMenuList() first, so those
	// two members won't get always initialized. Hence, we need to tag them as uninitialized,
	// and check if they got initialized after entering a menu.
	menuDataGlobal.numItems = INT32_MIN;
	menuDataGlobal.currentMenuList = NULL;
	menuDataGlobal.currentItemIndex = menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].lastItemIndex;
	displayLightTrigger(false);
	status = menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].function(&ev, true);

	if (menuDataGlobal.numItems == INT32_MIN)
	{
		menuDataGlobal.numItems = ((menuDataGlobal.data[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]] != NULL) ? menuDataGlobal.data[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]]->numItems : 0);
	}

	if (menuDataGlobal.currentMenuList == NULL)
	{
		menuDataGlobal.currentMenuList = ((menuDataGlobal.data[menuDataGlobal.controlData.stackPosition] != NULL) ? (menuItemNewData_t *)menuDataGlobal.data[menuDataGlobal.controlData.stackPosition]->items : NULL);
	}

	if (menuDataGlobal.currentItemIndex > menuDataGlobal.numItems)
	{
		menuDataGlobal.currentItemIndex = 0;
	}
	menuSystemCheckForFirstEntryAudible(status);
}

int menuSystemGetLastItemIndex(int stackPos)
{
	if ((stackPos >= 0) && (stackPos <= menuDataGlobal.controlData.stackPosition))
	{
		return menuFunctions[menuDataGlobal.controlData.stack[stackPos]].lastItemIndex;
	}

	return -1;
}

void menuSystemPushNewMenu(int menuNumber)
{
	if (menuDataGlobal.controlData.stackPosition < 15)
	{
		keyboardReset();
		menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].lastItemIndex = menuDataGlobal.currentItemIndex;
		menuDataGlobal.controlData.stackPosition++;
		menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition] = menuNumber;
#if defined(PLATFORM_MD9600)
		if ((menuNumber != UI_VFO_MODE) && (menuNumber != UI_CHANNEL_MODE))
		{
			uiDataGlobal.sk2latched = false;
		}
#endif
		menuSystemPushMenuFirstRun();
	}
}

void menuSystemPopPreviousMenu(void)
{
	keyboardReset();
	menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].lastItemIndex = menuDataGlobal.currentItemIndex;
	// Clear stackPosition + 1 menu trace
	if (menuDataGlobal.controlData.stackPosition < 15)
	{
		menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition + 1] = MENU_EMPTY;
	}

	// Avoid crashing if something goes wrong.
	if (menuDataGlobal.controlData.stackPosition > 0)
	{
		menuDataGlobal.controlData.stackPosition -= 1;
	}
	menuSystemPushMenuFirstRun();
}

void menuSystemPopAllAndDisplayRootMenu(void)
{
	keyboardReset();
	menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].lastItemIndex = menuDataGlobal.currentItemIndex;
	// MENU_EMPTY is equal to -1 (0xFFFFFFFF), hence the following works, even if it's an int32_t array
	memset(&menuDataGlobal.controlData.stack[1], MENU_EMPTY, sizeof(menuDataGlobal.controlData.stack) - sizeof(int));
	menuDataGlobal.controlData.stackPosition = 0;
	menuSystemPushMenuFirstRun();
}

void menuSystemPopAllAndDisplaySpecificRootMenu(int newRootMenu, bool resetKeyboard)
{
	if (resetKeyboard)
	{
		keyboardReset();
	}
	menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].lastItemIndex = menuDataGlobal.currentItemIndex;
	// MENU_EMPTY is equal to -1 (0xFFFFFFFF), hence the following works, even if it's an int32_t array
	memset(&menuDataGlobal.controlData.stack[1], MENU_EMPTY, sizeof(menuDataGlobal.controlData.stack) - sizeof(int));
	menuDataGlobal.controlData.stack[0] = newRootMenu;
	menuDataGlobal.controlData.stackPosition = 0;
	menuSystemPushMenuFirstRun();
}

void menuSystemSetCurrentMenu(int menuNumber)
{
	keyboardReset();
	menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition] = menuNumber;
	menuSystemPushMenuFirstRun();
}

int menuSystemGetCurrentMenuNumber(void)
{
	return menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition];
}

int menuSystemGetPreviousMenuNumber(void)
{
	if (menuDataGlobal.controlData.stackPosition >= 1)
	{
		return menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition - 1];
	}

	return MENU_ANY;
}

int menuSystemGetPreviouslyPushedMenuNumber(void)
{
	if (menuDataGlobal.controlData.stackPosition < 15)
	{
		int m = menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition + 1];
		menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition + 1] = MENU_EMPTY;
		return m;
	}

	return MENU_EMPTY;
}

int menuSystemGetRootMenuNumber(void)
{
	return menuDataGlobal.controlData.stack[0];
}

#define KEY_MAPPING_TYPE_2

static void menuSystemPreProcessEvent(uiEvent_t *ev)
{
	if (ev->hasEvent)
	{
		if ((!trxIsTransmitting) || (menuSystemGetCurrentMenuNumber() == MENU_CALIBRATION))
		{
			int currentMenu = menuSystemGetCurrentMenuNumber();

			if ((currentMenu != UI_CHANNEL_MODE) && (currentMenu != UI_VFO_MODE))
			{
				if ((currentMenu == MENU_NUMERICAL_ENTRY) && (trxGetMode() == RADIO_MODE_ANALOG))
				{
					switch(ev->keys.key)
					{
						case KEY_UP:
							ev->keys.key = KEY_RED;
							break;
					}
				}
				else
				{
					switch(ev->keys.key)
					{
						case KEY_ROTARY_INCREMENT:
							ev->keys.key = KEY_RIGHT;
							break;
						case KEY_ROTARY_DECREMENT:
							ev->keys.key = KEY_LEFT;
							break;
						case KEY_FRONT_UP:
							ev->keys.key = KEY_UP;
							break;
						case KEY_FRONT_DOWN:
							ev->keys.key = KEY_DOWN;
							break;

					}
				}

			}
			else
			{
#if !defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
				switch(ev->keys.key)
				{
					case KEY_UP:
						ev->keys.key = KEY_LEFT;
						break;
					case KEY_DOWN:
						ev->keys.key = KEY_RIGHT;
						break;
				}
#endif
			}
		}
		displayLightTrigger(true);
	}
	else
	{
		if (((uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA) && (nonVolatileSettings.backlightMode != BACKLIGHT_MODE_BUTTONS)) )
		{
			displayLightTrigger(true);
		}
	}
}

static void menuSystemPostProcessEvent(uiEvent_t *ev)
{
	if (uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA)
	{
		uiDataGlobal.displayQSOState = QSO_DISPLAY_IDLE;
	}
}

void menuSystemCallCurrentMenuTick(uiEvent_t *ev)
{
	menuStatus_t status;

	menuSystemPreProcessEvent(ev);
	status = menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].function(ev, false);
	menuSystemPostProcessEvent(ev);
	if (ev->hasEvent)
	{
		menuSystemCheckForFirstEntryAudible(status);
	}
}

void displayLightTrigger(bool fromKeyEvent)
{
	// BACKLIGHT_MODE_MANUAL is handled in main.c
	if ((menuSystemGetCurrentMenuNumber() != UI_TX_SCREEN) &&
			(((nonVolatileSettings.backlightMode == BACKLIGHT_MODE_AUTO) || (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_SQUELCH))
					|| ((nonVolatileSettings.backlightMode == BACKLIGHT_MODE_BUTTONS) && fromKeyEvent)))
	{
		menuDataGlobal.lightTimer = nonVolatileSettings.backLightTimeout * 1000;

		displayEnableBacklight(true, nonVolatileSettings.displayBacklightPercentageOff);
	}
}

// use -1 to force LED on all the time
void displayLightOverrideTimeout(int timeout)
{
	int prevTimer = menuDataGlobal.lightTimer;

	menuDataGlobal.lightTimer = timeout;

	if ((nonVolatileSettings.backlightMode == BACKLIGHT_MODE_AUTO) || (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_SQUELCH))
	{
		// Backlight is OFF, or timeout override (-1) as just been set
		if ((displayIsBacklightLit() == false) || ((timeout == -1) && (prevTimer != -1)))
		{
			displayEnableBacklight(true,nonVolatileSettings.displayBacklightPercentageOff);
		}
	}
}

void menuSystemInit(void)
{
	uiEvent_t ev = { .buttons = 0, .keys = NO_KEYCODE, .rotary = 0, .function = 0, .events = NO_EVENT, .hasEvent = false, .time = ticksGetMillis() };

	menuDataGlobal.lightTimer = -1;
	menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition] = UI_SPLASH_SCREEN;// set the very first screen as the splash screen
	menuDataGlobal.currentItemIndex = 0;

	if ((nonVolatileSettings.backlightMode == BACKLIGHT_MODE_MANUAL)
			|| (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_BUTTONS) || (nonVolatileSettings.backlightMode == BACKLIGHT_MODE_SQUELCH))
	{
		if (nonVolatileSettings.displayBacklightPercentageOff > 0)
		{
			displayEnableBacklight(false, nonVolatileSettings.displayBacklightPercentageOff);
		}
	}
	else
	{
		displayLightTrigger(false);
	}

	menuFunctions[menuDataGlobal.controlData.stack[menuDataGlobal.controlData.stackPosition]].function(&ev, true);// Init and display this screen
}

void menuSystemLanguageHasChanged(void)
{
}

const menuItemNewData_t mainMenuItems[] =
{
	{   3, MENU_ZONE_LIST       },
	{   6, MENU_CONTACTS_MENU   },
	{  12, MENU_CHANNEL_DETAILS },
	{   4, MENU_RSSI_SCREEN     },
	{   8, MENU_FIRMWARE_INFO   },
	{   9, MENU_OPTIONS         },
	{   7, MENU_LAST_HEARD      },
	{ 150, MENU_RADIO_INFOS     },
	{ 173, MENU_SATELLITE       },
	{ 195, MENU_GPS		        },
};

const menuItemsList_t menuDataMainMenu =
{
	.numItems = (sizeof(mainMenuItems) / sizeof(mainMenuItems[0])),
	.items = mainMenuItems
};

static const menuItemNewData_t contactMenuItems[] =
{
	{ 15,  MENU_CONTACT_LIST      },
	{ 139, MENU_DTMF_CONTACT_LIST },
	{ 14,  MENU_CONTACT_NEW       },
};

const menuItemsList_t menuDataContact =
{
	.numItems = (sizeof(contactMenuItems) / sizeof(contactMenuItems[0])),
	.items = contactMenuItems
};

static const menuItemNewData_t optionsMenuItems[] =
{
	{ 190, MENU_GENERAL },
	{ 191, MENU_RADIO },
	{  10, MENU_DISPLAY },
	{  11, MENU_SOUND   },
	{  206, MENU_CALIBRATION},
	{  13, MENU_LANGUAGE        },
};

const menuItemsList_t menuDataOptions =
{
	.numItems = (sizeof(optionsMenuItems) / sizeof(optionsMenuItems[0])),
	.items = optionsMenuItems
};

void menuDisplayTitle(const char *title)
{
	displaySetColours(MENU_TITLE_FG_COLOR, MENU_TITLE_BG_COLOR);
	displayFillRect(0, 0, DISPLAY_SIZE_X, 13, true);
	displayPrintCore(0, 3, title, FONT_SIZE_2, TEXT_ALIGN_CENTER, false);
	displaySetColours(MAIN_FG_COLOR, MAIN_BG_COLOR);
}

void menuDisplayEntry(int loopOffset, int focusedItem, const char *entryText)
{
	bool focused = (focusedItem == menuDataGlobal.currentItemIndex);

	displaySetColours(MENU_ENTRY_FG_COLOR, MENU_ENTRY_BG_COLOR);

	if (focused)
	{
		displayFillRect(0, DISPLAY_Y_POS_MENU_ENTRY_HIGHLIGHT + (loopOffset * MENU_ENTRY_HEIGHT), DISPLAY_SIZE_X, MENU_ENTRY_HEIGHT, false);
	}

	displayPrintCore(DISPLAY_X_POS_MENU_OFFSET, DISPLAY_Y_POS_MENU_ENTRY_HIGHLIGHT + (loopOffset * MENU_ENTRY_HEIGHT), entryText, FONT_SIZE_3, TEXT_ALIGN_LEFT, focused);
	displaySetColours(MAIN_FG_COLOR, MAIN_BG_COLOR);
}

// Returns menu offset, -1 if the line is before the first menu item, -2 if the line is after the last menu item
int menuGetMenuOffset(int maxMenuItems, int loopOffset)
{
	int offset = menuDataGlobal.currentItemIndex + loopOffset;
	int startOffset = 0;
	int iter = (loopOffset + (MENU_MAX_DISPLAYED_ENTRIES / 2) + 1);

	if (maxMenuItems < MENU_MAX_DISPLAYED_ENTRIES)
	{
		startOffset = (MENU_MAX_DISPLAYED_ENTRIES - maxMenuItems) / 2;

		if (iter <= startOffset)
		{
			return MENU_OFFSET_BEFORE_FIRST_ENTRY;
		}
		else if (iter > (startOffset + maxMenuItems))
		{
			return MENU_OFFSET_AFTER_LAST_ENTRY;
		}
	}

	if (offset < 0)
	{
		if ((maxMenuItems == 1) && (maxMenuItems < MENU_MAX_DISPLAYED_ENTRIES))
		{
			offset = MENU_MAX_DISPLAYED_ENTRIES - 1;
		}
		else
		{
			offset = maxMenuItems + offset;
		}
	}

	if (offset >= maxMenuItems)
	{
		offset = offset - maxMenuItems;
	}

	return offset;
}

/*
 * Returns 99 if key is unknown, or not numerical when digitsOnly is true
 */
int menuGetKeypadKeyValue(uiEvent_t *ev, bool digitsOnly)
{
	uint32_t keypadKeys[] =
	{
			KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9,
			KEY_FRONT_UP, 0, KEY_FRONT_DOWN, 0 , KEY_STAR, KEY_HASH
	};

	for (int i = 0; i < ((sizeof(keypadKeys) / sizeof(keypadKeys[0])) - (digitsOnly ? 6 : 0 )); i++)
	{
		if (KEYCHECK_PRESS(ev->keys, keypadKeys[i]))
		{
			if (BUTTONCHECK_DOWN(ev, BUTTON_SK1_OLD))
			{
				if (i == 10)
				{
					return 11;
				}
				else
				{
					if (i == 12)
					{
						return 13;
					}
				}
			}
			else
			{
				return i;
			}
		}
	}

	return 99;
}

void menuUpdateCursor(int pos, bool moved, bool render)
{
#if defined(PLATFORM_RD5R)
	const int MENU_CURSOR_Y = 32;
#elif defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
	const int MENU_CURSOR_Y = 78;
#else
	const int MENU_CURSOR_Y = 46;
#endif

	static uint32_t lastBlink = 0;
	static bool     blink = false;
	uint32_t        m = ticksGetMillis();

	if (moved)
	{
		blink = true;
	}

	if (moved || (m - lastBlink) > 500)
	{
		displayDrawFastHLine(pos * 8, MENU_CURSOR_Y, 8, blink);

		blink = !blink;
		lastBlink = m;

		if (render)
		{
			displayRenderRows(MENU_CURSOR_Y / 8, MENU_CURSOR_Y / 8 + 1);
		}
	}
}

void moveCursorLeftInString(char *str, int *pos, bool delete)
{
	int nLen = strlen(str);

	if (*pos > 0)
	{
		if (nLen == 16)
		{
			if (*pos != 15)
			{
				*pos -=1;
			}
		}
		else
		{
			*pos -=1;
		}

		announceChar(str[*pos]); // speak the new char or the char about to be backspaced out.

		if (delete)
		{
			for (int i = *pos; i <= nLen; i++)
			{
				str[i] = str[i + 1];
			}
		}
	}
}

void moveCursorRightInString(char *str, int *pos, int max, bool insert)
{
	int nLen = strlen(str);

	if (*pos < strlen(str))
	{
		if (insert)
		{
			if (nLen < max)
			{
				for (int i = nLen; i > *pos; i--)
				{
					str[i] = str[i - 1];
				}
				str[*pos] = ' ';
			}
		}

		if (*pos < max-1)
		{
			*pos += 1;
			announceChar(str[*pos]); // speak the new char or the char about to be backspaced out.
		}
	}
}

void menuSystemMenuIncrement(int32_t *currentItem, int32_t numItems)
{
	*currentItem = (*currentItem + 1) % numItems;
}

void menuSystemMenuDecrement(int32_t *currentItem, int32_t numItems)
{
	*currentItem = (*currentItem + numItems - 1) % numItems;
}

// For QuickKeys
void menuDisplaySettingOption(const char *entryText, const char *valueText)
{

#if defined(PLATFORM_RD5R)
	displayDrawRoundRect(2, DISPLAY_Y_POS_MENU_ENTRY_HIGHLIGHT - MENU_ENTRY_HEIGHT - 6, DISPLAY_SIZE_X - 4, (MENU_ENTRY_HEIGHT * 2) + 8, 2, true);
	displayFillRoundRect(2, DISPLAY_Y_POS_MENU_ENTRY_HIGHLIGHT - MENU_ENTRY_HEIGHT - 6, DISPLAY_SIZE_X - 4, MENU_ENTRY_HEIGHT + 3, 2, true);

	displayPrintCore(0, DISPLAY_Y_POS_MENU_START - MENU_ENTRY_HEIGHT - 4, entryText, FONT_SIZE_2, TEXT_ALIGN_CENTER, true);
#else
	displayDrawRoundRect(2, DISPLAY_Y_POS_MENU_ENTRY_HIGHLIGHT - MENU_ENTRY_HEIGHT - 2, DISPLAY_SIZE_X - 4, (MENU_ENTRY_HEIGHT * 2) + 4, 2, true);
	displayFillRoundRect(2, DISPLAY_Y_POS_MENU_ENTRY_HIGHLIGHT - MENU_ENTRY_HEIGHT - 2, DISPLAY_SIZE_X - 4, MENU_ENTRY_HEIGHT, 2, true);

	displayPrintCore(0, DISPLAY_Y_POS_MENU_START - MENU_ENTRY_HEIGHT + DISPLAY_V_OFFSET + 2, entryText, FONT_SIZE_2, TEXT_ALIGN_CENTER, true);
#endif

	displayPrintCore(0, DISPLAY_Y_POS_MENU_START + DISPLAY_V_OFFSET, valueText, FONT_SIZE_3, TEXT_ALIGN_CENTER, false);
}
