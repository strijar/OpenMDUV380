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

#include "user_interface/menuSystem.h"
#include "user_interface/styles.h"
#include "interfaces/batteryAndPowerManagement.h"

static lv_obj_t	*msg = NULL;

static void timeout(lv_timer_t *t) {
	if ((LedRead(LED_GREEN) == 0) && (batteryVoltage > CUTOFF_VOLTAGE_LOWER_HYST)) {
		lv_obj_del(msg);
		msg = NULL;
		return;
	}

	bool suspend = settingsIsOptionBitSet(BIT_POWEROFF_SUSPEND);

	powerOffFinalStage(suspend, false);
}

void uiPowerOff() {
	if (msg) {
		return;
	}

	msg = lv_label_create(lv_scr_act());

	lv_label_set_text(msg, "QRT 73");
	lv_obj_set_width(msg, 100);
	lv_obj_set_height(msg, 32);
	lv_obj_center(msg);
	lv_obj_add_style(msg, &notify_style, 0);

	lv_timer_t *timer = lv_timer_create(timeout, 500, NULL);
	lv_timer_set_repeat_count(timer, 1);
}
