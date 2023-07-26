/*
 * Copyright (C) 2021-2022 Roger Clark, VK3KYY / G4KYF
 *                         Colin Durbridge, G4EML
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

#include <hardware/HX8353E.h>
#include <stdbool.h>
#include <memory.h>
#include <malloc.h>
#include <stdio.h>
#include <lvgl.h>

#include "user_interface/uiMsg.h"
#include "interfaces/adc.h"
#include "interfaces/batteryRAM.h"
#include "hardware/SPI_Flash.h"
#include "interfaces/adc.h"
#include "hardware/radioHardwareInterface.h"

#include "io/buttons.h"
#include "io/display.h"
#include "usb/usb_com.h"
#include "usb_device.h"
#include "user_interface/menuSystem.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/styles.h"
#include "user_interface/uiEvents.h"
#include "user_interface/uiSplashScreen.h"
#include "user_interface/uiPowerOff.h"
#include "user_interface/uiMsg.h"
#include "functions/ticks.h"
#include "interfaces/batteryAndPowerManagement.h"
#include "interfaces/gps.h"
#include "interfaces/settingsStorage.h"
#include "interfaces/adc.h"
#include "functions/rxPowerSaving.h"

#if defined(USING_EXTERNAL_DEBUGGER)
#include "SeggerRTT/RTT/SEGGER_RTT.h"
#endif

volatile bool mainIsRunning = true;
static bool updateMessageOnScreen = false;
int lastVolume = 0;


#if (__NVIC_PRIO_BITS != 3)
#error Files need to be manually after regernation using the STM32Cube configuration tool to support the non-genuine CPU

/*
 * To support the Non-genuine CPU in newer radios, the folling changes must be made
 *
 * stm32f405xx.h line 49 needs to be changed to
 * #define __NVIC_PRIO_BITS          3U       // VK3KYY changed this to 3 to fix problem with clone CPU. Genuine STM32F4XX uses 4 Bits for the Priority Levels
 *
 * FreeRTOS
 *
 * FreeRTOSConfig.h
 *
 * line 132
 *
 *  #define configPRIO_BITS         3
 *
 *  port.c
 *
 *  line 346
 *
 * 	configASSERT( ( portMAX_PRIGROUP_BITS - ulMaxPRIGROUPValue ) >= configPRIO_BITS );
 *
 * Also     HAL_NVIC_SetPriority(PendSV_IRQn, 15, 0);  has to be changed to HAL_NVIC_SetPriority(PendSV_IRQn, 7, 0); in stm32f4xx_hal_msp.h
 *
 */

#endif

#if false
static void hexDump(uint8_t *ptr, int len)
{
	char buf[8];
	char msg[128];

	msg[0] = 0;
	for (int i = 0; i < len; i++)
	{
		if ((i != 0) && (i%16 == 0))
		{
			strcat(msg,"\n");
			CDC_Transmit_FS((uint8_t *)msg,strlen(msg));
			msg[0] = 0;
		}
		else
		{
			sprintf(buf,"%02x ",*ptr);
			strcat(msg,buf);
		}
		ptr++;
		osDelay(1);
	}
}
#endif


static void keyBeepHandler(uiEvent_t *ev, bool ptttoggleddown)
{
	bool isScanning = (uiVFOModeIsScanning() || uiChannelModeIsScanning()) && !uiVFOModeSweepScanning(false);

	// Do not send any beep while scanning, otherwise enabling the AMP will be handled as a valid signal detection.
	if (((ev->keys.event & (KEY_MOD_LONG | KEY_MOD_PRESS)) == (KEY_MOD_LONG | KEY_MOD_PRESS)) ||
			((ev->keys.event & KEY_MOD_UP) == KEY_MOD_UP))
	{

		if ((ptttoggleddown == false) && (isScanning == false))
		{
			if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_BEEP)
			{
				soundSetMelody(nextKeyBeepMelody);
			}
			else
			{
				soundSetMelody(MELODY_KEY_BEEP);
			}
			nextKeyBeepMelody = (int *)MELODY_KEY_BEEP;// set back to the default beep
		}
		else
		{ 	// Reset the beep sound if we are scanning, otherwise the AudioAssist
			// beep will be played instead of the normal one.

			if (isScanning)
			{
				if (melody_play != NULL)
				{
					soundStopMelody();
				}
			}
			else
			{
				soundSetMelody(MELODY_KEY_BEEP);
			}
		}
	}
	else
	{
		if ((ev->keys.event & (KEY_MOD_LONG | KEY_MOD_DOWN)) == (KEY_MOD_LONG | KEY_MOD_DOWN))
		{
			if ((ptttoggleddown == false) && (isScanning == false))
			{
				if (nextKeyBeepMelody != MELODY_KEY_BEEP)
				{
					soundSetMelody(nextKeyBeepMelody);
					nextKeyBeepMelody = (int *)MELODY_KEY_BEEP;
				}
				else
				{
					soundSetMelody(MELODY_KEY_LONG_BEEP);
				}
			}
		}
	}
}

