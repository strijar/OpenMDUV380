/*
 * Copyright (C) 2019-2023 Roger Clark, VK3KYY / G4KYF
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

#include "user_interface/styles.h"

const lv_style_const_prop_t main_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0xFF)),

   LV_STYLE_CONST_BG_COLOR(0x000000),
   LV_STYLE_CONST_BG_OPA(128),

   LV_STYLE_CONST_BORDER_WIDTH(0),
   LV_STYLE_CONST_RADIUS(0),

   LV_STYLE_CONST_PAD_LEFT(0),
   LV_STYLE_CONST_PAD_RIGHT(0),
   LV_STYLE_CONST_PAD_TOP(0),
   LV_STYLE_CONST_PAD_BOTTOM(0),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t bordered_props[] = {
   LV_STYLE_CONST_BORDER_WIDTH(1),
   LV_STYLE_CONST_BORDER_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0xFF)),
   LV_STYLE_CONST_BORDER_OPA(96),

   LV_STYLE_CONST_RADIUS(4),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t bottom_item_props[] = {
   LV_STYLE_CONST_TEXT_FONT(&lv_font_18),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),
   LV_STYLE_CONST_PAD_TOP(2),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t notify_props[] = {
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),
   LV_STYLE_CONST_PAD_TOP(5),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t splash_item_props[] = {
   LV_STYLE_CONST_WIDTH(160 - 4),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),
   LV_STYLE_CONST_PAD_TOP(2),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t header_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0xFF)),

   LV_STYLE_CONST_BG_COLOR(LV_COLOR_MAKE16(0x00, 0x00, 0x55)),
   LV_STYLE_CONST_BG_OPA(128),

   LV_STYLE_CONST_RADIUS(0),
   LV_STYLE_CONST_BORDER_WIDTH(0),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t header_item_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0xFF)),

   LV_STYLE_CONST_HEIGHT(14),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_14),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t header_manual_item_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xAA, 0xAA, 0x00)),

   LV_STYLE_CONST_HEIGHT(14),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_14),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t meter_props[] = {
   LV_STYLE_CONST_RADIUS(0),
   LV_STYLE_CONST_HEIGHT(5),
   LV_STYLE_CONST_BORDER_WIDTH(0),
   LV_STYLE_CONST_BG_OPA(0),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t contact_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0xFF)),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),

   LV_STYLE_CONST_WIDTH(160),
   LV_STYLE_CONST_HEIGHT(20),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t contact_shadow_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0x00, 0x00, 0x00)),
   LV_STYLE_CONST_TEXT_OPA(192),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),

   LV_STYLE_CONST_WIDTH(160),
   LV_STYLE_CONST_HEIGHT(20),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t channel_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0xFF)),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),

   LV_STYLE_CONST_WIDTH(160),
   LV_STYLE_CONST_HEIGHT(40),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t channel_shadow_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0x00, 0x00, 0x00)),
   LV_STYLE_CONST_TEXT_OPA(192),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),

   LV_STYLE_CONST_WIDTH(160),
   LV_STYLE_CONST_HEIGHT(40),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t zone_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0xFF)),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_14),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),

   LV_STYLE_CONST_WIDTH(160),
   LV_STYLE_CONST_HEIGHT(20),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t contact_settings_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0x00)),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t channel_settings_props[] = {
   LV_STYLE_CONST_TEXT_COLOR(LV_COLOR_MAKE16(0xFF, 0xFF, 0x00)),
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t channel_settings_shadow_props[] = {
   LV_STYLE_CONST_TEXT_FONT(&lv_font_24),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t caller_props[] = {
   LV_STYLE_CONST_WIDTH(156),
   LV_STYLE_CONST_HEIGHT(75),
   LV_STYLE_CONST_ALIGN(LV_ALIGN_CENTER),

   LV_STYLE_CONST_TEXT_FONT(&lv_font_20),
   LV_STYLE_CONST_TEXT_ALIGN(LV_TEXT_ALIGN_CENTER),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t caller_header_props[] = {
   LV_STYLE_CONST_X(2),
   LV_STYLE_CONST_Y(2),

   LV_STYLE_CONST_WIDTH(150),
   LV_STYLE_CONST_HEIGHT(18),
   LV_STYLE_CONST_PAD_TOP(3),

   LV_STYLE_CONST_BG_COLOR(LV_COLOR_MAKE16(0x11, 0x55, 0xFF)),
   LV_STYLE_CONST_BG_OPA(96),

   LV_STYLE_CONST_RADIUS(4),
   LV_STYLE_CONST_BORDER_WIDTH(0),

   LV_STYLE_PROP_INV,
};

const lv_style_const_prop_t caller_info_props[] = {
   LV_STYLE_CONST_X(2),
   LV_STYLE_CONST_Y(23),
   LV_STYLE_CONST_WIDTH(150),
   LV_STYLE_CONST_HEIGHT(40),

   LV_STYLE_PROP_INV,
};

LV_STYLE_CONST_INIT(main_style, main_props);
LV_STYLE_CONST_INIT(bordered_style, bordered_props);

LV_STYLE_CONST_INIT(bottom_item_style, bottom_item_props);
LV_STYLE_CONST_INIT(notify_style, notify_props);

LV_STYLE_CONST_INIT(splash_item_style, splash_item_props);

LV_STYLE_CONST_INIT(header_style, header_props);
LV_STYLE_CONST_INIT(header_item_style, header_item_props);
LV_STYLE_CONST_INIT(header_manual_item_style, header_manual_item_props);

LV_STYLE_CONST_INIT(meter_style, meter_props);

LV_STYLE_CONST_INIT(contact_style, contact_props);
LV_STYLE_CONST_INIT(contact_shadow_style, contact_shadow_props);

LV_STYLE_CONST_INIT(channel_style, channel_props);
LV_STYLE_CONST_INIT(channel_shadow_style, channel_shadow_props);

LV_STYLE_CONST_INIT(zone_style, zone_props);

LV_STYLE_CONST_INIT(contact_settings_style, contact_settings_props);

LV_STYLE_CONST_INIT(channel_settings_style, channel_settings_props);
LV_STYLE_CONST_INIT(channel_settings_shadow_style, channel_settings_shadow_props);

LV_STYLE_CONST_INIT(caller_style, caller_props);
LV_STYLE_CONST_INIT(caller_header_style, caller_header_props);
LV_STYLE_CONST_INIT(caller_info_style, caller_info_props);
