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

#ifndef INCLUDE_USER_INTERFACE_STYLES_H_
#define INCLUDE_USER_INTERFACE_STYLES_H_

#include <lvgl.h>

extern const lv_img_dsc_t	wallpaper;

extern const lv_style_t		main_style;
extern const lv_style_t		bordered_style;

extern const lv_style_t		bottom_item_style;
extern const lv_style_t		notify_style;

extern const lv_style_t		splash_item_style;

extern const lv_style_t		header_style;
extern const lv_style_t		header_item_style;
extern const lv_style_t		header_manual_item_style;

extern const lv_style_t		meter_style;

extern const lv_style_t		contact_style;
extern const lv_style_t		contact_shadow_style;

extern const lv_style_t		channel_style;
extern const lv_style_t		channel_shadow_style;

extern const lv_style_t		zone_style;

extern const lv_style_t		contact_settings_style;

extern const lv_style_t		channel_settings_style;
extern const lv_style_t		channel_settings_shadow_style;

extern const lv_style_t		caller_style;
extern const lv_style_t		caller_header_style;
extern const lv_style_t		caller_info_style;

#endif /* INCLUDE_USER_INTERFACE_STYLES_H_ */