static bool rxBeepsMustPlayMelody(uint8_t rxBitOption)
{
	return ((nonVolatileSettings.beepOptions & rxBitOption) && (settingsUsbMode != USB_MODE_HOTSPOT) &&
			((uiDataGlobal.Scan.active == false) || (uiDataGlobal.Scan.active && (uiDataGlobal.Scan.state == SCAN_PAUSED))) &&
			(nonVolatileSettings.audioPromptMode != AUDIO_PROMPT_MODE_SILENT) && (voicePromptsIsPlaying() == false));
}

static void rxBeepsCarrierEndCallback(void)
{
	soundSetMelody(MELODY_RX_BEEP_END_BEEP);
}

static bool rxBeepsHandler(void)
{
	if (uiDataGlobal.rxBeepState & RX_BEEP_CARRIER_HAS_STARTED_EXEC)
	{
		// Don't clear the RF start beep when scanning, it has to be played, so wait the scan has paused.
		if ((uiDataGlobal.Scan.active &&
				((uiDataGlobal.Scan.state == SCAN_SCANNING) || (uiDataGlobal.Scan.state == SCAN_SHORT_PAUSED))) == false)
		{
			uiDataGlobal.rxBeepState &= ~RX_BEEP_CARRIER_HAS_STARTED_EXEC;
		}

		if (rxBeepsMustPlayMelody(BEEP_RX_CARRIER))
		{
			// Cancel queued rx end beep, if any. In this case, there is no
			// need to play another start beep, as the previous one has already
			// been heard.
			if (cancelTimerCallback(rxBeepsCarrierEndCallback, MENU_ANY) == false)
			{
				soundSetMelody(MELODY_RX_BEEP_BEGIN_BEEP);
			}

			return true;
		}
	}
	else if (uiDataGlobal.rxBeepState & RX_BEEP_TALKER_HAS_STARTED_EXEC)
	{
		uiDataGlobal.rxBeepState &= ~(RX_BEEP_TALKER_HAS_STARTED_EXEC | RX_BEEP_TALKER_HAS_ENDED | RX_BEEP_TALKER_HAS_ENDED_EXEC);

		if ((nonVolatileSettings.beepOptions & BEEP_RX_TALKER_BEGIN) && rxBeepsMustPlayMelody(BEEP_RX_TALKER))
		{
			soundSetMelody(MELODY_RX_BEEP_CALLER_BEGIN_BEEP);

			return true;
		}
	}
	else if (uiDataGlobal.rxBeepState & RX_BEEP_TALKER_HAS_ENDED_EXEC)
	{
		// FM: Replace Carrier beeps with Talker beeps if Caller beep option is selected.
		if ((trxGetMode() == RADIO_MODE_ANALOG) && ((nonVolatileSettings.beepOptions & BEEP_RX_CARRIER) == 0) && (nonVolatileSettings.beepOptions & BEEP_RX_TALKER))
		{
			uiDataGlobal.rxBeepState = RX_BEEP_UNSET;
		}
		else
		{
			uiDataGlobal.rxBeepState &= ~(RX_BEEP_TALKER_HAS_ENDED_EXEC | RX_BEEP_TALKER_HAS_STARTED | RX_BEEP_TALKER_HAS_STARTED_EXEC | RX_BEEP_TALKER_IDENTIFIED);
		}

		if (rxBeepsMustPlayMelody(BEEP_RX_TALKER))
		{
			soundSetMelody(MELODY_RX_BEEP_CALLER_END_BEEP);

			return true;
		}
	}
	else if (uiDataGlobal.rxBeepState & RX_BEEP_CARRIER_HAS_ENDED)
	{
		uiDataGlobal.rxBeepState = RX_BEEP_UNSET;

		if (rxBeepsMustPlayMelody(BEEP_RX_CARRIER))
		{
			// Delays end beep tone by 100ms, as it could played immediately after CALLER_END_BEEP on some conditions
			(void)addTimerCallback(rxBeepsCarrierEndCallback, 150, MENU_ANY, false);

			return true;
		}
	}

	return false;
}

static bool validateUpdateCallback(void)
{
	if (uiDataGlobal.MessageBox.keyPressed == KEY_GREEN)
	{
		updateMessageOnScreen = false;
		settingsSetOptionBit(BIT_SETTINGS_UPDATED, false);
		return true;
	}

	return false;
}

static void settingsUpdateAudioAlert(void)
{
	if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
	{
		voicePromptsInit();
		voicePromptsAppendPrompt(PROMPT_SETTINGS_UPDATE);
		voicePromptsPlay();
	}
	else
	{
		soundSetMelody(MELODY_ACK_BEEP);
	}
}

