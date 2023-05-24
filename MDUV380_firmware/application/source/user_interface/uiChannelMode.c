/*
 * Copyright (C) 2019-2022 Roger Clark, VK3KYY / G4KYF
 *                         Daniel Caujolle-Bert, F1RMB
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
#include "user_interface/styles.h"
#include "user_interface/uiVFOMode.h"
#include "user_interface/uiMenu.h"

#include "functions/codeplug.h"
#include "functions/settings.h"
#include "functions/trx.h"
#include "user_interface/uiChannelMode.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/uiLocalisation.h"
#include "user_interface/colors.h"
#include "functions/voicePrompts.h"
#include "functions/ticks.h"
#include "functions/rxPowerSaving.h"

#define NAME_BUFFER_LEN   23

static char currentZoneName[SCREEN_LINE_BUFFER_SIZE];
static int directChannelNumber = 0;

static lv_obj_t	*channel_obj;
static lv_obj_t	*zone_obj;

static void guiUpdateChannel();
static void guiUpdateInfoZone();
static void changeZone(bool next);
static void changeChannelPrev();
static void changeChannelNext();
static void loadChannelData(bool useChannelDataInMemory, bool loadVoicePromptAnnouncement);

void uiChannelInitializeCurrentZone();

static void keyCallback(lv_event_t * e) {
	uint32_t key = lv_event_get_key(e);

	switch (key) {
		case LV_KEY_ESC:
			if (!uiMenuWasOpened()) {
				uiVFOMode();
			}
			break;

		case LV_KEY_ENTER:
			uiMenu();
			break;

		case LV_KEY_LEFT:
			switch (buttonsState(BUTTON_SK2)) {
				case BUTTON_PRESS:
				case BUTTON_LONG:
					changeZone(true);
					break;

				default:
					changeChannelPrev();
					break;
			}
			break;

		case LV_KEY_RIGHT:
			switch (buttonsState(BUTTON_SK2)) {
				case BUTTON_PRESS:
				case BUTTON_LONG:
					changeZone(false);
					break;

				default:
					changeChannelNext();
					break;
			}
			break;

		default:
			break;
	}
}

static void buttonCallback(lv_event_t * e) {
	event_button_t *event = lv_event_get_param(e);

	switch (event->button) {
		case BUTTON_SK1:
			switch (event->state) {
				case BUTTON_PRESS:
					uiDataGlobal.displayChannelSettings = true;
					break;

				case BUTTON_RELEASE:
				case BUTTON_LONG_RELEASE:
					uiDataGlobal.displayChannelSettings = false;
					break;
			}
			guiUpdateChannel();
			guiUpdateInfoZone();
			break;

		default:
			break;
	}
}

static void guiInit() {
	lv_coord_t	y = 128 - 2;
	lv_obj_t	*main_obj = lv_obj_create(NULL);

	lv_obj_add_event_cb(main_obj, buttonCallback, EVENT_BUTTON, NULL);
	lv_obj_add_event_cb(main_obj, keyCallback, LV_EVENT_KEY, NULL);
	lv_group_add_obj(lv_group_get_default(), main_obj);

	lv_obj_set_style_bg_img_src(main_obj, &wallpaper, LV_PART_MAIN);

	/* Bottom */

	y -= 20;

	lv_obj_t *label = lv_label_create(main_obj);

	lv_label_set_text(label, "Menu");
	lv_obj_set_pos(label, 2, y);
	lv_obj_set_size(label, 160/3, 20);

	lv_obj_add_style(label, &main_style, 0);
	lv_obj_add_style(label, &bordered_style, 0);
	lv_obj_add_style(label, &bottom_item_style, 0);

	label = lv_label_create(main_obj);

	lv_label_set_text(label, "VFO");
	lv_obj_set_pos(label, 160 - 160/3 - 2, y);
	lv_obj_set_size(label, 160/3, 20);

	lv_obj_add_style(label, &main_style, 0);
	lv_obj_add_style(label, &bordered_style, 0);
	lv_obj_add_style(label, &bottom_item_style, 0);

	/* * */

	y -= 24;

	zone_obj = lv_label_create(main_obj);

	lv_label_set_text(zone_obj, "Zone");
	lv_obj_set_pos(zone_obj, 0, y);
	lv_obj_add_style(zone_obj, &zone_style, 0);

	/* * */

	y -= 24;

	channel_obj = lv_label_create(main_obj);

	lv_label_set_text(channel_obj, "Channel");
	lv_obj_set_pos(channel_obj, 0, y);
	lv_obj_add_style(channel_obj, &channel_style, 0);

	lv_scr_load_anim(main_obj, LV_SCR_LOAD_ANIM_FADE_IN, 250, 0, true);
}

