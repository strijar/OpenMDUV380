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
#include "user_interface/uiEvents.h"
#include "user_interface/styles.h"
#include "user_interface/uiVFOMode.h"
#include "user_interface/uiMenu.h"
#include "user_interface/uiHeader.h"
#include "user_interface/uiCaller.h"
#include "functions/tx.h"

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

static char 		current_zone_name[SCREEN_LINE_BUFFER_SIZE];
static int 			direct_channel_number = 0;
static bool			display_channel_settings = false;

static lv_obj_t		*contact_obj;
static lv_obj_t		*contact_shadow_obj;
static lv_obj_t		*channel_obj;
static lv_obj_t		*channel_shadow_obj;
static lv_obj_t		*zone_obj;

static lv_timer_t	*caller_timer = NULL;
static uint32_t		caller_timeout;
static uint32_t		caller_delay;

static void guiUpdateContact();
static void guiUpdateChannel();
static void guiViewChannelSettings(bool settings);
static void guiUpdateInfoZone();

static void changeZone(bool next);
static void changeChannelPrev();
static void changeChannelNext();
static void changeContact(bool next);
static void changeSquelch(int dir);
static void changeMode();
static void changeTS();
static void changeBW();
static void loadChannelData(bool useChannelDataInMemory, bool loadVoicePromptAnnouncement);

static void callerDelay();

void uiChannelInitializeCurrentZone();

static void unloadCallback(lv_event_t * e) {
	lv_timer_del(caller_timer);
	caller_timer = NULL;

	uiHeaderStop();

	if (uiCallerIsShow()) {
		uiCallerDone();
	}
}

static void keyCallback(lv_event_t * e) {
	uint32_t	key = lv_event_get_key(e);
	int			mode = trxGetMode();

	switch (key) {
		case LV_KEY_ESC:
			if (!uiMenuWasOpened()) {
				uiVFOMode();
			}
			break;

		case LV_KEY_ENTER:
			uiMenu();
			break;

		case LV_KEY_UP:
			if (buttonsPressed(BUTTON_SK2)) {
				increasePowerLevel(false);
				uiHeaderPwr(true);
				uiHeaderInfoUpdate();
			} else {
				if (mode == RADIO_MODE_DIGITAL) {
					callerDelay();
					changeContact(false);
				} else {
					changeSquelch(+1);
				}
			}
			break;

		case LV_KEY_DOWN:
			if (buttonsPressed(BUTTON_SK2)) {
				decreasePowerLevel();
				uiHeaderPwr(true);
				uiHeaderInfoUpdate();
			} else {
				if (mode == RADIO_MODE_DIGITAL) {
					callerDelay();
					changeContact(true);
				} else {
					changeSquelch(-1);
				}
			}
			break;

		case LV_KEY_LEFT:
			callerDelay();

			if (buttonsPressed(BUTTON_SK2)) {
				changeZone(true);
			} else {
				changeChannelPrev();
			}
			break;

		case LV_KEY_RIGHT:
			callerDelay();

			if (buttonsPressed(BUTTON_SK2)) {
				changeZone(false);
			} else {
				changeChannelNext();
			}
			break;

		case '*':
			if (buttonsPressed(BUTTON_SK2)) {
				changeMode();
			} else {
				if (mode == RADIO_MODE_DIGITAL) {
					callerDelay();
					changeTS();
				} else {
					changeBW();
				}
			}
			break;

		default:
			break;
	}
}

static void buttonCallback(lv_event_t * e) {
	event_button_t *event = lv_event_get_param(e);

	switch (event->button) {
		case BUTTON_PTT:
			switch (event->state) {
				case BUTTON_PRESS:
					txTurnOn();
					break;

				case BUTTON_RELEASE:
				case BUTTON_LONG_RELEASE:
					txTurnOff();
					break;

				default:
					break;
			}
			break;

		case BUTTON_SK1:
			switch (event->state) {
				case BUTTON_PRESS:
					callerDelay();
					guiViewChannelSettings(true);
					break;

				case BUTTON_RELEASE:
				case BUTTON_LONG_RELEASE:
					callerDelay();
					guiViewChannelSettings(false);
					break;

				default:
					break;
			}
			guiUpdateContact();
			guiUpdateChannel();
			guiUpdateInfoZone();
			break;

		default:
			break;
	}
}

