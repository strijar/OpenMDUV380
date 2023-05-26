/*
 * Copyright (C) 2019-2023 Roger Clark, VK3KYY / G4KYF
 *                         Colin, G4EML
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

#include "user_interface/uiHeader.h"
#include "user_interface/styles.h"
#include "user_interface/uiGlobals.h"
#include "user_interface/uiUtilities.h"
#include "interfaces/batteryAndPowerManagement.h"
#include "functions/trx.h"
#include "functions/settings.h"

static lv_obj_t 	*main_obj;
static lv_obj_t		*mode_obj;
static lv_obj_t		*ts_obj;
static lv_obj_t		*pwr_obj;
static lv_obj_t		*bat_obj;
static lv_obj_t		*meter_obj;

static lv_timer_t	*bat_timer = NULL;
static lv_timer_t	*meter_timer = NULL;

static const char	*power_labels[] = { "50mW", "250mW", "500mW", "750mW", "1W", "2W", "3W", "4W", "5W", "+W-"};

static void batUpdate(lv_timer_t *t) {
	bool batteryIsLow = batteryIsLowWarning();

	if (nonVolatileSettings.bitfieldOptions & BIT_BATTERY_VOLTAGE_IN_HEADER) {
		int volts = 0, mvolts = 0;

		getBatteryVoltage(&volts, &mvolts);

		lv_label_set_text_fmt(bat_obj, "%2d.%1dV", volts, mvolts);
	} else {
		lv_label_set_text_fmt(bat_obj, "%d%%", getBatteryPercentage());
	}
}

static void meterUpdate(lv_timer_t *t) {
	lv_obj_invalidate(meter_obj);
}

static void meterDraw(lv_event_t *e) {
	lv_obj_t			*obj = lv_event_get_target(e);
	lv_draw_ctx_t		*draw_ctx = lv_event_get_draw_ctx(e);
	lv_draw_rect_dsc_t	rect_dsc;
	lv_area_t			area;
	int32_t				value = 0;
	int 				x;

	lv_coord_t	x1 = obj->coords.x1;
	lv_coord_t	y1 = obj->coords.y1;

	lv_draw_rect_dsc_init(&rect_dsc);

	if (trxTransmissionEnabled) {
		rect_dsc.bg_color = lv_color_make(0xFF, 0x00, 0x00);

		if (trxGetMode() == RADIO_MODE_DIGITAL) {
			x = sqrt(micAudioSamplesTotal);

			value = (x - 0) * 19 / (100 - 0);
		} else {
			trxReadVoxAndMicStrength();

			x = trxTxMic + nonVolatileSettings.micGainFM * 15;
			value = (x - 50) * 19 / (300 - 50);
		}
	} else {
		x = trxGetRSSIdBm();

		rect_dsc.bg_color = lv_color_make(0x00, 0xFF, 0x00);
		value = (x - SMETER_S0) * 19 / (SMETER_S9_40 - SMETER_S0);
	}

	area.y1 = y1;
	area.y2 = y1 + lv_obj_get_height(obj);

	for (uint8_t i = 0; i < 19; i++) {
		rect_dsc.bg_opa = (i < value) ? LV_OPA_COVER : LV_OPA_30;

		area.x1 = x1 + i * 8;
		area.x2 = area.x1 + 8 - 3;

		lv_draw_rect(draw_ctx, &rect_dsc, &area);
	}
}

void uiHeaderStop() {
	if (bat_timer) {
		lv_timer_del(bat_timer);
		bat_timer = NULL;
	}

	if (meter_timer) {
		lv_timer_del(meter_timer);
		meter_timer = NULL;
	}
}

void uiHeaderInfoUpdate() {
	char buffer[SCREEN_LINE_BUFFER_SIZE];

	if (trxGetMode() == RADIO_MODE_ANALOG) {
		lv_label_set_text(mode_obj, trxGetBandwidthIs25kHz() ? "FM" : "FMN");
		lv_obj_add_flag(ts_obj, LV_OBJ_FLAG_HIDDEN);
	} else {
		lv_label_set_text(mode_obj, "DMR");
		lv_obj_clear_flag(ts_obj, LV_OBJ_FLAG_HIDDEN);

		bool contactTSActive = ((nonVolatileSettings.overrideTG == 0) && ((currentContactData.reserve1 & 0x01) == 0x00));
		bool tsManOverride = (contactTSActive ? tsIsContactHasBeenOverriddenFromCurrentChannel() : (tsGetManualOverrideFromCurrentChannel() != 0));

		snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s%d",
				((contactTSActive && (monitorModeData.isEnabled == false)) ? "cS" : "TS"),
				((monitorModeData.isEnabled && (dmrMonitorCapturedTS != -1))? (dmrMonitorCapturedTS + 1) : trxGetDMRTimeSlot() + 1));

		lv_label_set_text(ts_obj, buffer);
	}

	lv_label_set_text(pwr_obj, power_labels[trxGetPowerLevel()]);
}

lv_obj_t * uiHeader(lv_obj_t *parent) {
	main_obj = lv_obj_create(parent);

	lv_obj_set_pos(main_obj, 0, 0);
	lv_obj_set_size(main_obj, 160, 22);
	lv_obj_add_style(main_obj, &main_style, 0);

	pwr_obj = lv_label_create(main_obj);

	lv_obj_set_pos(pwr_obj, 0, 0);
	lv_obj_set_width(pwr_obj, 50);
	lv_obj_add_style(pwr_obj, &header_item_style, 0);

	mode_obj = lv_label_create(main_obj);

	lv_obj_set_pos(mode_obj, 52, 0);
	lv_obj_set_width(mode_obj, 30);
	lv_obj_add_style(mode_obj, &header_item_style, 0);

	ts_obj = lv_label_create(main_obj);

	lv_obj_set_pos(ts_obj, 85, 0);
	lv_obj_set_width(ts_obj, 23);
	lv_obj_add_style(ts_obj, &header_item_style, 0);

	bat_obj = lv_label_create(main_obj);

	lv_obj_set_pos(bat_obj, 160-40, 0);
	lv_obj_set_width(bat_obj, 40);
	lv_obj_add_style(bat_obj, &header_item_style, 0);
	lv_obj_set_style_text_align(bat_obj, LV_TEXT_ALIGN_RIGHT, 0);

	bat_timer = lv_timer_create(batUpdate, 5000, NULL);
	batUpdate(bat_timer);

	meter_obj = lv_obj_create(main_obj);

	lv_obj_set_pos(meter_obj, 4, 15);
	lv_obj_set_width(meter_obj, 160 - 4 * 2);
	lv_obj_add_style(meter_obj, &meter_style, 0);
	lv_obj_add_event_cb(meter_obj, meterDraw, LV_EVENT_DRAW_MAIN_END, NULL);

	meter_timer = lv_timer_create(meterUpdate, 100, NULL);

	return main_obj;
}
