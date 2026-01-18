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
#include "io/keyboard.h"

typedef enum {
	SWITCH_HOTSPOT = 0,
} switches_t;

static lv_obj_t *createText(lv_obj_t *parent, const char *txt);
static lv_obj_t *createSwitch(lv_obj_t *parent, const char *txt, switches_t id);

static void backEventHandler(lv_event_t *e) {
    lv_obj_t * obj = lv_event_get_target(e);
    lv_obj_t * menu = lv_event_get_user_data(e);

    if (lv_menu_back_btn_is_root(menu, obj)) {
    	keyboardAlt(false);
		lv_obj_del(menu);
		lv_group_add_obj(lv_group_get_default(), lv_scr_act());
    }
}

static void makeSettingsPage(lv_obj_t *menu, lv_obj_t *root_section) {
    lv_obj_t 	*cont;
    lv_obj_t 	*sub_page = lv_menu_page_create(menu, "Settings");
    lv_obj_t	*section = lv_menu_section_create(sub_page);

    lv_obj_add_style(section, &main_style, LV_PART_MAIN);

    createSwitch(section, "HotSpot", SWITCH_HOTSPOT);

    /* * */

	cont = createText(root_section, "Settings");

    lv_menu_set_load_page_event(menu, cont, sub_page);
}

void uiMenu() {
	keyboardAlt(true);
	lv_group_remove_obj(lv_scr_act());

	lv_obj_t *menu = lv_menu_create(lv_scr_act());
	lv_obj_set_style_pad_all(menu, 0, 0);

	lv_obj_add_style(lv_menu_get_main_header(menu), &header_style, 0);
	lv_obj_set_style_bg_img_src(menu, &wallpaper, LV_PART_MAIN);
	lv_obj_set_pos(menu, 0, 0);
    lv_obj_set_size(menu, 160, 128);

    lv_obj_t *back_btn = lv_menu_get_main_header_back_btn(menu);

	lv_obj_add_style(back_btn, (lv_style_t *) &main_style, LV_PART_MAIN);
	lv_obj_add_style(back_btn, (lv_style_t *) &bottom_item_style, LV_PART_MAIN);
	lv_obj_add_style(back_btn, (lv_style_t *) &focused_style, LV_PART_MAIN | LV_STATE_FOCUS_KEY);

    lv_menu_set_mode_root_back_btn(menu, LV_MENU_ROOT_BACK_BTN_ENABLED);
    lv_obj_add_event_cb(menu, backEventHandler, LV_EVENT_CLICKED, menu);

    /* * */

    lv_obj_t *root_page = lv_menu_page_create(menu, "Menu");
    lv_obj_t *root_section = lv_menu_section_create(root_page);

    lv_obj_add_style(root_section, &main_style, LV_PART_MAIN);

	makeSettingsPage(menu, root_section);

	lv_menu_set_page(menu, root_page);
}

static lv_obj_t * createText(lv_obj_t *parent, const char *txt) {
    lv_obj_t *obj = lv_menu_cont_create(parent);
    lv_obj_t *img = NULL;
    lv_obj_t *label = NULL;

    lv_obj_set_style_pad_all(obj, 0, 0);

    lv_obj_add_flag(obj, LV_OBJ_FLAG_SCROLL_ON_FOCUS);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_EVENT_BUBBLE);

    lv_group_add_obj(lv_group_get_default(), obj);

    if (txt) {
        label = lv_label_create(obj);

        lv_label_set_text(label, txt);
        lv_label_set_long_mode(label, LV_LABEL_LONG_SCROLL_CIRCULAR);
        lv_obj_set_style_text_line_space(label, 0, 0);
        lv_obj_set_flex_grow(label, 1);
    }

    return obj;
}

static void switchEventCallback(lv_event_t *e) {
	lv_obj_t 	*sw = lv_event_get_user_data(e);
	switches_t	id = (switches_t) lv_obj_get_user_data(sw);
	bool		on = false;

	switch (id) {
		case SWITCH_HOTSPOT:
			on = !nonVolatileSettings.hotspotType;
			nonVolatileSettings.hotspotType = on;

			if (on) {
				uiHotspotInit();
			} else {
				uiHotspotDone();
			}
			break;

		default:
			break;
	}

	if (on) {
		lv_obj_add_state(sw, LV_STATE_CHECKED);
	} else {
		lv_obj_clear_state(sw, LV_STATE_CHECKED);
	}
}

static lv_obj_t * createSwitch(lv_obj_t *parent, const char *txt, switches_t id) {
    lv_obj_t	*obj = createText(parent, txt);
    lv_obj_t 	*sw = lv_switch_create(obj);

    lv_obj_add_style(sw, &switch_style, LV_PART_MAIN);
    lv_obj_add_style(sw, &switch_indicator_style, LV_PART_INDICATOR);
    lv_obj_add_style(sw, &switch_knob_style, LV_PART_KNOB);
    lv_obj_add_style(sw, &switch_indicator_checked_style, LV_PART_INDICATOR | LV_STATE_CHECKED);
    lv_obj_add_style(sw, &switch_knob_checked_style, LV_PART_KNOB | LV_STATE_CHECKED);
    lv_obj_set_user_data(sw, (void *) id);

    bool val;

    switch (id) {
    	case SWITCH_HOTSPOT:
    		val = nonVolatileSettings.hotspotType;
    		break;

    	default:
    		break;
    }

    if (val) {
    	lv_obj_add_state(sw, LV_STATE_CHECKED);
    }

	lv_obj_add_event_cb(obj, switchEventCallback, LV_EVENT_CLICKED, sw);
    lv_group_remove_obj(sw);

    return obj;
}