static void mainHideCallback(lv_event_t * e) {
	lv_obj_add_flag(contact_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_add_flag(contact_shadow_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_add_flag(channel_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_add_flag(channel_shadow_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_add_flag(zone_obj, LV_OBJ_FLAG_HIDDEN);
}

static void mainShowCallback(lv_event_t * e) {
	lv_obj_clear_flag(contact_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_clear_flag(contact_shadow_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_clear_flag(channel_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_clear_flag(channel_shadow_obj, LV_OBJ_FLAG_HIDDEN);
	lv_obj_clear_flag(zone_obj, LV_OBJ_FLAG_HIDDEN);
}

static void guiInit() {
	lv_coord_t	y = 128 - 2;
	lv_obj_t	*main_obj = lv_obj_create(NULL);

	lv_obj_add_event_cb(main_obj, buttonCallback, EVENT_BUTTON, NULL);
	lv_obj_add_event_cb(main_obj, keyCallback, LV_EVENT_KEY, NULL);
	lv_obj_add_event_cb(main_obj, unloadCallback, LV_EVENT_SCREEN_UNLOAD_START, NULL);

	lv_obj_add_event_cb(main_obj, mainHideCallback, EVENT_MAIN_HIDE, NULL);
	lv_obj_add_event_cb(main_obj, mainShowCallback, EVENT_MAIN_SHOW, NULL);

	lv_group_add_obj(lv_group_get_default(), main_obj);
	lv_obj_clear_flag(main_obj, LV_OBJ_FLAG_SCROLLABLE);

	lv_obj_set_style_bg_img_src(main_obj, &wallpaper, LV_PART_MAIN);

	uiHeader(main_obj);

	/* Bottom */

	y -= 20;

	lv_obj_t *label = lv_label_create(main_obj);

	lv_label_set_text(label, "Menu");
	lv_obj_set_pos(label, 2, y);
	lv_obj_set_size(label, 160/3, 20);

	lv_obj_add_style(label, (lv_style_t *) &main_style, 0);
	lv_obj_add_style(label, (lv_style_t *) &bordered_style, 0);
	lv_obj_add_style(label, (lv_style_t *) &bottom_item_style, 0);

	label = lv_label_create(main_obj);

	lv_label_set_text(label, "VFO");
	lv_obj_set_pos(label, 160 - 160/3 - 2, y);
	lv_obj_set_size(label, 160/3, 20);

	lv_obj_add_style(label, (lv_style_t *) &main_style, 0);
	lv_obj_add_style(label, (lv_style_t *) &bordered_style, 0);
	lv_obj_add_style(label, (lv_style_t *) &bottom_item_style, 0);

	/* * */

	y -= 24;

	zone_obj = lv_label_create(main_obj);

	lv_obj_set_pos(zone_obj, 0, y);
	lv_obj_add_style(zone_obj, (lv_style_t *) &zone_style, 0);

	/* * */

	y -= 24;

	channel_shadow_obj = lv_label_create(main_obj);

	lv_obj_set_pos(channel_shadow_obj, 2, y + 2);
	lv_obj_add_style(channel_shadow_obj, (lv_style_t *) &channel_shadow_style, 0);

	channel_obj = lv_label_create(main_obj);

	lv_obj_set_pos(channel_obj, 0, y);
	lv_obj_add_style(channel_obj, (lv_style_t *) &channel_style, 0);

	/* * */

	y -= 24;

	contact_shadow_obj = lv_label_create(main_obj);

	lv_obj_set_pos(contact_shadow_obj, 2, y  +2);
	lv_obj_add_style(contact_shadow_obj, (lv_style_t *) &contact_shadow_style, 0);

	contact_obj = lv_label_create(main_obj);

	lv_obj_set_pos(contact_obj, 0, y);
	lv_obj_add_style(contact_obj, (lv_style_t *) &contact_style, 0);

    lv_scr_load_anim(main_obj, LV_SCR_LOAD_ANIM_NONE, 0, 100, true);
}

static void updateTrxID() {
	if (nonVolatileSettings.overrideTG != 0) {
		trxTalkGroupOrPcId = nonVolatileSettings.overrideTG;
	} else {
		if ((currentRxGroupData.name[0] != 0) && (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup)) {
			codeplugContactGetDataForIndex(currentRxGroupData.contacts[nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE]], &currentContactData);
		} else {
			codeplugContactGetDataForIndex(currentChannelData->contact, &currentContactData);
		}

		tsSetContactHasBeenOverriden(CHANNEL_CHANNEL, false);
		uiHeaderTS(false);

		trxUpdateTsForCurrentChannelWithSpecifiedContact(&currentContactData);
		trxTalkGroupOrPcId = codeplugContactGetPackedId(&currentContactData);
	}

	lastHeardClearLastID();
	menuPrivateCallClear();
}

static void changeContact(bool next) {
	if (next) {
		if (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup > 1) {
			if (nonVolatileSettings.overrideTG == 0) {
				settingsIncrement(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 1);

				if (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] > (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1)) {
					settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 0);
				}
			}
		}
	} else {
		if (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup > 1) {
			if (nonVolatileSettings.overrideTG == 0) {
				settingsDecrement(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 1);

				if (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < 0) {
					settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE],
							(int16_t) (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1));
				}
			}
		}
	}

	settingsSet(nonVolatileSettings.overrideTG, 0);
	menuPrivateCallClear();
	updateTrxID();
	guiUpdateContact();
	uiHeaderInfoUpdate();

	announceItem(PROMPT_SEQUENCE_CONTACT_TG_OR_PC, PROMPT_THRESHOLD_3);
}

static void changeSquelch(int dir) {
	soundSetMelody(MELODY_KEY_BEEP);

	if (currentChannelData->sql == 0) {
		currentChannelData->sql = nonVolatileSettings.squelchDefaults[trxCurrentBand[TRX_RX_FREQ_BAND]];
	}

	if (dir > 0) {
		if (currentChannelData->sql < CODEPLUG_MAX_VARIABLE_SQUELCH) {
			currentChannelData->sql++;
		}
	} else {
		if (currentChannelData->sql > CODEPLUG_MIN_VARIABLE_SQUELCH) {
			currentChannelData->sql--;
		}
	}

	uiHeaderMeterSquelch(currentChannelData->sql);
}

static void changeMode() {
	if (trxGetMode() == RADIO_MODE_DIGITAL) {
		callerDelay();
		currentChannelData->chMode = RADIO_MODE_ANALOG;
		trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));
		trxSetRxCSS(currentChannelData->rxTone);
	} else {
		currentChannelData->chMode = RADIO_MODE_DIGITAL;
		uiDataGlobal.VoicePrompts.inhibitInitial = true;
		loadChannelData(true, false);
		uiDataGlobal.VoicePrompts.inhibitInitial = false;

		uiHeaderPwr(false);
		uiHeaderTS(false);
	}

	announceItem(PROMPT_SEQUENCE_MODE, PROMPT_THRESHOLD_1);
	guiUpdateContact();
	guiUpdateChannel();
	guiUpdateInfoZone();

	uiHeaderMode(true);
	uiHeaderInfoUpdate();
}

