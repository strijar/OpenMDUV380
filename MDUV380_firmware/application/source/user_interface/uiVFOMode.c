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
#include "user_interface/uiChannelMode.h"
#include "user_interface/uiMenu.h"
#include "user_interface/uiHeader.h"
#include "user_interface/uiCaller.h"

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

static bool			display_channel_settings = false;
static uint8_t		previousVFONumber = 0xFF;

static void loadChannelData();

static void changeSquelch(int dir);
static void changeMode();
static void changeTS();
static void changeBW();

static void unloadCallback(lv_event_t * e) {
	uiHeaderStop();

	if (uiCallerIsShow()) {
		uiCallerDone();
	}
}

static void keyCallback(lv_event_t * e) {
	uint32_t 	key = lv_event_get_key(e);
	int			mode = trxGetMode();

	if (uiLockCheck(key)) {
		return;
	}

	switch (key) {
		case LV_KEY_ESC:
			uiChannelMode();
			break;

		case LV_KEY_ENTER:
			lv_indev_wait_release(lv_indev_get_act());
			uiMenu();
			break;

		case LV_KEY_UP:
			if (buttonsPressed(BUTTON_SK2)) {
				increasePowerLevel(false);
				uiHeaderInfoUpdate();
			} else {
				if (mode == RADIO_MODE_DIGITAL) {
				} else {
					changeSquelch(-1);
				}
			}
			break;

		case LV_KEY_DOWN:
			if (buttonsPressed(BUTTON_SK2)) {
				decreasePowerLevel();
				uiHeaderInfoUpdate();
			} else {
				if (mode == RADIO_MODE_DIGITAL) {
				} else {
					changeSquelch(+1);
				}
			}
			break;

		case '#':
			if (buttonsPressed(BUTTON_SK2)) {
				changeMode();
			} else {
				if (mode == RADIO_MODE_DIGITAL) {
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

static void changeSquelch(int dir) {

}

static void changeMode() {
	if (trxGetMode() == RADIO_MODE_DIGITAL) {
		currentChannelData->chMode = RADIO_MODE_ANALOG;
		trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));
		trxSetRxCSS(currentChannelData->rxTone);
	} else {
		currentChannelData->chMode = RADIO_MODE_DIGITAL;
		uiDataGlobal.VoicePrompts.inhibitInitial = true;
		loadChannelData();
		uiDataGlobal.VoicePrompts.inhibitInitial = false;
	}

	announceItem(PROMPT_SEQUENCE_MODE, PROMPT_THRESHOLD_1);

	uiHeaderInfoUpdate();
}

static void changeTS() {
	trxSetDMRTimeSlot(1 - trxGetDMRTimeSlot(), true);

	disableAudioAmp(AUDIO_AMP_MODE_RF);
	lastHeardClearLastID();
	announceItem(PROMPT_SEQUENCE_TS, PROMPT_THRESHOLD_3);

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

	uiHeaderInfoUpdate();
}

static void buttonCallback(lv_event_t * e) {
	event_button_t *event = lv_event_get_param(e);
}

static void guiInit() {
	lv_obj_t *main_obj = lv_obj_create(NULL);

	lv_obj_add_event_cb(main_obj, buttonCallback, EVENT_BUTTON, NULL);
	lv_obj_add_event_cb(main_obj, keyCallback, LV_EVENT_KEY, NULL);
	lv_obj_add_event_cb(main_obj, unloadCallback, LV_EVENT_SCREEN_UNLOAD_START, NULL);
	lv_group_add_obj(lv_group_get_default(), main_obj);

	lv_obj_set_style_bg_img_src(main_obj, &wallpaper, LV_PART_MAIN);

	uiHeader(main_obj);

	/* * */

	lv_obj_t *label = lv_label_create(main_obj);

	lv_label_set_text(label, "Menu");
	lv_obj_set_pos(label, 2, 128 - 20 - 2);
	lv_obj_set_size(label, 160/3, 20);

	lv_obj_add_style(label, &main_style, 0);
	lv_obj_add_style(label, &bordered_style, 0);
	lv_obj_add_style(label, &bottom_item_style, 0);

	label = lv_label_create(main_obj);

	lv_label_set_text(label, "CH");
	lv_obj_set_pos(label, 160 - 160/3 - 2, 128 - 20 - 2);
	lv_obj_set_size(label, 160/3, 20);

	lv_obj_add_style(label, &main_style, 0);
	lv_obj_add_style(label, &bordered_style, 0);
	lv_obj_add_style(label, &bottom_item_style, 0);

    lv_scr_load_anim(main_obj, LV_SCR_LOAD_ANIM_NONE, 0, 100, true);
}

void uiVFOLoadContact(struct_codeplugContact_t *contact) {
	if ((currentRxGroupData.name[0] != 0) && (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_VFO_A_MODE + nonVolatileSettings.currentVFONumber] < currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup)) {
		codeplugContactGetDataForIndex(currentRxGroupData.contacts[nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_VFO_A_MODE + nonVolatileSettings.currentVFONumber]], contact);
	} else {
		codeplugContactGetDataForIndex(currentChannelData->contact, contact);
	}
}