static void changeZone(bool next) {
	int numZones = codeplugZonesGetCount();

	if (next) {
		settingsIncrement(nonVolatileSettings.currentZone, 1);

		if (nonVolatileSettings.currentZone >= numZones) {
			settingsSet(nonVolatileSettings.currentZone, 0);
		}
	} else {
		if (nonVolatileSettings.currentZone == 0) {
			settingsSet(nonVolatileSettings.currentZone, (int16_t) (numZones - 1));
		} else {
			settingsDecrement(nonVolatileSettings.currentZone, 1);
		}
	}

	settingsSet(nonVolatileSettings.currentChannelIndexInZone, 0);
	currentChannelData->rxFreq = 0;

	lastHeardClearLastID();
	uiChannelInitializeCurrentZone();
	loadChannelData(false, true);

	guiUpdateInfoZone();
	guiUpdateChannel();
}

static void changeChannelNext() {
	int16_t nextChan = -1;

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
		if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1) {
			nextChan = nonVolatileSettings.currentChannelIndexInAllZone;

			/* All Channels virtual zone */

			do {
				nextChan = ((((nextChan - 1) + 1) % currentZone.NOT_IN_CODEPLUGDATA_highestIndex) + 1);
			} while (!codeplugAllChannelsIndexIsInUse(nextChan));

			settingsSet(nonVolatileSettings.currentChannelIndexInAllZone, nextChan);
		}
	} else {
		if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1) {
			nextChan = ((nonVolatileSettings.currentChannelIndexInZone + 1) % currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone);

			settingsSet(nonVolatileSettings.currentChannelIndexInZone, nextChan);
		}
	}

	lastHeardClearLastID();
	loadChannelData(false, true);
	guiUpdateInfoZone();
	guiUpdateChannel();
}

static void changeChannelPrev() {
	int16_t prevChan = -1;

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
		if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1) {
			prevChan = nonVolatileSettings.currentChannelIndexInAllZone;

			/* All Channels virtual zone */
			do {
				prevChan = ((((prevChan - 1) + currentZone.NOT_IN_CODEPLUGDATA_highestIndex - 1) % currentZone.NOT_IN_CODEPLUGDATA_highestIndex) + 1);
			} while (!codeplugAllChannelsIndexIsInUse(prevChan));

			settingsSet(nonVolatileSettings.currentChannelIndexInAllZone, prevChan);
		}
	} else {
		if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1) {
			prevChan = ((nonVolatileSettings.currentChannelIndexInZone + currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone - 1) % currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone);

			settingsSet(nonVolatileSettings.currentChannelIndexInZone, prevChan);
		}
	}

	lastHeardClearLastID();
	loadChannelData(false, true);
	guiUpdateInfoZone();
	guiUpdateChannel();
}