static void changeTS() {
	trxSetDMRTimeSlot(1 - trxGetDMRTimeSlot(), true);

	disableAudioAmp(AUDIO_AMP_MODE_RF);
	lastHeardClearLastID();
	announceItem(PROMPT_SEQUENCE_TS, PROMPT_THRESHOLD_3);

	uiHeaderTS(true);
	uiHeaderInfoUpdate();
}

static void changeBW() {
	if (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K)) {
		codeplugChannelSetFlag(currentChannelData, CHANNEL_FLAG_BW_25K, false);
	} else {
		codeplugChannelSetFlag(currentChannelData, CHANNEL_FLAG_BW_25K, true);
		nextKeyBeepMelody = (int *)MELODY_KEY_BEEP_FIRST_ITEM;
	}

	trxSetModeAndBandwidth(RADIO_MODE_ANALOG, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));
	soundSetMelody(MELODY_NACK_BEEP);

	uiHeaderMode(true);
	uiHeaderInfoUpdate();
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

	uiHeaderMode(false);
	uiHeaderPwr(false);
	uiHeaderTS(false);

	lastHeardClearLastID();
	uiChannelInitializeCurrentZone();
	loadChannelData(false, true);
	uiHeaderInfoUpdate();

	guiUpdateInfoZone();
	guiUpdateChannel();
	guiUpdateContact();
}

