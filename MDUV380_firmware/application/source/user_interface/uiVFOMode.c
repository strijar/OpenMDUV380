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

static void keyCallback(lv_event_t * e) {
	uint32_t key = lv_event_get_key(e);

	switch (key) {
		case LV_KEY_ESC:
			if (!uiMenuWasOpened()) {
				uiHeaderStop();
				uiChannelMode();
			}
			break;

		case LV_KEY_ENTER:
			uiMenu();
			break;

		default:
			break;
	}
}

static void buttonCallback(lv_event_t * e) {
	event_button_t *event = lv_event_get_param(e);
}

static void guiInit() {
	lv_obj_t *main_obj = lv_obj_create(NULL);

	lv_obj_add_event_cb(main_obj, buttonCallback, EVENT_BUTTON, NULL);
	lv_obj_add_event_cb(main_obj, keyCallback, LV_EVENT_KEY, NULL);
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

void uiVFOMode() {
	guiInit();

	settingsSet(nonVolatileSettings.initialMenuNumber, UI_VFO_MODE);
}
