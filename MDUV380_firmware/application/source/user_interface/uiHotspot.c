/*
 * Copyright (C) 2019-2022 Roger Clark, VK3KYY / G4KYF
 *                         Daniel Caujolle-Bert, F1RMB
 *                         Oleg Belousov, R1CBU
 *
 * Using information from the MMDVM_HS source code by Andy CA6JAU
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

#include "hardware/HR-C6000.h"

#include "functions/calibration.h"
#include "functions/hotspot.h"
#include "functions/settings.h"
#include "functions/sound.h"
#include "functions/ticks.h"
#include "functions/trx.h"
#include "functions/rxPowerSaving.h"

#include "usb/usb_com.h"
#include "user_interface/uiEvents.h"
#include "user_interface/uiHotspot.h"
#include "user_interface/styles.h"
#include "user_interface/uiUtilities.h"


/*
                                Problems with MD-390 on the same frequency
                                ------------------------------------------

 Using a Dual Hat:
M: 2020-01-07 08:46:23.337 DMR Slot 2, received RF voice header from F1RMB to 5000
M: 2020-01-07 08:46:24.143 DMR Slot 2, received RF end of voice transmission from F1RMB to 5000, 0.7 seconds, BER: 0.4%
M: 2020-01-07 08:46:24.644 DMR Slot 2, RF user 12935424 rejected

 Using OpenHD77 HS
 PC 5000 sent from a GD-77
M: 2020-01-07 09:51:55.467 DMR Slot 2, received RF voice header from F1RMB to 5000
M: 2020-01-07 09:51:56.727 DMR Slot 2, received RF end of voice transmission from F1RMB to 5000, 1.1 seconds, BER: 0.3%
M: 2020-01-07 09:52:00.068 DMR Slot 2, received network voice header from 5000 to TG 9
M: 2020-01-07 09:52:03.428 DMR Slot 2, received network end of voice transmission from 5000 to TG 9, 3.5 seconds, 0% packet loss, BER: 0.0%

 Its echo (data sent from the MD-390, by itself):
M: 2020-01-07 09:52:07.300 DMR Slot 2, received RF voice header from F1RMB to 5000
M: 2020-01-07 09:52:09.312 DMR Slot 2, RF voice transmission lost from F1RMB to 5000, 0.0 seconds, BER: 0.0%
M: 2020-01-07 09:52:11.856 DMR Slot 2, received network voice header from 5000 to TG 9
M: 2020-01-07 09:52:15.246 DMR Slot 2, received network end of voice transmission from 5000 to TG 9, 3.5 seconds, 0% packet loss, BER: 0.0%


	 There is a problem if you have a MD-390, GPS enabled, listening on the same frequency (even without different DMRId, I checked !).
	 It send invalid data from time to time (that's not critical, it's simply rejected), but once it heard a PC or TG call (from other
	 transceiver), it will keep repeating that, instead of invalid data.

	 After investigations, it's turns out if you enable 'GPS System' (even with correct configuration, like
	 GC xxx999 for BM), it will send such weird or echo data each GPS interval.

 ** Long story short: turn off GPS stuff on your MD-390 if it's listening local transmissions from other transceivers. **

 */

static uint8_t	savedDMRDestinationFilter = 0xFF; 	/* 0xFF value means unset */
static uint8_t	savedDMRCcTsFilter = 0xFF; 			/* 0xFF value means unset */
static uint32_t	savedTGorPC;
static uint8_t	savedLibreDMR_Power;

static lv_obj_t *main_obj = NULL;
static lv_obj_t *msg[3];

static void uiInit() {
	lv_event_send(lv_scr_act(), EVENT_MAIN_HIDE, NULL);

	main_obj = lv_obj_create(lv_scr_act());

	lv_obj_add_style(main_obj, &main_style, 0);
	lv_obj_add_style(main_obj, &bordered_style, 0);
	lv_obj_add_style(main_obj, &caller_style, 0);

	for (uint8_t i = 0; i < 3; i++) {
		msg[i] = lv_label_create(main_obj);

		if (i == 0) {
			lv_label_set_text(msg[i], "Hot spot");
			lv_obj_add_style(msg[i], &caller_header_style, 0);
		} else {
			lv_label_set_text(msg[i], "");
			lv_obj_set_style_width(msg[i], 150, 0);
			lv_obj_set_style_height(msg[i], 20, 0);
			lv_obj_set_style_x(msg[i], 2, 0);
			lv_obj_set_style_y(msg[i], 25 + (i - 1) * 20, 0);
		}
	}
}

