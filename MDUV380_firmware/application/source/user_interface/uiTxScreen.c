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
#include "hardware/HR-C6000.h"
#include "functions/settings.h"
#include "functions/sound.h"
#include "user_interface/menuSystem.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/uiLocalisation.h"
#include "functions/ticks.h"
#include "interfaces/clockManager.h"
#include "functions/satellite.h"
#include "interfaces/gps.h"

static void updateScreen(void);
static void handleEvent(uiEvent_t *ev);

#define PIT_COUNTS_PER_SECOND    1000U

static int timeInSeconds;
static ticksTimer_t nextSecondTimer = { 0, 0 };
static bool isShowingLastHeard;
static bool startBeepPlayed;
static uint32_t m = 0, micm = 0, mto = 0;
static bool keepScreenShownOnError = false;
static bool pttWasReleased = false;
static bool isTransmittingTone = false;
uint32_t xmitErrorTimer = 0;

menuStatus_t menuTxScreen(uiEvent_t *ev, bool isFirstRun)
{

	if (isFirstRun)
	{
		voicePromptsTerminateNoTail();
		startBeepPlayed = false;
		uiDataGlobal.Scan.active = false;
		isTransmittingTone = false;
		isShowingLastHeard = false;
		keepScreenShownOnError = false;
		timeInSeconds = 0;
		pttWasReleased = false;
		xmitErrorTimer = 0;
		ticksTimerReset(&nextSecondTimer);

		if (trxGetMode() == RADIO_MODE_DIGITAL)
		{
			clockManagerSetRunMode(kAPP_PowerModeHsrun, CLOCK_MANAGER_SPEED_HS_RUN);
		}

#if defined(PLATFORM_GD77S)
		uiChannelModeHeartBeatActivityForGD77S(ev); // Dim all lit LEDs
#endif

		// If the user was currently entering a new frequency and the PTT get pressed, "leave" that input screen.
		if (uiDataGlobal.FreqEnter.index > 0)
		{
			freqEnterReset();
			updateScreen();
		}

		if ((codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_RX_ONLY) == false) && ((nonVolatileSettings.txFreqLimited == BAND_LIMITS_NONE) || trxCheckFrequencyInAmateurBand(currentChannelData->txFreq)
#if defined(PLATFORM_M9600)
				|| codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_OUT_OF_BAND)
#endif
		))
		{
			ticksTimerStart(&nextSecondTimer, PIT_COUNTS_PER_SECOND);
			timeInSeconds = currentChannelData->tot * 15;

			if (nonVolatileSettings.gps > GPS_MODE_OFF)
			{
				gpsDataInputStartStop(false);
			}

			LedWrite(LED_GREEN, 0);
			LedWrite(LED_RED, 1);

			HRC6000ClearIsWakingState();

			if (trxGetMode() == RADIO_MODE_ANALOG)
			{
				trxSetTxCSS(currentChannelData->txTone);
				if (menuSystemGetPreviousMenuNumber() == MENU_SATELLITE)
				{
					// Make sure Tx freq is updated before transmission is enabled
					trxSetFrequency(currentChannelData->rxFreq, currentChannelData->txFreq, DMR_MODE_AUTO);
				}
				trxSetTX();
			}
			else
			{
				if (nonVolatileSettings.locationLat != SETTINGS_UNITIALISED_LOCATION_LAT)
				{
					HRC6000SetTalkerAliasLocation(nonVolatileSettings.locationLat, nonVolatileSettings.locationLon);
				}
				// RADIO_MODE_DIGITAL
				if (!((slotState >= DMR_STATE_REPEATER_WAKE_1) && (slotState <= DMR_STATE_REPEATER_WAKE_3)) )
				{
					trxSetTX();
				}
			}

			updateScreen();
		}
		else
		{
			menuTxScreenHandleTxTermination(ev, (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_RX_ONLY) ? TXSTOP_RX_ONLY : TXSTOP_OUT_OF_BAND));
		}

		m = micm = ev->time;
	}
	else
	{

		// Keep displaying the "RX Only" or "Out Of Band" error message
		if (xmitErrorTimer > 0)
		{
			// Wait the voice ends, then count-down 200ms;
			if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
			{
				if (voicePromptsIsPlaying())
				{
					xmitErrorTimer = (20 * 10U);
					return MENU_STATUS_SUCCESS;
				}
			}

			xmitErrorTimer--;

			if (xmitErrorTimer == 0)
			{
				ev->buttons &= ~BUTTON_PTT; // prevent screen lockout if the operator keeps pressing the PTT button.
			}
			else
			{
				return MENU_STATUS_SUCCESS;
			}
		}

		if (trxTransmissionEnabled && ((HRC6000GetIsWakingState() == WAKING_MODE_NONE) || (HRC6000GetIsWakingState() == WAKING_MODE_AWAKEN)))
		{
			if (ticksTimerHasExpired(&nextSecondTimer))
			{
				ticksTimerStart(&nextSecondTimer, PIT_COUNTS_PER_SECOND);

				if (currentChannelData->tot == 0)
				{
					timeInSeconds++;
				}
				else
				{
					timeInSeconds--;
					if (timeInSeconds <= (nonVolatileSettings.txTimeoutBeepX5Secs * 5))
					{
						if ((timeInSeconds % 5) == 0)
						{
							soundSetMelody(MELODY_KEY_BEEP);
						}
					}
				}

				if ((currentChannelData->tot != 0) && (timeInSeconds == 0))
				{
					menuTxScreenHandleTxTermination(ev, TXSTOP_TIMEOUT);
					keepScreenShownOnError = true;
				}
				else
				{
					if (!isShowingLastHeard)
					{
						updateScreen();
					}
				}
			}
			else
			{
				int mode = trxGetMode();

				if (mode == RADIO_MODE_DIGITAL)
				{
					if ((nonVolatileSettings.beepOptions & BEEP_TX_START) &&
							(startBeepPlayed == false) && (trxIsTransmitting == true)
							&& (melody_play == NULL))
					{
						startBeepPlayed = true;// set this even if the beep is not actaully played because of the vox, as otherwise this code will get continuously run
						// If VOX is running, don't send a beep as it will reset its the trigger status.
						if ((voxIsEnabled() == false) || (voxIsEnabled() && (voxIsTriggered() == false)))
						{
							soundSetMelody(MELODY_DMR_TX_START_BEEP);
						}
					}
				}

				// Do not update Mic level on Timeout.
#if !defined(PLATFORM_GD77S)
				if ((((currentChannelData->tot != 0) && (timeInSeconds == 0)) == false) && (ev->time - micm) > 100)
				{
					if (mode == RADIO_MODE_DIGITAL)
					{
						uiUtilityDrawDMRMicLevelBarGraph();
					}
					else
					{
						uiUtilityDrawFMMicLevelBarGraph();
					}

					displayRenderRows(1, 2);
					micm = ev->time;
				}
#endif
			}
		}

		// Timeout happened, postpone going further otherwise timeout
		// screen won't be visible at all.
		if (((currentChannelData->tot != 0) && (timeInSeconds == 0)) || keepScreenShownOnError)
		{
			// Wait the voice ends, then count-down 500ms;
			if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
			{
				if (voicePromptsIsPlaying())
				{
					mto = ev->time;
					return MENU_STATUS_SUCCESS;
				}
			}

			if ((ev->time - mto) < 500)
			{
				return MENU_STATUS_SUCCESS;
			}

			keepScreenShownOnError = false;
			ev->buttons &= ~BUTTON_PTT; // prevent screen lockout if the operator keeps pressing the PTT button.
		}

		// Once the PTT key has been released, it is forbidden to re-key before the whole TX chain
		// has finished (see the first statement in handleEvent())
		// That's important in DMR mode, otherwise quickly press/release the PTT key will left
		// the system in an unexpected state (RED led on, displayed TXScreen, but PA off).
		// It doesn't have any impact on FM mode.
		if (((ev->buttons & BUTTON_PTT) == 0) && (pttWasReleased == false))
		{
			pttWasReleased = true;
		}

		if ((ev->buttons & BUTTON_PTT) && pttWasReleased)
		{
			ev->buttons &= ~BUTTON_PTT;
		}
		//


		// Got an event, or
		if (ev->hasEvent || // PTT released, Timeout triggered,
				( (((ev->buttons & BUTTON_PTT) == 0) || ((currentChannelData->tot != 0) && (timeInSeconds == 0))) ||
						// or waiting for DMR ending (meanwhile, updating every 100ms)
						((trxTransmissionEnabled == false) && ((ev->time - m) > 100))))
		{
			handleEvent(ev);
			m = ev->time;
		}
		else
		{
			if ((HRC6000GetIsWakingState() == WAKING_MODE_FAILED) && (trxTransmissionEnabled == true))
			{
				trxTransmissionEnabled = false;
				menuTxScreenHandleTxTermination(ev, TXSTOP_TIMEOUT);
				keepScreenShownOnError = true;
			}
		}
	}
	return MENU_STATUS_SUCCESS;
}