static void changeChannelNext() {
	int16_t nextChan = -1;

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
		if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1) {
			nextChan = nonVolatileSettings.currentChannelIndexInAllZone;

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

	uiHeaderMode(false);
	uiHeaderPwr(false);
	uiHeaderTS(false);

	lastHeardClearLastID();
	loadChannelData(false, true);
	uiHeaderInfoUpdate();

	guiUpdateInfoZone();
	guiUpdateChannel();
	guiUpdateContact();
}

static void changeChannelPrev() {
	int16_t prevChan = -1;

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
		if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1) {
			prevChan = nonVolatileSettings.currentChannelIndexInAllZone;

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

	uiHeaderMode(false);
	uiHeaderPwr(false);
	uiHeaderTS(false);

	lastHeardClearLastID();
	loadChannelData(false, true);
	uiHeaderInfoUpdate();

	guiUpdateInfoZone();
	guiUpdateChannel();
	guiUpdateContact();
}

static void loadChannelData(bool useChannelDataInMemory, bool loadVoicePromptAnnouncement) {
	bool	rxGroupValid = true;
	bool	wasLoadingZone = (currentChannelData->rxFreq == 0);
	int		previousSelectedChannelNumber = uiDataGlobal.currentSelectedChannelNumber;

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
		uiDataGlobal.currentSelectedChannelNumber = nonVolatileSettings.currentChannelIndexInAllZone;
	} else {
		uiDataGlobal.currentSelectedChannelNumber = currentZone.channels[nonVolatileSettings.currentChannelIndexInZone];
	}

	if (!useChannelDataInMemory) {
		if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
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
	codeplugUtilConvertBufToString(currentZone.name, current_zone_name, 16);
}

static void dataInit() {
	settingsSet(nonVolatileSettings.initialMenuNumber, UI_CHANNEL_MODE);
	lastHeardClearLastID();
	currentChannelData = &channelScreenChannelData;

	tsSetManualOverride(CHANNEL_CHANNEL, TS_NO_OVERRIDE);
	tsSetContactHasBeenOverriden(CHANNEL_CHANNEL, false);

	if (currentChannelData->rxFreq != 0) {
		loadChannelData(true, false);
	} else {
		uiChannelInitializeCurrentZone();
		loadChannelData(false, false);
	}
}

static void guiUpdateContact() {
	char nameBuf[NAME_BUFFER_LEN];

	if (uiCallerIsShow()) {
		return;
	}

	if (trxGetMode() == RADIO_MODE_DIGITAL) {
		lv_obj_clear_flag(contact_obj, LV_OBJ_FLAG_HIDDEN);
		lv_obj_clear_flag(contact_shadow_obj, LV_OBJ_FLAG_HIDDEN);

		if (display_channel_settings) {
			uint32_t PCorTG = ((nonVolatileSettings.overrideTG != 0) ? nonVolatileSettings.overrideTG : codeplugContactGetPackedId(&currentContactData));

			snprintf(nameBuf, sizeof(nameBuf), "%s %u", (((PCorTG >> 24) == PC_CALL_FLAG) ? "PC" : "TG"), (PCorTG & 0xFFFFFF));
			lv_label_set_text(contact_obj, nameBuf);
			lv_label_set_text(contact_shadow_obj, nameBuf);
		} else {
			if (nonVolatileSettings.overrideTG != 0) {
				uiUtilityBuildTgOrPCDisplayName(nameBuf, SCREEN_LINE_BUFFER_SIZE);
				/* change style */
				// uiUtilityDisplayInformation(NULL, DISPLAY_INFO_CONTACT_OVERRIDE_FRAME, (trxTransmissionEnabled ? DISPLAY_Y_POS_CONTACT_TX_FRAME : -1));
			} else {
				codeplugUtilConvertBufToString(currentContactData.name, nameBuf, 16);
				lv_label_set_text(contact_obj, nameBuf);
				lv_label_set_text(contact_shadow_obj, nameBuf);
			}
		}
	} else {
		lv_obj_add_flag(contact_obj, LV_OBJ_FLAG_HIDDEN);
		lv_obj_add_flag(contact_shadow_obj, LV_OBJ_FLAG_HIDDEN);
	}
}