void uiHotspotInit() {
	rxPowerSavingSetLevel(0);

	// DMR filter level isn't saved yet (cycling power OFF/ON quickly can corrupt
	// this value otherwise, as menuHotspotMode(true) could be called twice.

	if (savedDMRDestinationFilter == 0xFF) {
		// Override DMR filtering
		savedDMRDestinationFilter = nonVolatileSettings.dmrDestinationFilter;
		savedDMRCcTsFilter = nonVolatileSettings.dmrCcTsFilter;

		nonVolatileSettings.dmrDestinationFilter = DMR_DESTINATION_FILTER_NONE;
		nonVolatileSettings.dmrCcTsFilter = DMR_CCTS_FILTER_CC_TS;
	}

	// Do not user per channel power settings

	savedLibreDMR_Power = currentChannelData->libreDMR_Power;
	currentChannelData->libreDMR_Power = 0;

	savedTGorPC = trxTalkGroupOrPcId;// Save the current TG or PC

	hotspotInit();
	displayLightTrigger(false);
}

void uiHotspotTick() {
	processUSBDataQueue();

	if (comRecvMMDVMFrameCount > 0) {
		handleHotspotRequest();
	}

	hotspotStateMachine();

	if (hotspotCwKeying) {
		if (hotspotCwpoLen > 0) {
			cwProcess();
		}
	}
}

void uiHotspotRestoreSettings() {
	if (savedDMRDestinationFilter != 0xFF) {
		nonVolatileSettings.dmrDestinationFilter = savedDMRDestinationFilter;
		savedDMRDestinationFilter = 0xFF; // Unset saved DMR destination filter level

		nonVolatileSettings.dmrCcTsFilter = savedDMRCcTsFilter;
		savedDMRCcTsFilter = 0xFF; // Unset saved CC TS filter level

		HRC6000ResetTimeSlotDetection();
	}
}

static void displayContactInfo(uint8_t y, char *text, size_t maxLen)
{
	// Max for TalkerAlias is 37: TA 27 (in 7bit format) + ' [' + 6 (Maidenhead)  + ']' + NULL
	// Max for DMRID Database is MAX_DMR_ID_CONTACT_TEXT_LENGTH (50 + NULL)
	char buffer[MAX_DMR_ID_CONTACT_TEXT_LENGTH];

	if (strlen(text) >= 5)
	{
		int32_t  cpos;

		if ((cpos = getFirstSpacePos(text)) != -1)
		{
			// Callsign found
			memcpy(buffer, text, cpos);
			buffer[cpos] = 0;
			displayPrintCentered(y, chomp(buffer), FONT_SIZE_3);
		}
		else
		{
			// No space found, use a chainsaw
			memcpy(buffer, text, 16);
			buffer[16] = 0;

			displayPrintCentered(y, chomp(buffer), FONT_SIZE_3);
		}
	}
	else
	{
		memcpy(buffer, text, strlen(text));
		buffer[strlen(text)] = 0;
		displayPrintCentered(y, chomp(buffer), FONT_SIZE_3);
	}
}

static void updateContactLine(uint8_t y)
{
	if ((LinkHead->talkGroupOrPcId >> 24) == PC_CALL_FLAG) // Its a Private call
	{
		displayPrintCentered(y, LinkHead->contact, FONT_SIZE_3);
	}
	else // Group call
	{
		switch (nonVolatileSettings.contactDisplayPriority)
		{
			case CONTACT_DISPLAY_PRIO_CC_DB_TA:
			case CONTACT_DISPLAY_PRIO_DB_CC_TA:
				// No contact found is codeplug and DMRIDs, use TA as fallback, if any.
				if ((strncmp(LinkHead->contact, "ID:", 3) == 0) && (LinkHead->talkerAlias[0] != 0x00))
				{
					displayContactInfo(y, LinkHead->talkerAlias, sizeof(LinkHead->talkerAlias));
				}
				else
				{
					displayContactInfo(y, LinkHead->contact, sizeof(LinkHead->contact));
				}
				break;

			case CONTACT_DISPLAY_PRIO_TA_CC_DB:
			case CONTACT_DISPLAY_PRIO_TA_DB_CC:
				// Talker Alias have the priority here
				if (LinkHead->talkerAlias[0] != 0x00)
				{
					displayContactInfo(y, LinkHead->talkerAlias, sizeof(LinkHead->talkerAlias));
				}
				else // No TA, then use the one extracted from Codeplug or DMRIdDB
				{
					displayContactInfo(y, LinkHead->contact, sizeof(LinkHead->contact));
				}
				break;
		}
	}
}