bool menuTxScreenDisplaysLastHeard(void)
{
	return isShowingLastHeard;
}

static void updateScreen(void)
{
#if !defined(PLATFORM_GD77S)
	uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;

	if (menuSystemGetPreviousMenuNumber() == MENU_SATELLITE)
	{
		menuSatelliteTxScreen(timeInSeconds);
	}
	else
	{
		if (menuSystemGetRootMenuNumber() == UI_VFO_MODE)
		{
			uiVFOModeUpdateScreen(timeInSeconds);
		}
		else
		{
			uiChannelModeUpdateScreen(timeInSeconds);
		}
	}

	if (nonVolatileSettings.backlightMode != BACKLIGHT_MODE_BUTTONS)
	{
		displayLightOverrideTimeout(-1);
	}
#endif
}

static void handleEvent(uiEvent_t *ev)
{
	// Xmiting ends (normal or timeouted)
	if (((ev->buttons & BUTTON_PTT) == 0)
			|| ((currentChannelData->tot != 0) && (timeInSeconds == 0)))
	{
		if (trxTransmissionEnabled)
		{
			trxTransmissionEnabled = false;
			isTransmittingTone = false;

			if (trxGetMode() == RADIO_MODE_ANALOG)
			{
				// In analog mode. Stop transmitting immediately
				LedWrite(LED_RED, 0);

				if (nonVolatileSettings.gps > GPS_MODE_OFF)
				{
					gpsDataInputStartStop(true);
				}

				// Need to wrap this in Task Critical to avoid bus contention on the I2C bus.
				trxSetRxCSS(currentChannelData->rxTone);
				trxActivateRx(true);
				trxIsTransmitting = false;

				menuSystemPopPreviousMenu();
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // we need immediate redraw
			}
			else
			{
				HRC6000ClearIsWakingState();

				if (isShowingLastHeard)
				{
					isShowingLastHeard = false;
					updateScreen();
				}
			}
			// When not in analog mode, only the trxIsTransmitting flag is cleared
			// This screen keeps getting called via the handleEvent function and goes into the else clause - below.
		}
		else
		{
			// In DMR mode, wait for the DMR system to finish before exiting
			if (trxIsTransmitting == false)
			{
				if ((nonVolatileSettings.beepOptions & BEEP_TX_STOP) && (melody_play == NULL) && (HRC6000GetIsWakingState() != WAKING_MODE_FAILED))
				{
					soundSetMelody(MELODY_DMR_TX_STOP_BEEP);
				}

				LedWrite(LED_RED, 0);

				if (nonVolatileSettings.gps > GPS_MODE_OFF)
				{
					gpsDataInputStartStop(true);
				}

				// If there is a signal, lit the Green LED
				if ((LedRead(LED_GREEN) == 0) && (trxCarrierDetected() || (getAudioAmpStatus() & AUDIO_AMP_MODE_RF)))
				{
					LedWrite(LED_GREEN, 1);
				}

				if (trxGetMode() == RADIO_MODE_DIGITAL)
				{
					clockManagerSetRunMode(kAPP_PowerModeRun, CLOCK_MANAGER_SPEED_RUN);
				}

				HRC6000ClearIsWakingState();

				menuSystemPopPreviousMenu();
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // we need immediate redraw
			}
		}

		// Waiting for TX to end, no need to go further.
		return;
	}

	// Key action while xmitting (ANALOG), Tone triggering
	if (!isTransmittingTone && ((ev->buttons & BUTTON_PTT) != 0) && trxTransmissionEnabled && (trxGetMode() == RADIO_MODE_ANALOG))
	{
		int keyval = menuGetKeypadKeyValue(ev, false);
		if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
		{
			if (menuSystemGetPreviousMenuNumber() == MENU_SATELLITE)
			{
				if (satelliteDataNative[uiDataGlobal.SatelliteAndAlarmData.currentSatellite].armCTCSS != 0)
				{
					trxActivateRx(true);
					trxSetTxCSS(satelliteDataNative[uiDataGlobal.SatelliteAndAlarmData.currentSatellite].armCTCSS);
					trxSetTX();
				}
			}
			else
			{		//send 1750
				trxSetTone1(1750);
				soundSetMelody(MELODY_1750);
				isTransmittingTone = true;
			}
		}
		else
		{ // Send DTMF
			if (keyval != 99)
			{
				trxSetDTMF(keyval);
				soundSetMelody(MELODY_DTMF);
				isTransmittingTone = true;
			}
		}
	}

	// Stop xmitting Tone
	if (isTransmittingTone && (BUTTONCHECK_DOWN(ev, BUTTON_SK2) == 0) && ((ev->keys.key == 0) || (ev->keys.event & KEY_MOD_UP)))
	{
		if (menuSystemGetPreviousMenuNumber() == MENU_SATELLITE)
		{
			if (satelliteDataNative[uiDataGlobal.SatelliteAndAlarmData.currentSatellite].armCTCSS != 0)
			{
				trxActivateRx(true);
				trxSetTxCSS(currentChannelData->txTone);
				trxSetTX();
			}
		}
		else
		{
			trxDTMFoff(true);
		}
		isTransmittingTone = false;
	}

#if !defined(PLATFORM_GD77S)
	if ((trxGetMode() == RADIO_MODE_DIGITAL) && BUTTONCHECK_SHORTUP(ev, BUTTON_SK1) && (trxTransmissionEnabled == true))
	{
		isShowingLastHeard = !isShowingLastHeard;
		if (isShowingLastHeard)
		{
			menuLastHeardInit();
			menuLastHeardUpdateScreen(false, false, false);
		}
		else
		{
			updateScreen();
		}
	}

	// Forward key events to LH screen, if shown
	if (isShowingLastHeard && (ev->events & KEY_EVENT))
	{
		menuLastHeardHandleEvent(ev);
	}
#endif

}