static void displayFrequency(char *buffer, size_t size, bool isTX, uint32_t frequency) {
	int			mhz = frequency / 100000;
	int			khz = frequency - mhz * 100000;

	int16_t len = snprintf(buffer, size, "%s %d.%05d", isTX ? "Tx" : "Rx", mhz, khz);

	for (int16_t i = len - 1; i > 0; i--)
		if (buffer[i] == '0') {
			buffer[i] = '\0';
		} else {
			break;
		}
}

static void guiUpdateChannel() {
	if (display_channel_settings) {
		char rx[32];
		char tx[32];

		displayFrequency(rx, sizeof(rx), false, (uiDataGlobal.reverseRepeaterChannel ? currentChannelData->txFreq : currentChannelData->rxFreq));
		displayFrequency(tx, sizeof(tx), true, (uiDataGlobal.reverseRepeaterChannel ? currentChannelData->rxFreq : currentChannelData->txFreq));

		lv_label_set_text_fmt(channel_obj, "%s\n%s", rx, tx);
		lv_label_set_text_fmt(channel_shadow_obj, "%s\n%s", rx, tx);
	} else {
		char nameBuf[NAME_BUFFER_LEN];

		codeplugUtilConvertBufToString(currentChannelData->name, nameBuf, 16);

		lv_label_set_text(channel_obj, nameBuf);
		lv_label_set_text(channel_shadow_obj, nameBuf);
	}
}

static void guiViewChannelSettings(bool settings) {
	display_channel_settings = settings;

	if (settings) {
		lv_obj_add_style(contact_obj, &contact_settings_style, LV_PART_MAIN);

		lv_obj_add_style(channel_obj, &channel_settings_style, LV_PART_MAIN);
		lv_obj_add_style(channel_shadow_obj, &channel_settings_shadow_style, LV_PART_MAIN);

		lv_obj_add_flag(zone_obj, LV_OBJ_FLAG_HIDDEN);
	} else {
		lv_obj_remove_style(contact_obj, &contact_settings_style, LV_PART_MAIN);

		lv_obj_remove_style(channel_obj, &channel_settings_style, LV_PART_MAIN);
		lv_obj_remove_style(channel_shadow_obj, &channel_settings_shadow_style, LV_PART_MAIN);

		lv_obj_clear_flag(zone_obj, LV_OBJ_FLAG_HIDDEN);
	}
}

static void guiUpdateInfoZone() {
	int channelNumber;

	if (display_channel_settings) {
		return;
	}

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone)) {
		channelNumber = nonVolatileSettings.currentChannelIndexInAllZone;

		if (direct_channel_number > 0) {
			lv_label_set_text_fmt(zone_obj, "Goto %d", direct_channel_number);
		} else {
			lv_label_set_text_fmt(zone_obj, "All:%d", channelNumber);
		}
	} else {
		channelNumber = nonVolatileSettings.currentChannelIndexInZone + 1;

		if (direct_channel_number > 0) {
			lv_label_set_text_fmt(zone_obj, "Goto %d", direct_channel_number);
		} else {
			lv_label_set_text_fmt(zone_obj, "%s:%d", current_zone_name, channelNumber);
		}
	}
}

static void callerDelay() {
	caller_delay = ticksGetMillis() + 1000;
}

static void callerTimerCallback(lv_timer_t *t) {
	uint32_t now = ticksGetMillis();

	if (caller_delay > now) {
		if (uiCallerIsShow()) {
			lastHeardClearLastID();
			uiCallerDone();
		}
		return;
	}

	if (trxGetMode() != RADIO_MODE_DIGITAL) {
		return;
	}

	if (uiCallerIsShow()) {
		if (uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA_UPDATE) {
			uiCallerUpdate();
			caller_timeout = now;
		}

		if (uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA || isQSODataAvailableForCurrentTalker()) {
			if (now - caller_timeout > 100) {
				uiCallerUpdate();
				caller_timeout = now;
			}
		}

		if (now - caller_timeout > 500) {
			uiCallerDone();
		}
	} else {
		if (uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA || isQSODataAvailableForCurrentTalker()) {
			uiCallerInit();
			caller_timeout = now;
		}
	}
}

void uiChannelMode() {
	dataInit();
	guiInit();

	guiUpdateContact();
	guiUpdateChannel();
	guiUpdateInfoZone();

	uiHeaderInfoUpdate();

	caller_delay = 0;
	caller_timer = lv_timer_create(callerTimerCallback, 20, NULL);
}
