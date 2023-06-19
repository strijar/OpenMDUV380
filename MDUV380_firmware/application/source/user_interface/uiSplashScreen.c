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
#include "user_interface/uiSplashScreen.h"
#include "user_interface/uiChannelMode.h"
#include "user_interface/uiVFOMode.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/uiLocalisation.h"
#include "functions/codeplug.h"
#include "functions/settings.h"
#include "functions/ticks.h"

static lv_obj_t *main_obj;
static lv_obj_t	*msg;
static lv_obj_t	*yes;
static lv_obj_t	*no;

static void talkerMsg();

static void timeout(lv_timer_t *t) {
	switch (nonVolatileSettings.initialMenuNumber) {
		case UI_CHANNEL_MODE:
			uiChannelMode();
			break;

		case UI_VFO_MODE:
			uiVFOMode();
			break;

		default:
			break;
	}
}

static void keyCallback(lv_event_t * e) {
	uint32_t	key = lv_event_get_key(e);

	switch (key) {
		case LV_KEY_ENTER:
			settingsRestoreDefaultSettings();
			settingsLoadSettings();
			/* no break */

		case LV_KEY_ESC:
			lv_obj_del(yes);
			lv_obj_del(no);
			talkerMsg();
			break;
	}
}

static void defaultSettingsMsg() {
	lv_coord_t	y = 128 - 2 - 20;

	lv_obj_add_event_cb(main_obj, keyCallback, LV_EVENT_KEY, NULL);
	lv_group_add_obj(lv_group_get_default(), main_obj);

	lv_label_set_text(msg, "Set default\nsettings?");

	yes = lv_label_create(main_obj);

	lv_label_set_text(yes, "Yes");
	lv_obj_set_pos(yes, 2, y);
	lv_obj_set_size(yes, 160/3, 20);

	lv_obj_add_style(yes, (lv_style_t *) &main_style, 0);
	lv_obj_add_style(yes, (lv_style_t *) &bordered_style, 0);
	lv_obj_add_style(yes, (lv_style_t *) &bottom_item_style, 0);

	no = lv_label_create(main_obj);

	lv_label_set_text(no, "No");
	lv_obj_set_pos(no, 160 - 160/3 - 2, y);
	lv_obj_set_size(no, 160/3, 20);

	lv_obj_add_style(no, (lv_style_t *) &main_style, 0);
	lv_obj_add_style(no, (lv_style_t *) &bordered_style, 0);
	lv_obj_add_style(no, (lv_style_t *) &bottom_item_style, 0);
}

static void talkerMsg() {
	char line1[(SCREEN_LINE_BUFFER_SIZE * 2) + 1];
	char line2[SCREEN_LINE_BUFFER_SIZE];

	codeplugGetBootScreenData(line1, line2, NULL);

	lv_label_set_text_fmt(msg, "%s\n%s", line1, line2);

	strcat(line1, " ");
	strcat(line1, line2);
	HRC6000SetTalkerAlias(line1);

	lv_timer_t *timer = lv_timer_create(timeout, 3000, NULL);
	lv_timer_set_repeat_count(timer, 1);
}

void uiSplashScreen() {
	main_obj = lv_obj_create(NULL);

	lv_obj_set_style_bg_img_src(main_obj, &wallpaper, LV_PART_MAIN);

	lv_obj_t *obj = lv_label_create(main_obj);

	lv_label_set_text(obj, "OpenMDUV-NG");

	lv_obj_add_style(obj, &main_style, 0);
	lv_obj_add_style(obj, &bordered_style, 0);
	lv_obj_add_style(obj, &splash_item_style, 0);

	lv_obj_set_height(obj, 28);
	lv_obj_set_pos(obj, 2, 2);

	/* * */

	msg = lv_label_create(main_obj);

	lv_obj_add_style(msg, &main_style, 0);
	lv_obj_add_style(msg, &bordered_style, 0);
	lv_obj_add_style(msg, &splash_item_style, 0);

	lv_obj_set_height(msg, 44);
	lv_obj_center(msg);

	if (buttonsPressed(BUTTON_SK2)) {
		defaultSettingsMsg();
	} else {
		talkerMsg();
	}

	lv_scr_load_anim(main_obj, LV_SCR_LOAD_ANIM_NONE, 0, 0, true);
}
