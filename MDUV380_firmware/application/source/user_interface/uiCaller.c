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
#include "user_interface/uiUtilities.h"
#include "user_interface/uiCaller.h"
#include "user_interface/styles.h"
#include "user_interface/uiEvents.h"

static lv_obj_t	*main_obj = NULL;
static lv_obj_t	*header_obj = NULL;
static lv_obj_t	*info_obj = NULL;

void uiCallerInit() {
	if (main_obj == NULL) {
		lv_event_send(lv_scr_act(), EVENT_MAIN_HIDE, NULL);

		main_obj = lv_obj_create(lv_scr_act());

		lv_obj_add_style(main_obj, &main_style, 0);
		lv_obj_add_style(main_obj, &bordered_style, 0);
		lv_obj_add_style(main_obj, &caller_style, 0);

		header_obj = lv_label_create(main_obj);

		lv_obj_add_style(header_obj, &caller_header_style, 0);

		info_obj = lv_label_create(main_obj);

		lv_obj_add_style(info_obj, &caller_info_style, 0);
	}

	uiCallerUpdate();
}

void uiCallerUpdate() {
	uiDataGlobal.receivedPcId = 0x00;

	if (main_obj == NULL) {
		return;
	}

	/*
	 * Note.
	 * When using Brandmeister reflectors. TalkGroups can be used to select reflectors e.g. TG 4009, and TG 5000 to check the connnection
	 * Under these conditions Brandmeister seems to respond with a message via a private call even if the command was sent as a TalkGroup,
	 * and this caused the Private Message acceptance system to operate.
	 * Brandmeister seems respond on the same ID as the keyed TG, so the code
	 * (LinkHead->id & 0xFFFFFF) != (trxTalkGroupOrPcId & 0xFFFFFF)  is designed to stop the Private call system tiggering in these instances
	 *
	 * FYI. Brandmeister seems to respond with a TG value of the users on ID number,
	 * but I thought it was safer to disregard any PC's from IDs the same as the current TG
	 * rather than testing if the TG is the user's ID, though that may work as well.
	 */

	if (HRC6000GetReceivedTgOrPcId() == 0) {
		lv_label_set_text_static(main_obj, "[ None ]");
		return;
	}

	char contact[MAX_DMR_ID_CONTACT_TEXT_LENGTH];

	strcpy(contact, LinkHead->contact);

	for (uint8_t i = 0; i < strlen(contact); i++)
		if (contact[i] == ' ') {
			contact[i] = '\n';
			break;
		}

	if ((LinkHead->talkGroupOrPcId >> 24) == PC_CALL_FLAG) { /* Its a Private call */
		lv_label_set_text_static(header_obj, "Private call");
		lv_label_set_text_fmt(info_obj, "%s\n%s",
		    contact,
			((LinkHead->talkGroupOrPcId & 0x00FFFFFF) == ALL_CALL_VALUE) ? "All call" : LinkHead->talkgroup
		);
	} else { /* Group call */
		bool different =
				(((LinkHead->talkGroupOrPcId & 0xFFFFFF) != trxTalkGroupOrPcId ) ||
				(((trxDMRModeRx != DMR_MODE_DMO) && (dmrMonitorCapturedTS != -1)) && (dmrMonitorCapturedTS != trxGetDMRTimeSlot())) ||
				(trxGetDMRColourCode() != currentChannelData->txColor));

		if (different && nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_2) {
			soundSetMelody(MELODY_RX_TGTSCC_WARNING_BEEP);
		}

		lv_label_set_text(header_obj, LinkHead->talkgroup);

		if ((strncmp(LinkHead->contact, "ID:", 3) == 0) && (LinkHead->talkerAlias[0] != 0x00)) { // No contact found in codeplug and DMRIDs, use TA as fallback, if any.
			if (LinkHead->locationLat <= 90) {
				char maidenheadBuffer[8];

				coordsToMaidenhead((uint8_t *) maidenheadBuffer, LinkHead->locationLat, LinkHead->locationLon);

				lv_label_set_text_fmt(info_obj, "%s [%s]", LinkHead->talkerAlias, maidenheadBuffer);
			} else {
				lv_label_set_text(info_obj, LinkHead->talkerAlias);
			}
		} else {
			lv_label_set_text(info_obj, contact);
		}
	}
	displayLightTrigger(false);
}

bool uiCallerIsShow() {
	return main_obj != NULL;
}

void uiCallerDone() {
	if (main_obj) {
		lv_event_send(lv_scr_act(), EVENT_MAIN_SHOW, NULL);

		lv_obj_del(main_obj);
		main_obj = NULL;
	}
}