static void loadChannelData() {
	trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));

	if (currentChannelData->chMode == RADIO_MODE_ANALOG) {
		if (!uiDataGlobal.Scan.toneActive) {
			trxSetRxCSS(currentChannelData->rxTone);
		}

		if (uiDataGlobal.Scan.active == false) {
			uiDataGlobal.Scan.state = SCAN_SCANNING;
		}
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
						(((nonVolatileSettings.dmrCcTsFilter & DMR_CC_FILTER_PATTERN) == 0)
								&& ((HRC6000CCIsHeld() == false) || (previousVFONumber != nonVolatileSettings.currentVFONumber)))))
		{
			trxSetDMRColourCode(currentChannelData->txColor);
			HRC6000ClearColorCodeSynchronisation();
		}

		if (nonVolatileSettings.overrideTG == 0) {
			uiVFOLoadContact(&currentContactData);

			/* Check whether the contact data seems valid */

			if ((currentContactData.name[0] == 0) || (currentContactData.tgNumber == 0) || (currentContactData.tgNumber > 9999999)) {
				/* If the VFO does not have an Rx Group list assigned to it. We can't get a TG from the codeplug. So use TG 9. */

				settingsSet(nonVolatileSettings.overrideTG, 9);
				trxTalkGroupOrPcId = nonVolatileSettings.overrideTG;
				trxSetDMRTimeSlot((codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_TIMESLOT_TWO) ? 1 : 0), true);
				tsSetContactHasBeenOverriden(((Channel_t)nonVolatileSettings.currentVFONumber), false);
			} else {
				trxTalkGroupOrPcId = codeplugContactGetPackedId(&currentContactData);
				trxUpdateTsForCurrentChannelWithSpecifiedContact(&currentContactData);
			}
		} else {
			int manTS = tsGetManualOverrideFromCurrentChannel();

			trxTalkGroupOrPcId = nonVolatileSettings.overrideTG;
			trxSetDMRTimeSlot((manTS ? (manTS - 1) : (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_TIMESLOT_TWO) ? 1 : 0)), true);
		}
	}

	previousVFONumber = nonVolatileSettings.currentVFONumber;
}

static void dataInit() {
	settingsSet(nonVolatileSettings.initialMenuNumber, (uint8_t) UI_VFO_MODE);

	uiDataGlobal.FreqEnter.index = 0;
	uiDataGlobal.isDisplayingQSOData = false;
	uiDataGlobal.reverseRepeaterVFO = false;
	uiDataGlobal.displayQSOStatePrev = QSO_DISPLAY_IDLE;
	uiDataGlobal.currentSelectedChannelNumber = CH_DETAILS_VFO_CHANNEL; /* This is not a regular channel. Its the special VFO channel! */

	currentChannelData = &settingsVFOChannel[nonVolatileSettings.currentVFONumber];
	currentChannelData->libreDMR_Power = 0x00; /* Force channel to the Master power */

	display_channel_settings = false;

	trxSetFrequency(currentChannelData->rxFreq, currentChannelData->txFreq, DMR_MODE_AUTO);

	if (currentChannelData->rxGroupList != 0) {
		if (currentChannelData->rxGroupList != lastLoadedRxGroup) {
			if (codeplugRxGroupGetDataForIndex(currentChannelData->rxGroupList, &currentRxGroupData)) {
				lastLoadedRxGroup = currentChannelData->rxGroupList;
			} else {
				lastLoadedRxGroup = -1;
			}
		}
	} else {
		/* If the VFO doesnt have an Rx Group ( TG List) the global var needs to be cleared, */
		/* otherwise it contains the data from the previous screen e.g. Channel screen */

		memset(&currentRxGroupData, 0xFF, sizeof(struct_codeplugRxGroup_t));
		lastLoadedRxGroup = -1;
	}

	uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;

	lastHeardClearLastID();
	loadChannelData();

	freqEnterReset();
	settingsSetVFODirty();
}

void uiVFOMode() {
	dataInit();
	guiInit();

	uiHeaderInfoUpdate();
}
