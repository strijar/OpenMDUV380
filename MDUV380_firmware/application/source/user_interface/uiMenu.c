/*
 * Copyright (C) 2023 Oleg Belousov, R1CBU
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

static bool			was_opened = false;

static lv_obj_t 	*menu;

static lv_obj_t *create_text(lv_obj_t *parent, const char *icon, const char *txt);

static void back_event_cb(lv_event_t *e) {
	lv_obj_t *obj = lv_event_get_target(e);
	lv_obj_t *menu = lv_event_get_user_data(e);

	if (lv_menu_back_btn_is_root(menu, obj)) {
    	lv_obj_del(menu);
    	lv_group_add_obj(lv_group_get_default(), lv_scr_act());
    }
}

static void key_cb(lv_event_t *e) {
	uint32_t key = lv_event_get_key(e);

	switch (key) {
		case LV_KEY_ESC:
			lv_event_send(lv_menu_get_main_header_back_btn(menu), LV_EVENT_CLICKED, NULL);
			break;

		default:
			break;
	}
}

void uiMenu() {
	was_opened = true;
	lv_group_remove_obj(lv_scr_act());

	menu = lv_menu_create(lv_scr_act());
	lv_obj_set_style_pad_all(menu, 0, 0);

	lv_obj_add_event_cb(menu, back_event_cb, LV_EVENT_CLICKED, menu);

	lv_obj_add_style(lv_menu_get_main_header(menu), &header_style, 0);
	lv_obj_set_style_bg_img_src(menu, &wallpaper, LV_PART_MAIN);
	lv_obj_set_pos(menu, 0, 0);
    lv_obj_set_size(menu, 160, 128);

    lv_obj_t	*root_page;
    lv_obj_t 	*cont;
    lv_obj_t 	*section;

    root_page = lv_menu_page_create(menu, "Menu");

    section = lv_menu_section_create(root_page);

	lv_obj_add_event_cb(section, key_cb, LV_EVENT_KEY, NULL);
	lv_obj_add_style(section, &main_style, LV_PART_MAIN);

    cont = create_text(section, NULL, "Zone");
    lv_group_focus_obj(cont);

    cont = create_text(section, NULL, "Contacts");

    cont = create_text(section, NULL, "Channel details");

    cont = create_text(section, NULL, "RSSI");

    cont = create_text(section, NULL, "Firmware info");

    cont = create_text(section, NULL, "Options");

    cont = create_text(section, NULL, "Last heard");

    cont = create_text(section, NULL, "Radio info");

    cont = create_text(section, NULL, "Satellite");

    cont = create_text(section, NULL, "GPS");

    lv_menu_set_page(menu, root_page);
}

bool uiMenuWasOpened() {
	if (was_opened) {
		was_opened = false;
		return true;
	}

	return false;
}

static lv_obj_t * create_text(lv_obj_t *parent, const char *icon, const char *txt) {
    lv_obj_t *obj = lv_menu_cont_create(parent);

    lv_obj_set_style_pad_all(obj, 0, 0);

    lv_obj_add_flag(obj, LV_OBJ_FLAG_SCROLL_ON_FOCUS);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE);

    lv_group_add_obj(lv_group_get_default(), obj);

    if (icon) {
        lv_obj_t *img = lv_img_create(obj);

        lv_img_set_src(img, icon);
    }

    if (txt) {
        lv_obj_t *label = lv_label_create(obj);

        lv_label_set_text(label, txt);
        lv_label_set_long_mode(label, LV_LABEL_LONG_SCROLL_CIRCULAR);
        lv_obj_set_style_text_line_space(label, 0, 0);
        lv_obj_set_flex_grow(label, 1);
    }

    return obj;
}