void uiHotspotUpdateScreen(uint8_t rxCommandState) {
	if (main_obj == NULL) {
		uiInit();
	}

	if (trxTransmissionEnabled) {
		lv_label_set_text(msg[1], "TX");
		lv_label_set_text(msg[2], "");

	} else {
		dmrIdDataStruct_t currentRec;

		switch (rxCommandState) {
			case HOTSPOT_RX_START:
			case HOTSPOT_RX_START_LATE:
				if (dmrIDLookup(hotspotRxedDMR_LC.srcId, &currentRec)) {
					lv_label_set_text(msg[1], currentRec.text);
				} else {
					lv_label_set_text_fmt(msg[1], "ID: %u", hotspotRxedDMR_LC.srcId);
				}

				if (hotspotRxedDMR_LC.FLCO == 0) {
					lv_label_set_text_fmt(msg[2], "TG: %u", hotspotRxedDMR_LC.dstId);
				} else {
					lv_label_set_text_fmt(msg[2], "PC: %u", hotspotRxedDMR_LC.dstId);
				}
				break;

			default:
				lv_label_set_text(msg[1], "");
				lv_label_set_text(msg[2], "Wait");
				break;
		}
	}

	/*
	int val_before_dp;
	int val_after_dp;
	char buffer[22]; // set to 22 due to FW info

	hotspotCurrentRxCommandState = rxCommandState;

	displayClearBuf();
	displayPrintAt(4, 4, "DMR", FONT_SIZE_1);
	displayPrintCentered(0, "Hotspot", FONT_SIZE_3);

	// Display battery percentage/voltage
	if (nonVolatileSettings.bitfieldOptions & BIT_BATTERY_VOLTAGE_IN_HEADER)
	{
		int volts, mvolts;
		int16_t xV = (DISPLAY_SIZE_X - ((4 * 6) + 6));

		getBatteryVoltage(&volts, &mvolts);

		snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%2d", volts);
		displayPrintCore(xV, 4, buffer, FONT_SIZE_1, TEXT_ALIGN_LEFT, false);

		displayDrawRect(xV + (6 * 2), 4 + 5, 2, 2, true);

		snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%1dV", mvolts);
		displayPrintCore(xV + (6 * 2) + 3, 4, buffer, FONT_SIZE_1, TEXT_ALIGN_LEFT, false);
	}
	else
	{
		snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%d%%", getBatteryPercentage());
		displayPrintAt(DISPLAY_SIZE_X - (strlen(buffer) * 6) - 4, 4, buffer, FONT_SIZE_1);
	}

	batteryUpdateTimeout = ticksGetMillis();
	batteryAverageMillivolts = getBatteryAverageInMillivolts();

	if (trxTransmissionEnabled)
	{
		if (displayFWVersion)
		{
			snprintf(buffer, 22, "%s", &HOTSPOT_VERSION_STRING[12]);
			displayPrintCentered(16 + 4, buffer, FONT_SIZE_1);
		}
		else
		{
			if (hotspotCwKeying)
			{
				sprintf(buffer, "%s", "<Tx CW ID>");
				displayPrintCentered(16, buffer, FONT_SIZE_3);
			}
			else
			{
				updateContactLine(16);
			}
		}

		if (hotspotCwKeying)
		{
			buffer[0] = 0;
		}
		else
		{
			if ((trxTalkGroupOrPcId >> 24) == PC_CALL_FLAG)
			{
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s %u", currentLanguage->pc, trxTalkGroupOrPcId & 0x00FFFFFF);
			}
			else
			{
				uint32_t id = (trxTalkGroupOrPcId & 0x00FFFFFF);

				if (id == 0)
				{
					buffer[0] = 0; // Do not display "TG 0"
				}
				else
				{
					snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s %u", currentLanguage->tg, id);
				}
			}
		}

		displayPrintCentered(32, buffer, FONT_SIZE_3);

		val_before_dp = hotspotFreqTx / 100000;
		val_after_dp = hotspotFreqTx - val_before_dp * 100000;
		sprintf(buffer, "T %d.%05d MHz", val_before_dp, val_after_dp);
	}
	else
	{
		if (rxCommandState == HOTSPOT_RX_START  || rxCommandState == HOTSPOT_RX_START_LATE)
		{
			dmrIdDataStruct_t currentRec;

			if (displayFWVersion)
			{
				snprintf(buffer, 22, "%s", &HOTSPOT_VERSION_STRING[12]);
			}
			else
			{
				if (dmrIDLookup(hotspotRxedDMR_LC.srcId, &currentRec) == true)
				{
					snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s", currentRec.text);
				}
				else
				{
					snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "ID: %u", hotspotRxedDMR_LC.srcId);
				}
			}

			displayPrintCentered(16 + (displayFWVersion ? 4 : 0), buffer, (displayFWVersion ? FONT_SIZE_1 : FONT_SIZE_3));

			if (hotspotRxedDMR_LC.FLCO == 0)
			{
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s %u", currentLanguage->tg, hotspotRxedDMR_LC.dstId);
			}
			else
			{
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s %u", currentLanguage->pc, hotspotRxedDMR_LC.dstId);
			}

			displayPrintCentered(32, buffer, FONT_SIZE_3);
		}
		else
		{

			if (displayFWVersion)
			{
				snprintf(buffer, 22, "%s", &HOTSPOT_VERSION_STRING[12]);
				displayPrintCentered(16 + 4, buffer, FONT_SIZE_1);
			}
			else
			{
				if (hotspotModemState == STATE_POCSAG)
				{
					displayPrintCentered(16, "<POCSAG>", FONT_SIZE_3);
				}
				else
				{
					if (strlen(hotspotMmdvmQSOInfoIP))
					{
						displayPrintCentered(16 + 4, hotspotMmdvmQSOInfoIP, FONT_SIZE_1);
					}
				}
			}

			snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "CC:%u", trxGetDMRColourCode());//, trxGetDMRTimeSlot()+1) ;

			displayPrintCore(0, 32, buffer, FONT_SIZE_3, TEXT_ALIGN_LEFT, false);

			sprintf(buffer,"%s%s",POWER_LEVELS[hotspotPowerLevel],POWER_LEVEL_UNITS[hotspotPowerLevel]);
			displayPrintCore(0, 32, buffer, FONT_SIZE_3, TEXT_ALIGN_RIGHT, false);
		}
		val_before_dp = hotspotFreqRx / 100000;
		val_after_dp = hotspotFreqRx - val_before_dp * 100000;
		snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "R %d.%05d MHz", val_before_dp, val_after_dp);
	}

	displayPrintCentered(48, buffer, FONT_SIZE_3);
	displayRender();

	if (trxTransmissionEnabled || ((rxCommandState == HOTSPOT_RX_START) || (rxCommandState == HOTSPOT_RX_START_LATE)))
	{
		displayLightTrigger(false);
	}
	*/
}

void uiHotspotDone() {
	if (main_obj) {
		lv_obj_del(main_obj);
		main_obj = NULL;
		lv_event_send(lv_scr_act(), EVENT_MAIN_SHOW, NULL);
	}

	trxDisableTransmission();

	if (trxTransmissionEnabled) {
		trxTransmissionEnabled = false;
		//trxSetRX();

		LedWrite(LED_GREEN, 0);

		if (hotspotCwKeying) {
			cwReset();
			hotspotCwKeying = false;
		}
	}

	currentChannelData->libreDMR_Power = savedLibreDMR_Power;

	trxTalkGroupOrPcId = savedTGorPC; /* restore the current TG or PC */

	if (hotspotSavedPowerLevel != -1) {
		trxSetPowerFromLevel(hotspotSavedPowerLevel);
	}

	setTxDMRID(codeplugGetUserDMRID());
	settingsUsbMode = USB_MODE_CPS;
	hotspotConnected = false;

	rxPowerSavingSetLevel(nonVolatileSettings.ecoLevel);

	uiHotspotRestoreSettings();
}
