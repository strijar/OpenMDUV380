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

#include "user_interface/uiChannelMode.h"
#include "user_interface/uiVFOMode.h"
#include "user_interface/uiEvents.h"
#include "user_interface/styles.h"

#include "functions/trx.h"
#include "user_interface/uiCPS.h"
#include "functions/rxPowerSaving.h"
#include "functions/ticks.h"
#include "hardware/radioHardwareInterface.h"

typedef enum {
	CPS_LED_NONE,
	CPS_LED_RED,
	CPS_LED_GREEN
} blinkLed_t;

static blinkLed_t		led_type = CPS_LED_NONE;
static bool				led_state = false;
static lv_timer_t		*led_timer = NULL;

static bool				ready = false;
static lv_obj_t 		*main_obj = NULL;
static lv_obj_t 		*msg[3];

static int				radio_mode;
static bool 			radio_bw;

static void ledTimerCallback(lv_timer_t *t) {
	switch (led_type) {
		case CPS_LED_GREEN:
			led_state = !led_state;
			LedWrite(LED_GREEN, (led_state ? 1 : 0));
			break;

		case CPS_LED_RED:
			led_state = !led_state;
			LedWrite(LED_RED, (led_state ? 1 : 0));
			break;

		case CPS_LED_NONE:
		default:
			break;
	}
}

static void uiInit() {
	lv_event_send(lv_scr_act(), EVENT_MAIN_HIDE, NULL);

	main_obj = lv_obj_create(lv_scr_act());

	lv_obj_add_style(main_obj, &main_style, 0);
	lv_obj_add_style(main_obj, &bordered_style, 0);
	lv_obj_add_style(main_obj, &caller_style, 0);

	for (uint8_t i = 0; i < 3; i++) {
		msg[i] = lv_label_create(main_obj);

		lv_label_set_text(msg[i], "");

		if (i == 0) {
			lv_obj_add_style(msg[i], &caller_header_style, 0);
		} else {
			lv_obj_set_style_width(msg[i], 150, 0);
			lv_obj_set_style_height(msg[i], 20, 0);
			lv_obj_set_style_x(msg[i], 2, 0);
			lv_obj_set_style_y(msg[i], 25 + (i - 1) * 20, 0);
		}
	}

	ready = true;
}

void uiCPSInit() {
	rxPowerSavingSetState(ECOPHASE_POWERSAVE_INACTIVE);
	radio_mode = trxGetMode();
	radio_bw = trxGetBandwidthIs25kHz();
	trxSetModeAndBandwidth(RADIO_MODE_NONE, radio_bw);

	if (main_obj == NULL) {
		uiInit();
	}

	if (led_timer == NULL) {
		led_timer = lv_timer_create(ledTimerCallback, 500, NULL);
	}
}

void uiCPSDone() {
	ready = false;

	if (led_timer) {
		lv_timer_del(led_timer);
		led_timer = NULL;
	}

	if (main_obj) {
		lv_obj_del(main_obj);
		main_obj = NULL;
		lv_event_send(lv_scr_act(), EVENT_MAIN_SHOW, NULL);
	}
}

void uiCPSUpdate(uiCPSCommand_t command, int x, int y, ucFont_t fontSize, ucTextAlign_t alignment, bool isInverted, char *szMsg) {
	switch (command) {
		case CPS2UI_COMMAND_CLEARBUF:
			break;

		case CPS2UI_COMMAND_PRINT:
			if (y <= 32) {
				if (!ready) {
					uiInit();
				}

				lv_label_set_text(msg[y / 15], szMsg);
			}
			break;

		case CPS2UI_COMMAND_RENDER_DISPLAY:
		case CPS2UI_COMMAND_BACKLIGHT:
			displayLightTrigger(true);
			break;

		case CPS2UI_COMMAND_GREEN_LED:
			led_type = CPS_LED_GREEN;
			break;

		case CPS2UI_COMMAND_RED_LED:
			led_type = CPS_LED_RED;
			break;

		case CPS2UI_COMMAND_END:
		    LedWrite(LED_GREEN, 0);
		    LedWrite(LED_RED, 0);
		    led_state = false;
		    led_type = CPS_LED_NONE;

		    trxSetRX();
		    trxSetModeAndBandwidth(radio_mode, radio_bw);
		    uiCPSDone();
			break;

		default:
			break;
	}
}