static void start_timeout(lv_timer_t *t) {
	uiSplashScreen();
	displayEnableBacklight(true, nonVolatileSettings.displayBacklightPercentageOff);
	displayLightTrigger(false);
}

void applicationMainTask(void) {
	int				function_event = 0;
	bool			keyOrButtonChanged = false;
	bool 			hasSignal = false;

	uiEvent_t ev = {
		.buttons = 0,
		.keys = NO_KEYCODE,
		.rotary = 0,
		.function = 0,
		.events = NO_EVENT,
		.hasEvent = false,
		.time = ticksGetMillis()
	};

	/* keep the power on */

	HAL_GPIO_WritePin(PWR_SW_GPIO_Port, PWR_SW_Pin, GPIO_PIN_SET);

	batteryRAM_Init();
	adcStartDMA();

	displayLCD_Type = SPI_Flash_readSingleSecurityRegister(0x301D);
	displayLCD_Type &= 0x03;

	lv_init();

	displayInit();
	gpioInitDisplay();

	uiEventsInit();
	buttonsInit();
	keyboardInit();
	rotaryEncoderISR();

	lv_disp_set_bg_color(lv_disp_get_default(), lv_color_black());
	lv_disp_set_bg_opa(lv_disp_get_default(), LV_OPA_COVER);

	if (!SPI_Flash_init()) {
	}

	/* * */

	settingsLoadSettings();

	radioPowerOn();
	uiDataGlobal.dmrDisabled = !codecIsAvailable();
	radioInit();
	calibrationInit();
	HRC6000Init();
	radioPostinit();
	HAL_ADC_Start_IT(&hadc1);
	HRC6000InitTask();
	voxInit();
	menuRadioInfosInit();
	batteryUpdate();
	soundInitBeepTask();
	lastheardInitList();
	codeplugInitCaches();
	dmrIDCacheInit();
	voicePromptsCacheInit();

	voxSetParameters(nonVolatileSettings.voxThreshold, nonVolatileSettings.voxTailUnits);
	codeplugGetSignallingDTMFDurations(&uiDataGlobal.DTMFContactList.durations);
	uiDataGlobal.dateTimeSecs = getRtcTime_custom();

	ticksTimerStart(&apoTimer, ((nonVolatileSettings.apo * 30) * 60000U));

	if (nonVolatileSettings.gps > GPS_MODE_OFF) {
		gpsOn();
	}

	lv_obj_set_style_bg_opa(lv_scr_act(), LV_OPA_0, 0);

	lv_timer_t *timer = lv_timer_create(start_timeout, 50, NULL);
	lv_timer_set_repeat_count(timer, 1);

	while (true) {
		uint32_t now = ticksGetMillis();

		keyOrButtonChanged = false;

		lv_timer_handler();
		tick_com_request();

		handleTimerCallbacks();

		buttonsRead();
		batteryUpdate();
		batteryChecking();

		/* * */

		hasSignal = false;

		if (trxGetMode()== RADIO_MODE_ANALOG) {
			hasSignal = trxCheckAnalogSquelch();
		} else {
			if (slotState == DMR_STATE_IDLE) {
				trxReadRSSIAndNoise(false);

				hasSignal = trxCheckDigitalSquelch();
			} else {
				if (ticksTimerHasExpired((ticksTimer_t *)&readDMRRSSITimer)) {
					trxReadRSSIAndNoise(false);
					ticksTimerStart((ticksTimer_t *)&readDMRRSSITimer, 10000); // hold of for a very long time
				}
				hasSignal = true;
			}
		}

		uiDataGlobal.displayQSOState = QSO_DISPLAY_IDLE;

		if (!trxTransmissionEnabled && (updateLastHeard == true)) {
			lastHeardListUpdate((uint8_t *)DMR_frame_buffer, false);
			updateLastHeard = false;
		}

		apoTick((keyOrButtonChanged || (function_event != NO_EVENT) ||
				(settingsIsOptionBitSet(BIT_APO_WITH_RF) ? (getAudioAmpStatus() & AUDIO_AMP_MODE_RF) : false)));

		/* * */

		voicePromptsTick();
		soundTickMelody();
		voxTick();
		gpsTick();
		settingsSaveIfNeeded(false);

		if (!trxTransmissionEnabled && !trxIsTransmitting) {
			rxPowerSavingTick(&ev, hasSignal);
		}

		int latestVolume = getVolumeControl();

		if (latestVolume != lastVolume) {
			lastVolume = latestVolume;
			HRC6000SetDmrRxGain(latestVolume);
		}

		lv_msg_send(UI_MSG_IDLE, NULL);

		osDelay(pdMS_TO_TICKS(5));
		lv_tick_inc(ticksGetMillis() - now);
	}
}