static void loadChannelData(bool useChannelDataInMemory, bool loadVoicePromptAnnouncement) {
	bool	rxGroupValid = true;
	bool	wasLoadingZone = (currentChannelData->rxFreq == 0);
	int		previousSelectedChannelNumber = uiDataGlobal.currentSelectedChannelNumber;

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
		/* All Channels virtual zone */
		uiDataGlobal.currentSelectedChannelNumber = nonVolatileSettings.currentChannelIndexInAllZone;
	} else {
		uiDataGlobal.currentSelectedChannelNumber = currentZone.channels[nonVolatileSettings.currentChannelIndexInZone];
	}

	if (!useChannelDataInMemory) {
		if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
			/* All Channels virtual zone */
			codeplugChannelGetDataForIndex(nonVolatileSettings.currentChannelIndexInAllZone, &channelScreenChannelData);
		} else {
			codeplugChannelGetDataForIndex(currentZone.channels[nonVolatileSettings.currentChannelIndexInZone], &channelScreenChannelData);
		}
	}

	HRC6000ClearActiveDMRID();

	if (!uiDataGlobal.reverseRepeaterChannel) {
		trxSetFrequency(currentChannelData->rxFreq, currentChannelData->txFreq, DMR_MODE_AUTO);
	} else {
		trxSetFrequency(currentChannelData->txFreq, currentChannelData->rxFreq, DMR_MODE_DMO);
	}

	trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));

	if (currentChannelData->chMode == RADIO_MODE_ANALOG) {
		trxSetRxCSS(currentChannelData->rxTone);
	} else {
		uint32_t channelDMRId = codeplugChannelGetOptionalDMRID(currentChannelData);

		if (uiDataGlobal.manualOverrideDMRId == 0) {
			if (channelDMRId == 0) {
				setTxDMRID(uiDataGlobal.userDMRId);
			} else {
				setTxDMRID(channelDMRId);
			}
		} else {
			setTxDMRID(uiDataGlobal.manualOverrideDMRId);
		}

		// Set CC when:
		//  - scanning
		//  - CC Filter is ON
		//  - CC Filter is OFF but not held anymore or loading a new channel (this avoids restoring Channel's CC when releasing the PTT key, or getting out of menus)

		if (uiDataGlobal.Scan.active ||
			((nonVolatileSettings.dmrCcTsFilter & DMR_CC_FILTER_PATTERN) ||
			(((nonVolatileSettings.dmrCcTsFilter & DMR_CC_FILTER_PATTERN) == 0) &&
			((HRC6000CCIsHeld() == false) || (previousSelectedChannelNumber != uiDataGlobal.currentSelectedChannelNumber)))))
		{
			trxSetDMRColourCode(currentChannelData->txColor);
			HRC6000ClearColorCodeSynchronisation();
		}

		if (currentChannelData->rxGroupList != lastLoadedRxGroup) {
			rxGroupValid = codeplugRxGroupGetDataForIndex(currentChannelData->rxGroupList, &currentRxGroupData);

			if (rxGroupValid) {
				lastLoadedRxGroup = currentChannelData->rxGroupList;
			} else {
				lastLoadedRxGroup = -1; /* RxGroup Contacts are not valid */
			}
		}

		/* Current contact index is out of group list bounds, select first contact */

		if (rxGroupValid && (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] > (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1))) {
			settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 0);
		}

		/* Check if this channel has an Rx Group */

		if (rxGroupValid && nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup) {
			codeplugContactGetDataForIndex(currentRxGroupData.contacts[nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE]], &currentContactData);
		} else {
			codeplugContactGetDataForIndex(currentChannelData->contact, &currentContactData);
		}

		trxUpdateTsForCurrentChannelWithSpecifiedContact(&currentContactData);

		if (nonVolatileSettings.overrideTG == 0) {
			trxTalkGroupOrPcId = codeplugContactGetPackedId(&currentContactData);
		} else {
			trxTalkGroupOrPcId = nonVolatileSettings.overrideTG;
		}
	}

	int nextMenu = menuSystemGetPreviouslyPushedMenuNumber(); /* used to determine if this screen has just been loaded after Tx ended (in loadChannelData())) */

	if (((uiDataGlobal.VoicePrompts.inhibitInitial == false) || loadVoicePromptAnnouncement) &&
			((uiDataGlobal.Scan.active == false) ||
					(uiDataGlobal.Scan.active && ((uiDataGlobal.Scan.state = SCAN_SHORT_PAUSED) || (uiDataGlobal.Scan.state = SCAN_PAUSED)))))
	{
		announceItem((wasLoadingZone ? PROMPT_SEQUENCE_ZONE_NAME_CHANNEL_NAME_AND_CONTACT_OR_VFO_FREQ_AND_MODE : PROMPT_SEQUENCE_CHANNEL_NAME_AND_CONTACT_OR_VFO_FREQ_AND_MODE),
				((nextMenu == UI_TX_SCREEN) || (nextMenu == UI_PRIVATE_CALL) || uiDataGlobal.Scan.active) ? PROMPT_THRESHOLD_NEVER_PLAY_IMMEDIATELY : PROMPT_THRESHOLD_2);
	}
}

