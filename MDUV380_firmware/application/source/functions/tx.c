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

#include <lvgl.h>

#include "functions/tx.h"
#include "hardware/HR-C6000.h"
#include "functions/settings.h"
#include "functions/sound.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/uiLocalisation.h"
#include "interfaces/clockManager.h"
#include "interfaces/gps.h"

uint32_t			xmitErrorTimer = 0;

static bool			startBeepPlayed;

static lv_timer_t	*timer = NULL;

static void waitStartDMR(lv_timer_t *t) {
	if (trxTransmissionEnabled && ((HRC6000GetIsWakingState() == WAKING_MODE_NONE) || (HRC6000GetIsWakingState() == WAKING_MODE_AWAKEN))) {
		if ((nonVolatileSettings.beepOptions & BEEP_TX_START) && (startBeepPlayed == false) && (trxIsTransmitting == true) && (melody_play == NULL)) {
			startBeepPlayed = true;

			if ((voxIsEnabled() == false) || (voxIsEnabled() && (voxIsTriggered() == false))) {
				soundSetMelody(MELODY_DMR_TX_START_BEEP);
			}

			lv_timer_del(timer);
			timer = NULL;
		}
	}
}

static void waitStopDMR(lv_timer_t *t) {
	if (trxIsTransmitting == false) {
		if ((nonVolatileSettings.beepOptions & BEEP_TX_STOP) && (melody_play == NULL) && (HRC6000GetIsWakingState() != WAKING_MODE_FAILED)) {
			soundSetMelody(MELODY_DMR_TX_STOP_BEEP);
		}

		LedWrite(LED_RED, 0);

		if (nonVolatileSettings.gps > GPS_MODE_OFF) {
			gpsDataInputStartStop(true);
		}

		clockManagerSetRunMode(kAPP_PowerModeRun, CLOCK_MANAGER_SPEED_RUN);
		HRC6000ClearIsWakingState();

		lv_timer_del(timer);
		timer = NULL;
	}
}

void txTurnOn() {
	if (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_RX_ONLY)) {
		return;
	}

#if 0
	if (!(nonVolatileSettings.txFreqLimited == BAND_LIMITS_NONE) || trxCheckFrequencyInAmateurBand(currentChannelData->txFreq)){
		return;
	}
#endif

	voicePromptsTerminateNoTail();
	startBeepPlayed = false;
	uiDataGlobal.Scan.active = false;
	xmitErrorTimer = 0;

	if (trxGetMode() == RADIO_MODE_DIGITAL) {
		clockManagerSetRunMode(kAPP_PowerModeHsrun, CLOCK_MANAGER_SPEED_HS_RUN);
	}

	/* * */

	if (nonVolatileSettings.gps > GPS_MODE_OFF) {
		gpsDataInputStartStop(false);
	}

	LedWrite(LED_GREEN, 0);
	LedWrite(LED_RED, 1);

	HRC6000ClearIsWakingState();

	if (trxGetMode() == RADIO_MODE_ANALOG) {
		trxSetTxCSS(currentChannelData->txTone);

		trxSetTX();
	} else {
		if (nonVolatileSettings.locationLat != SETTINGS_UNITIALISED_LOCATION_LAT) {
			HRC6000SetTalkerAliasLocation(nonVolatileSettings.locationLat, nonVolatileSettings.locationLon);
		}

		if (!((slotState >= DMR_STATE_REPEATER_WAKE_1) && (slotState <= DMR_STATE_REPEATER_WAKE_3)) ) {
			trxSetTX();
		}

		if (timer) {
			lv_timer_del(timer);
		}

        timer = lv_timer_create(waitStartDMR, 50, NULL);
	}
}

void txTurnOff() {
	if (trxTransmissionEnabled) {
		trxTransmissionEnabled = false;

		if (trxGetMode() == RADIO_MODE_ANALOG) {
			/* In analog mode. Stop transmitting immediately */

			LedWrite(LED_RED, 0);

			if (nonVolatileSettings.gps > GPS_MODE_OFF) {
				gpsDataInputStartStop(true);
			}

			/* Need to wrap this in Task Critical to avoid bus contention on the I2C bus. */

			trxSetRxCSS(currentChannelData->rxTone);
			trxActivateRx(true);
			trxIsTransmitting = false;
		} else {
			HRC6000ClearIsWakingState();

			if (timer) {
				lv_timer_del(timer);
			}

			timer = lv_timer_create(waitStopDMR, 50, NULL);
		}
	}
}