void menuTxScreenHandleTxTermination(uiEvent_t *ev, txTerminationReason_t reason)
{
	PTTToggledDown = false;
	voxReset();

	voicePromptsTerminateNoTail();
	voicePromptsInit();

#if !defined(PLATFORM_GD77S)
	displayClearBuf();
	displayDrawRoundRectWithDropShadow(4, 4, 120 + DISPLAY_H_EXTRA_PIXELS, (DISPLAY_SIZE_Y - 6), 5, true);
#endif

	switch (reason)
	{
		case TXSTOP_RX_ONLY:
		case TXSTOP_OUT_OF_BAND:
#if !defined(PLATFORM_GD77S)
			displayPrintCentered(4 + (DISPLAY_V_EXTRA_PIXELS / 4), currentLanguage->error, FONT_SIZE_4);
#endif

			voicePromptsAppendLanguageString(&currentLanguage->error);
			voicePromptsAppendPrompt(PROMPT_SILENCE);

			if (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_RX_ONLY))
			{
#if !defined(PLATFORM_GD77S)
				displayPrintCentered((DISPLAY_SIZE_Y - 24) - (DISPLAY_V_EXTRA_PIXELS / 4), currentLanguage->rx_only, FONT_SIZE_3);
#endif
				voicePromptsAppendLanguageString(&currentLanguage->rx_only);
			}
			else
			{
#if !defined(PLATFORM_GD77S)
				displayPrintCentered((DISPLAY_SIZE_Y - 24) - (DISPLAY_V_EXTRA_PIXELS / 4), currentLanguage->out_of_band, FONT_SIZE_3);
#endif
				voicePromptsAppendLanguageString(&currentLanguage->out_of_band);
			}
			xmitErrorTimer = (100 * 10U);
			break;

		case TXSTOP_TIMEOUT:
#if !defined(PLATFORM_GD77S)
			displayPrintCentered(((DISPLAY_SIZE_Y - FONT_SIZE_4_HEIGHT) / 2), currentLanguage->timeout, FONT_SIZE_4);
#endif
//			voicePromptsAppendLanguageString(&currentLanguage->timeout);

			if (menuSystemGetCurrentMenuNumber() == UI_TX_SCREEN)
			{
				mto = ev->time;
			}
			break;
	}

#if !defined(PLATFORM_GD77S)
	displayRender();
	displayLightOverrideTimeout(-1);
#endif

	if ((nonVolatileSettings.audioPromptMode < AUDIO_PROMPT_MODE_VOICE_LEVEL_1) | (reason == TXSTOP_TIMEOUT))
	{
		soundSetMelody((reason == TXSTOP_TIMEOUT) ? MELODY_TX_TIMEOUT_BEEP : MELODY_ERROR_BEEP);
	}
	else
	{
		voicePromptsPlay();
	}
}