void uiChannelInitializeCurrentZone(void) {
	codeplugZoneGetDataForNumber(nonVolatileSettings.currentZone, &currentZone);
	codeplugUtilConvertBufToString(currentZone.name, currentZoneName, 16);
}

static void dataInit() {
	settingsSet(nonVolatileSettings.initialMenuNumber, UI_CHANNEL_MODE);
	lastHeardClearLastID();
	currentChannelData = &channelScreenChannelData;

	if (currentChannelData->rxFreq != 0) {
		loadChannelData(true, false);
	} else {
		uiChannelInitializeCurrentZone();
		loadChannelData(false, false);
	}
}

static void guiUpdateChannel() {
	char nameBuf[NAME_BUFFER_LEN];

	if (!uiDataGlobal.displayChannelSettings) {
		codeplugUtilConvertBufToString(currentChannelData->name, nameBuf, 16);

		lv_label_set_text(channel_obj, nameBuf);
		// uiUtilityDisplayInformation(nameBuf, (uiDataGlobal.reverseRepeaterChannel == true)?DISPLAY_INFO_CHANNEL_INVERTED:DISPLAY_INFO_CHANNEL , (trxTransmissionEnabled ? DISPLAY_Y_POS_CHANNEL_SECOND_LINE : -1));
	}

	if (trxGetMode() == RADIO_MODE_DIGITAL) {
		if (uiDataGlobal.displayChannelSettings) {
			uint32_t PCorTG = ((nonVolatileSettings.overrideTG != 0) ? nonVolatileSettings.overrideTG : codeplugContactGetPackedId(&currentContactData));

			lv_label_set_text_fmt(channel_obj, "%s %u", (((PCorTG >> 24) == PC_CALL_FLAG) ? "PC" : "TG"), (PCorTG & 0xFFFFFF));
		} else {
			if (nonVolatileSettings.overrideTG != 0) {
				uiUtilityBuildTgOrPCDisplayName(nameBuf, SCREEN_LINE_BUFFER_SIZE);
				/* change style */
				// uiUtilityDisplayInformation(NULL, DISPLAY_INFO_CONTACT_OVERRIDE_FRAME, (trxTransmissionEnabled ? DISPLAY_Y_POS_CONTACT_TX_FRAME : -1));
			} else {
				codeplugUtilConvertBufToString(currentContactData.name, nameBuf, 16);
				lv_label_set_text(channel_obj, nameBuf);
			}
		}
	}
}

static void guiUpdateInfoZone() {
	int channelNumber;

	if (uiDataGlobal.displayChannelSettings) {
#if 0
		uiUtilityDisplayInformation(NULL, DISPLAY_INFO_TONE_AND_SQUELCH, -1);

		uiUtilityDisplayFrequency(DISPLAY_Y_POS_RX_FREQ, false, false, (uiDataGlobal.reverseRepeaterChannel ? currentChannelData->txFreq : currentChannelData->rxFreq), false, false, 0);
		uiUtilityDisplayFrequency(DISPLAY_Y_POS_TX_FREQ, true, false, (uiDataGlobal.reverseRepeaterChannel ? currentChannelData->rxFreq : currentChannelData->txFreq), false, false, 0);
#endif
	} else {
		if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
			/* All Channels virtual zone */

			channelNumber = nonVolatileSettings.currentChannelIndexInAllZone;

			if (directChannelNumber > 0) {
				lv_label_set_text_fmt(zone_obj, "Goto %d", directChannelNumber);
			} else {
				lv_label_set_text_fmt(zone_obj, "All Channels Ch:%d", channelNumber);
			}
		} else {
			channelNumber = nonVolatileSettings.currentChannelIndexInZone + 1;

			if (directChannelNumber > 0) {
				lv_label_set_text_fmt(zone_obj, "Goto %d", directChannelNumber);
			} else {
				lv_label_set_text_fmt(zone_obj, "%s Ch:%d", currentZoneName, channelNumber);
			}
		}
	}
}

void uiChannelMode() {
	dataInit();
	guiInit();

	guiUpdateInfoZone();
	guiUpdateChannel();
}
