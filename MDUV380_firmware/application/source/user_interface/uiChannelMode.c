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
#include "functions/codeplug.h"
#include "functions/settings.h"
#include "functions/trx.h"
#include "user_interface/menuSystem.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/uiLocalisation.h"
#include "user_interface/colors.h"
#include "functions/voicePrompts.h"
#include "functions/ticks.h"
#include "functions/rxPowerSaving.h"


#define NAME_BUFFER_LEN   23

#if defined(PLATFORM_GD77S)
typedef enum
{
	GD77S_UIMODE_TG_OR_SQUELCH,
	GD77S_UIMODE_SCAN,
	GD77S_UIMODE_TS,
	GD77S_UIMODE_CC,
	GD77S_UIMODE_FILTER,
	GD77S_UIMODE_DTMF_CONTACTS,
	GD77S_UIMODE_ZONE,
	GD77S_UIMODE_POWER,
	GD77S_UIMODE_ECO,
	GD77S_UIMODE_MAX
} GD77S_UIMODES_t;

typedef struct
{
	bool             firstRun;
	GD77S_UIMODES_t  uiMode;
	bool             channelOutOfBounds;
	uint16_t         dtmfListSelected;
	int32_t          dtmfListCount;
} GD77SParameters_t;

static GD77SParameters_t GD77SParameters =
{
		.firstRun = true,
		.uiMode = GD77S_UIMODE_TG_OR_SQUELCH,
		.channelOutOfBounds = false,
		.dtmfListSelected = 0,
		.dtmfListCount = 0
};

static void buildSpeechUiModeForGD77S(GD77S_UIMODES_t uiMode);

static void checkAndUpdateSelectedChannelForGD77S(uint16_t chanNum, bool forceSpeech);
static void handleEventForGD77S(uiEvent_t *ev);
static uint16_t getCurrentChannelInCurrentZoneForGD77S(void);

#else // ! PLATFORM_GD77S

static void selectPrevNextZone(bool nextZone);
static void handleUpKey(uiEvent_t *ev);
static void handleDownKey(uiEvent_t *ev);

#endif // PLATFORM_GD77S

static void handleEvent(uiEvent_t *ev);
static void loadChannelData(bool useChannelDataInMemory, bool loadVoicePromptAnnouncement);

static void updateQuickMenuScreen(bool isFirstRun);
static void handleQuickMenuEvent(uiEvent_t *ev);

static void scanning(void);
static void scanStart(bool longPressBeep);
static void scanSearchForNextChannel(void);
static void scanApplyNextChannel(void);
static void scanStop(bool loadChannel);

static void updateTrxID(void);

static char currentZoneName[SCREEN_LINE_BUFFER_SIZE];
static int directChannelNumber = 0;

static struct_codeplugChannel_t scanNextChannelData = { .rxFreq = 0 };
static bool scanNextChannelReady = false;
static int scanNextChannelIndex = 0;
static bool scobAlreadyTriggered = false;
static bool quickmenuChannelFromVFOHandled = false; // Quickmenu new channel confirmation window

static menuStatus_t menuChannelExitStatus = MENU_STATUS_SUCCESS;
static menuStatus_t menuQuickChannelExitStatus = MENU_STATUS_SUCCESS;

menuStatus_t uiChannelMode(uiEvent_t *ev, bool isFirstRun)
{
	static uint32_t m = 0;

	if (isFirstRun)
	{
#if ! defined(PLATFORM_GD77S) // GD77S speech can be triggered in main(), so let it ends.
		voicePromptsTerminate();
#endif

		settingsSet(nonVolatileSettings.initialMenuNumber, (uint8_t) UI_CHANNEL_MODE);// This menu.
		uiDataGlobal.displayChannelSettings = false;
		scanNextChannelReady = false;
		uiDataGlobal.Scan.refreshOnEveryStep = false;

		uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;

		lastHeardClearLastID();
		uiDataGlobal.displayQSOStatePrev = QSO_DISPLAY_IDLE;
		currentChannelData = &channelScreenChannelData;// Need to set this as currentChannelData is used by functions called by loadChannelData()

		if (currentChannelData->rxFreq != 0)
		{
			loadChannelData(true, false);
		}
		else
		{
			uiChannelInitializeCurrentZone();
			loadChannelData(false, false);
		}

		if ((uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA) && (trxGetMode() == RADIO_MODE_ANALOG))
		{
			uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
		}

#if defined(PLATFORM_GD77S)
		trxSetPowerFromLevel(nonVolatileSettings.txPowerLevel);// ensure the power level is available for the Power announcement

		//Reset to first UiMode if the radio is in Analog mode and the current UiMode only applies to DMR
		if ((trxGetMode() == RADIO_MODE_ANALOG) &&
			((GD77SParameters.uiMode == GD77S_UIMODE_TS ) ||
			(GD77SParameters.uiMode == GD77S_UIMODE_CC ) ||
			(GD77SParameters.uiMode == GD77S_UIMODE_FILTER )))
		{
			GD77SParameters.uiMode = GD77S_UIMODE_TG_OR_SQUELCH;
		}

		// Ensure the correct channel is loaded, on the very first run
		if (GD77SParameters.firstRun)
		{
			if (voicePromptsIsPlaying() == false)
			{
				GD77SParameters.firstRun = false;
				checkAndUpdateSelectedChannelForGD77S(rotarySwitchGetPosition(), true);
			}


			GD77SParameters.dtmfListCount = codeplugDTMFContactsGetCount();
		}
#endif
		uiChannelModeUpdateScreen(0);

		if (uiDataGlobal.Scan.active == false)
		{
			uiDataGlobal.Scan.state = SCAN_SCANNING;
		}

		// Need to do this last, as other things in the screen init, need to know whether the main screen has just changed
		if (uiDataGlobal.VoicePrompts.inhibitInitial)
		{
			uiDataGlobal.VoicePrompts.inhibitInitial = false;
		}

		// Scan On Boot is enabled, but has to be run only once.
		if (settingsIsOptionBitSet(BIT_SCAN_ON_BOOT_ENABLED) && (scobAlreadyTriggered == false))
		{
			scanStart(false);
		}

		// Disable ScOB for this session, and also prevent false triggering (like exiting the Options screen)
		scobAlreadyTriggered = true;

		menuChannelExitStatus = MENU_STATUS_SUCCESS; // Due to Orange Quick Menu
	}
	else
	{
		menuChannelExitStatus = MENU_STATUS_SUCCESS;

#if defined(PLATFORM_GD77S)
		uiChannelModeHeartBeatActivityForGD77S(ev);
#endif

		if (ev->events == NO_EVENT)
		{
#if defined(PLATFORM_GD77S)
			// Just ensure rotary's selected channel is matching the already loaded one
			// as rotary selector could be turned while the GD is OFF, or in hotspot mode.
			if ((uiDataGlobal.Scan.active == false) && ((rotarySwitchGetPosition() != getCurrentChannelInCurrentZoneForGD77S()) || (GD77SParameters.firstRun == true)))
			{
				if (voicePromptsIsPlaying() == false)
				{
					checkAndUpdateSelectedChannelForGD77S(rotarySwitchGetPosition(), GD77SParameters.firstRun);

					// Opening channel number announce has not took place yet, probably because it was telling
					// parameter like new hotspot mode selection.
					if (GD77SParameters.firstRun)
					{
						GD77SParameters.firstRun = false;
					}
				}
			}
#endif

			// is there an incoming DMR signal
			if (uiDataGlobal.displayQSOState != QSO_DISPLAY_IDLE)
			{
				uiChannelModeUpdateScreen(0);
			}
			else
			{
				if ((ev->time - m) > RSSI_UPDATE_COUNTER_RELOAD)
				{
					if (rxPowerSavingIsRxOn())
					{
						if (uiDataGlobal.Scan.active && (uiDataGlobal.Scan.state == SCAN_PAUSED))
						{
	#if defined(PLATFORM_RD5R)
							displayClearRows(0, 1, false);
	#else
							displayClearRows(0, 2, false);
	#endif
							uiUtilityRenderHeader(false, false);
						}
						else
						{
							uiUtilityDrawRSSIBarGraph();
						}

						// Only render the second row which contains the bar graph, if we're not scanning,
						// as there is no need to redraw the rest of the screen
						displayRenderRows(((uiDataGlobal.Scan.active && (uiDataGlobal.Scan.state == SCAN_PAUSED)) ? 0 : 1), 2);
					}
					m = ev->time;
				}
			}


		}
		else
		{
			if (ev->hasEvent)
			{
				handleEvent(ev);
			}
		}

		if (uiDataGlobal.Scan.active == true)
		{
			scanning();
		}

#if defined(PLATFORM_GD77S)
		dtmfSequenceTick(false);
#endif
	}
	return menuChannelExitStatus;
}

#if 0 // rename: we have an union declared (fw_sound.c) with the same name.
uint16_t byteSwap16(uint16_t in)
{
	return ((in & 0xff << 8) | (in >> 8));
}
#endif

static bool canCurrentZoneBeScanned(int *availableChannels)
{
	int enabledChannels = 0;
	int chanIdx = (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone) ? nonVolatileSettings.currentChannelIndexInAllZone : currentZone.channels[nonVolatileSettings.currentChannelIndexInZone]);

	if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1)
	{
		int chansInZone = currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone;

		if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
		{
			do
			{
				do
				{
					chanIdx = ((((chanIdx - 1) + 1) % currentZone.NOT_IN_CODEPLUGDATA_highestIndex) + 1);
				} while (!codeplugAllChannelsIndexIsInUse(chanIdx));

				chansInZone--;
				// Get flag4 only
				codeplugChannelGetDataWithOffsetAndLengthForIndex(chanIdx, &scanNextChannelData, CODEPLUG_CHANNEL_FLAG4_OFFSET, 1);

				if (codeplugChannelIsFlagSet(&scanNextChannelData, CHANNEL_FLAG_ALL_SKIP) == false)
				{
					enabledChannels++;
				}

			} while (chansInZone > 0);
		}
		else
		{
			do
			{
				chanIdx = ((chanIdx + 1) % currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone);

				chansInZone--;
				// Get flag4 only
				codeplugChannelGetDataWithOffsetAndLengthForIndex(currentZone.channels[chanIdx], &scanNextChannelData, CODEPLUG_CHANNEL_FLAG4_OFFSET, 1);

				if (codeplugChannelIsFlagSet(&scanNextChannelData, CHANNEL_FLAG_ZONE_SKIP) == false)
				{
					enabledChannels++;
				}

			} while (chansInZone > 0);
		}
	}

	*availableChannels = enabledChannels;

	return (enabledChannels > 1);
}

static void scanSearchForNextChannel(void)
{
	int channel = 0;

	// All Channels virtual zone
	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
	{
		do
		{
			do
			{
				// rollover (up/down) CODEPLUG_CHANNELS_MIN .. currentZone.NOT_IN_CODEPLUGDATA_highestIndex
				scanNextChannelIndex = ((uiDataGlobal.Scan.direction == 1) ?
						((((scanNextChannelIndex - 1) + 1) % currentZone.NOT_IN_CODEPLUGDATA_highestIndex) + 1) :
						((((scanNextChannelIndex - 1) + currentZone.NOT_IN_CODEPLUGDATA_highestIndex - 1) % currentZone.NOT_IN_CODEPLUGDATA_highestIndex) + 1));
			} while (!codeplugAllChannelsIndexIsInUse(scanNextChannelIndex));

			// Check if the channel is skipped.
			// Get flag4 only
			codeplugChannelGetDataWithOffsetAndLengthForIndex(scanNextChannelIndex, &scanNextChannelData, CODEPLUG_CHANNEL_FLAG4_OFFSET, 1);

		} while (codeplugChannelIsFlagSet(&scanNextChannelData, CHANNEL_FLAG_ALL_SKIP));

		channel = scanNextChannelIndex;
		codeplugChannelGetDataForIndex(scanNextChannelIndex, &scanNextChannelData);
	}
	else
	{
		do
		{
			// rollover (up/down) 0 .. (currentZone.NOT_IN_CODEPLUGDATA_highestIndex - 1)
			scanNextChannelIndex = ((uiDataGlobal.Scan.direction == 1) ?
					((scanNextChannelIndex + 1) % currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone) :
					((scanNextChannelIndex + currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone - 1) % currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone));

			// Check if the channel is skipped.
			// Get flag4 only
			codeplugChannelGetDataWithOffsetAndLengthForIndex(currentZone.channels[scanNextChannelIndex], &scanNextChannelData, CODEPLUG_CHANNEL_FLAG4_OFFSET, 1);

		} while (codeplugChannelIsFlagSet(&scanNextChannelData, CHANNEL_FLAG_ZONE_SKIP));

		channel = currentZone.channels[scanNextChannelIndex];
		codeplugChannelGetDataForIndex(currentZone.channels[scanNextChannelIndex], &scanNextChannelData);
	}

	//check all nuisance delete entries and skip channel if there is a match
	for (int i = 0; i < MAX_ZONE_SCAN_NUISANCE_CHANNELS; i++)
	{
		if (uiDataGlobal.Scan.nuisanceDelete[i] == -1)
		{
			break;
		}
		else
		{
			if(uiDataGlobal.Scan.nuisanceDelete[i] == channel)
			{
				return;
			}
		}
	}

	scanNextChannelReady = true;
}

static void scanApplyNextChannel(void)
{
	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
	{
		// All Channels virtual zone
		settingsSet(nonVolatileSettings.currentChannelIndexInAllZone, (int16_t) scanNextChannelIndex);
	}
	else
	{
		settingsSet(nonVolatileSettings.currentChannelIndexInZone, (int16_t) scanNextChannelIndex);
	}

	lastHeardClearLastID();

	memcpy(&channelScreenChannelData, &scanNextChannelData, CODEPLUG_CHANNEL_DATA_STRUCT_SIZE);

	loadChannelData(true, false);
	uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
	uiChannelModeUpdateScreen(0);

	// In DIGITAL Slow mode, we need at least 120ms to see the HR-C6000 to start the TS ISR.
	if (trxGetMode() == RADIO_MODE_DIGITAL)
	{
		int dwellTime;
		if(uiDataGlobal.Scan.stepTimeMilliseconds > 150)				// if >150ms use DMR Slow mode
		{
			dwellTime = ((trxDMRModeRx == DMR_MODE_DMO) ? SCAN_DMR_SIMPLEX_SLOW_MIN_DWELL_TIME : SCAN_DMR_DUPLEX_SLOW_MIN_DWELL_TIME);
		}
		else
		{
			dwellTime = ((trxDMRModeRx == DMR_MODE_DMO) ? SCAN_DMR_SIMPLEX_FAST_MIN_DWELL_TIME : SCAN_DMR_DUPLEX_FAST_MIN_DWELL_TIME);
		}

		uiDataGlobal.Scan.dwellTime = ((uiDataGlobal.Scan.stepTimeMilliseconds < dwellTime) ? dwellTime : uiDataGlobal.Scan.stepTimeMilliseconds);
	}
	else
	{
		uiDataGlobal.Scan.dwellTime = uiDataGlobal.Scan.stepTimeMilliseconds;
	}

	uiDataGlobal.Scan.timer.timeout = uiDataGlobal.Scan.dwellTime;
	uiDataGlobal.Scan.state = SCAN_SCANNING;
	scanNextChannelReady = false;
}

static void loadChannelData(bool useChannelDataInMemory, bool loadVoicePromptAnnouncement)
{
	bool rxGroupValid = true;
#if ! defined(PLATFORM_GD77S) // GD77S handle voice prompts on its own
	bool wasLoadingZone = (currentChannelData->rxFreq == 0);
#endif
	int previousSelectedChannelNumber = uiDataGlobal.currentSelectedChannelNumber;

	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
	{
		// All Channels virtual zone
		uiDataGlobal.currentSelectedChannelNumber = nonVolatileSettings.currentChannelIndexInAllZone;
	}
	else
	{
		uiDataGlobal.currentSelectedChannelNumber = currentZone.channels[nonVolatileSettings.currentChannelIndexInZone];
	}

	if (!useChannelDataInMemory)
	{
		if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
		{
			// All Channels virtual zone
			codeplugChannelGetDataForIndex(nonVolatileSettings.currentChannelIndexInAllZone, &channelScreenChannelData);
		}
		else
		{
			codeplugChannelGetDataForIndex(currentZone.channels[nonVolatileSettings.currentChannelIndexInZone], &channelScreenChannelData);
		}
	}

	HRC6000ClearActiveDMRID();

#if defined(PLATFORM_MD9600)
	// This could happen if a MK22 codeplug contains out of band channel(s) (like 220MHz) on an PLATFORM_MD9600.
	if ((trxGetBandFromFrequency(currentChannelData->rxFreq) == -1) || (trxGetBandFromFrequency(currentChannelData->txFreq) == -1))
	{
		// Flag it as out of band channel
		if (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_OUT_OF_BAND) == false)
		{
			codeplugChannelSetFlag(currentChannelData, CHANNEL_FLAG_OUT_OF_BAND, true);
		}

		trxSetFrequency(OUT_OF_BAND_FALLBACK_FREQUENCY, OUT_OF_BAND_FALLBACK_FREQUENCY, DMR_MODE_AUTO);
	}
	else
#endif
	{
#if defined(PLATFORM_MD9600)
		// Was flagged as out of band channel, it was probably edited and now it's fine, clear the flag
		if (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_OUT_OF_BAND))
		{
			codeplugChannelSetFlag(currentChannelData, CHANNEL_FLAG_OUT_OF_BAND, false);
		}
#endif
		if (!uiDataGlobal.reverseRepeaterChannel)
		{
			trxSetFrequency(currentChannelData->rxFreq, currentChannelData->txFreq, DMR_MODE_AUTO);
		}
		else
		{
			trxSetFrequency(currentChannelData->txFreq, currentChannelData->rxFreq, DMR_MODE_DMO);
		}
	}

	trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));

	if (currentChannelData->chMode == RADIO_MODE_ANALOG)
	{
		trxSetRxCSS(currentChannelData->rxTone);
	}
	else
	{
		uint32_t channelDMRId = codeplugChannelGetOptionalDMRID(currentChannelData);

		if (uiDataGlobal.manualOverrideDMRId == 0)
		{
			if (channelDMRId == 0)
			{
				setTxDMRID(uiDataGlobal.userDMRId);
			}
			else
			{
				setTxDMRID(channelDMRId);
			}
		}
		else
		{
			setTxDMRID(uiDataGlobal.manualOverrideDMRId);
		}

		// Set CC when:
		//  - scanning
		//  - CC Filter is ON
		//  - CC Filter is OFF but not held anymore or loading a new channel (this avoids restoring Channel's CC when releasing the PTT key, or getting out of menus)
		if (uiDataGlobal.Scan.active ||
				((nonVolatileSettings.dmrCcTsFilter & DMR_CC_FILTER_PATTERN) ||
						(((nonVolatileSettings.dmrCcTsFilter & DMR_CC_FILTER_PATTERN) == 0) &&
								((HRC6000CCIsHeld() == false) || (previousSelectedChannelNumber != uiDataGlobal.currentSelectedChannelNumber)))))
		{
			trxSetDMRColourCode(currentChannelData->txColor);
			HRC6000ClearColorCodeSynchronisation();
		}

		if (currentChannelData->rxGroupList != lastLoadedRxGroup)
		{
			rxGroupValid = codeplugRxGroupGetDataForIndex(currentChannelData->rxGroupList, &currentRxGroupData);
			if (rxGroupValid)
			{
				lastLoadedRxGroup = currentChannelData->rxGroupList;
			}
			else
			{
				lastLoadedRxGroup = -1;// RxGroup Contacts are not valid
			}
		}

		// Current contact index is out of group list bounds, select first contact
		if (rxGroupValid && (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] > (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1)))
		{
			settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 0);
			menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
		}

		// Check if this channel has an Rx Group
		if (rxGroupValid && nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup)
		{
			codeplugContactGetDataForIndex(currentRxGroupData.contacts[nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE]], &currentContactData);
		}
		else
		{
			codeplugContactGetDataForIndex(currentChannelData->contact, &currentContactData);
		}

		trxUpdateTsForCurrentChannelWithSpecifiedContact(&currentContactData);

		if (nonVolatileSettings.overrideTG == 0)
		{
			trxTalkGroupOrPcId = codeplugContactGetPackedId(&currentContactData);
		}
		else
		{
			trxTalkGroupOrPcId = nonVolatileSettings.overrideTG;
		}
	}

#if ! defined(PLATFORM_GD77S) // GD77S handle voice prompts on its own
	int nextMenu = menuSystemGetPreviouslyPushedMenuNumber(); // used to determine if this screen has just been loaded after Tx ended (in loadChannelData()))
	if (((uiDataGlobal.VoicePrompts.inhibitInitial == false) || loadVoicePromptAnnouncement) &&
			((uiDataGlobal.Scan.active == false) ||
					(uiDataGlobal.Scan.active && ((uiDataGlobal.Scan.state = SCAN_SHORT_PAUSED) || (uiDataGlobal.Scan.state = SCAN_PAUSED)))))
	{
		announceItem((wasLoadingZone ? PROMPT_SEQUENCE_ZONE_NAME_CHANNEL_NAME_AND_CONTACT_OR_VFO_FREQ_AND_MODE : PROMPT_SEQUENCE_CHANNEL_NAME_AND_CONTACT_OR_VFO_FREQ_AND_MODE),
				((nextMenu == UI_TX_SCREEN) || (nextMenu == UI_PRIVATE_CALL) || uiDataGlobal.Scan.active) ? PROMPT_THRESHOLD_NEVER_PLAY_IMMEDIATELY : PROMPT_THRESHOLD_2);
	}
#else
	// Force GD77S to always use the Master power level
	currentChannelData->libreDMR_Power = 0x00;
#endif
}

void uiChannelModeUpdateScreen(int txTimeSecs)
{
	int channelNumber;
	char nameBuf[NAME_BUFFER_LEN];
	char buffer[SCREEN_LINE_BUFFER_SIZE];

	// Only render the header, then wait for the next run
	// Otherwise the screen could remain blank if TG and PC are == 0
	// since uiDataGlobal.displayQSOState won't be set to QSO_DISPLAY_IDLE
	if ((trxGetMode() == RADIO_MODE_DIGITAL) && (HRC6000GetReceivedTgOrPcId() == 0) &&
			((uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA) || (uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA_UPDATE)))
	{
		uiUtilityRedrawHeaderOnly(false, false);
		return;
	}

	// We're currently displaying details, and it shouldn't be overridden by QSO data
	if (uiDataGlobal.displayChannelSettings && ((uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA)
			|| (uiDataGlobal.displayQSOState == QSO_DISPLAY_CALLER_DATA_UPDATE)))
	{
		// We will not restore the previous QSO Data as a new caller just arose.
		uiDataGlobal.displayQSOStatePrev = QSO_DISPLAY_DEFAULT_SCREEN;
		uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
	}

	displayClearBuf();
	uiUtilityRenderHeader(false, false);

	switch(uiDataGlobal.displayQSOState)
	{
		case QSO_DISPLAY_DEFAULT_SCREEN:
			lastHeardClearLastID();
			uiDataGlobal.displayQSOStatePrev = QSO_DISPLAY_DEFAULT_SCREEN;
			uiDataGlobal.isDisplayingQSOData = false;
			uiDataGlobal.receivedPcId = 0x00;
			if (trxTransmissionEnabled)
			{
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, " %d ", txTimeSecs);
				uiUtilityDisplayInformation(buffer, DISPLAY_INFO_TX_TIMER, -1);
			}
			else
			{
				// Display some channel settings
				if (uiDataGlobal.displayChannelSettings)
				{
					displaySetForegroundColour(CHANNEL_SETTINGS_FG_COLOR);
					uiUtilityDisplayInformation(NULL, DISPLAY_INFO_TONE_AND_SQUELCH, -1);
					uiUtilityDisplayFrequency(DISPLAY_Y_POS_RX_FREQ, false, false, (uiDataGlobal.reverseRepeaterChannel ? currentChannelData->txFreq : currentChannelData->rxFreq), false, false, 0);
					uiUtilityDisplayFrequency(DISPLAY_Y_POS_TX_FREQ, true, false, (uiDataGlobal.reverseRepeaterChannel ? currentChannelData->rxFreq : currentChannelData->txFreq), false, false, 0);
					displaySetForegroundColour(MAIN_FG_COLOR);
				}
				else
				{
					if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
					{
						// All Channels virtual zone
						channelNumber = nonVolatileSettings.currentChannelIndexInAllZone;
						if (directChannelNumber > 0)
						{
							snprintf(nameBuf, NAME_BUFFER_LEN, "%s %d", currentLanguage->gotoChannel, directChannelNumber);
						}
						else
						{
							snprintf(nameBuf, NAME_BUFFER_LEN, "%s Ch:%d",currentLanguage->all_channels, channelNumber);
						}
					}
					else
					{
						channelNumber = nonVolatileSettings.currentChannelIndexInZone + 1;
						if (directChannelNumber > 0)
						{
							snprintf(nameBuf, NAME_BUFFER_LEN, "%s %d", currentLanguage->gotoChannel, directChannelNumber);
						}
						else
						{
							snprintf(nameBuf, NAME_BUFFER_LEN, "%s Ch:%d", currentZoneName, channelNumber);
						}
					}
					uiUtilityDisplayInformation(nameBuf, DISPLAY_INFO_ZONE, -1);

				/*
				 * Roger Clark. Commented out
				 * functionality to display "Scanning" instead of the channel name  (and TG on DMR) whilst scanning
				 * if (uiDataGlobal.Scan.active && (uiDataGlobal.Scan.state == SCAN_SCANNING))
					{
						uiUtilityDisplayInformation(currentLanguage->scanning, DISPLAY_INFO_CONTACT, -1);
						ucRender();
						break;
					}*/
				}
			}

			if (!uiDataGlobal.displayChannelSettings)
			{
#if defined(PLATFORM_MD9600)
				if (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_OUT_OF_BAND))
				{
					snprintf(nameBuf, NAME_BUFFER_LEN, "%s", currentLanguage->out_of_band);
				}
				else
#endif
				{
					codeplugUtilConvertBufToString(currentChannelData->name, nameBuf, 16);
				}

				uiUtilityDisplayInformation(nameBuf, (uiDataGlobal.reverseRepeaterChannel == true)?DISPLAY_INFO_CHANNEL_INVERTED:DISPLAY_INFO_CHANNEL , (trxTransmissionEnabled ? DISPLAY_Y_POS_CHANNEL_SECOND_LINE : -1));
			}

			if (trxGetMode() == RADIO_MODE_DIGITAL)
			{
				if (uiDataGlobal.displayChannelSettings)
				{
					uint32_t PCorTG = ((nonVolatileSettings.overrideTG != 0) ? nonVolatileSettings.overrideTG : codeplugContactGetPackedId(&currentContactData));

					displaySetForegroundColour(CHANNEL_SETTINGS_FG_COLOR);

					snprintf(nameBuf, NAME_BUFFER_LEN, "%s %u",
							(((PCorTG >> 24) == PC_CALL_FLAG) ? currentLanguage->pc : currentLanguage->tg),
							(PCorTG & 0xFFFFFF));
				}
				else
				{
					if (nonVolatileSettings.overrideTG != 0)
					{
						uiUtilityBuildTgOrPCDisplayName(nameBuf, SCREEN_LINE_BUFFER_SIZE);
						uiUtilityDisplayInformation(NULL, DISPLAY_INFO_CONTACT_OVERRIDE_FRAME, (trxTransmissionEnabled ? DISPLAY_Y_POS_CONTACT_TX_FRAME : -1));
					}
					else
					{
						codeplugUtilConvertBufToString(currentContactData.name, nameBuf, 16);
					}
				}

				uiUtilityDisplayInformation(nameBuf, DISPLAY_INFO_CONTACT, (trxTransmissionEnabled ? DISPLAY_Y_POS_CONTACT_TX : -1));

				if (uiDataGlobal.displayChannelSettings)
				{
					displaySetForegroundColour(MAIN_FG_COLOR);
				}
			}

			displayRender();
			break;

		case QSO_DISPLAY_CALLER_DATA:
		case QSO_DISPLAY_CALLER_DATA_UPDATE:
			uiDataGlobal.displayQSOStatePrev = QSO_DISPLAY_CALLER_DATA;
			uiDataGlobal.isDisplayingQSOData = true;
			uiDataGlobal.displayChannelSettings = false;
			uiUtilityRenderQSOData();
			displayRender();
			break;

		case QSO_DISPLAY_IDLE:
			break;
	}

	uiDataGlobal.displayQSOState = QSO_DISPLAY_IDLE;
}

static void handleEvent(uiEvent_t *ev)
{
#if defined(PLATFORM_GD77S)
	handleEventForGD77S(ev);
	return;
#else

	if (uiDataGlobal.Scan.active && (ev->events & KEY_EVENT))
	{
		// Key pressed during scanning

		if (BUTTONCHECK_DOWN(ev, BUTTON_SK2) == 0)
		{
			// if we are scanning and down key is pressed then enter current channel into nuisance delete array.
			if((uiDataGlobal.Scan.state == SCAN_PAUSED) && (ev->keys.key == KEY_STAR))
			{
				// There is two channels available in the Zone, just stop scanning
				if (uiDataGlobal.Scan.nuisanceDeleteIndex == (uiDataGlobal.Scan.availableChannelsCount - 2))
				{
					uiDataGlobal.Scan.lastIteration = true;
				}

				uiDataGlobal.Scan.nuisanceDelete[uiDataGlobal.Scan.nuisanceDeleteIndex] = uiDataGlobal.currentSelectedChannelNumber;
				uiDataGlobal.Scan.nuisanceDeleteIndex = (uiDataGlobal.Scan.nuisanceDeleteIndex + 1) % MAX_ZONE_SCAN_NUISANCE_CHANNELS;
				uiDataGlobal.Scan.timer.timeout = SCAN_SKIP_CHANNEL_INTERVAL;	//force scan to continue;
				uiDataGlobal.Scan.state = SCAN_SCANNING;
				keyboardReset();
				return;
			}

			// Down key reverses the scan direction
			if (ev->keys.key == KEY_FRONT_DOWN)
			{
				uiDataGlobal.Scan.direction *= -1;
				keyboardReset();
				return;
			}
		}
		// stop the scan on any button except UP without Shift (allows scan to be manually continued)
		// or SK2 on its own (allows Backlight to be triggered)
		if (((ev->keys.key == KEY_FRONT_UP) && BUTTONCHECK_DOWN(ev, BUTTON_SK2) == 0) == false)
		{
			scanStop(true);
			keyboardReset();
			return;
		}
	}

	if (ev->events & FUNCTION_EVENT)
	{
		if (ev->function == FUNC_START_SCANNING)
		{
			directChannelNumber = 0;
			if (uiDataGlobal.Scan.active == false)
			{
				scanStart(false);
			}
			return;
		}
		else if (ev->function == FUNC_REDRAW)
		{
			uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
			uiChannelModeUpdateScreen(0);
			return;
		}
	}

	if ((uiDataGlobal.reverseRepeaterChannel == false) && handleMonitorMode(ev))
	{
		return;
	}

	if (ev->events & BUTTON_EVENT)
	{
		if (rebuildVoicePromptOnExtraLongSK1(ev))
		{
			return;
		}

		if (repeatVoicePromptOnSK1(ev))
		{
			return;
		}

		uint32_t tg = (LinkHead->talkGroupOrPcId & 0xFFFFFF);

		// If Blue button is pressed during reception it sets the Tx TG to the incoming TG
		if (uiDataGlobal.isDisplayingQSOData && BUTTONCHECK_SHORTUP(ev, BUTTON_SK2) && (trxGetMode() == RADIO_MODE_DIGITAL) &&
				((trxTalkGroupOrPcId != tg) ||
						((dmrMonitorCapturedTS != -1) && (dmrMonitorCapturedTS != trxGetDMRTimeSlot())) ||
						(trxGetDMRColourCode() != currentChannelData->txColor)))
		{
			lastHeardClearLastID();

			// Set TS to overriden TS
			if ((dmrMonitorCapturedTS != -1) && (dmrMonitorCapturedTS != trxGetDMRTimeSlot()))
			{
				trxSetDMRTimeSlot(dmrMonitorCapturedTS, false);
				tsSetManualOverride(CHANNEL_CHANNEL, (dmrMonitorCapturedTS + 1));
			}

			if (trxTalkGroupOrPcId != tg)
			{
				trxTalkGroupOrPcId = tg;
				settingsSet(nonVolatileSettings.overrideTG, trxTalkGroupOrPcId);
			}

			currentChannelData->txColor = trxGetDMRColourCode();// Set the CC to the current CC, which may have been determined by the CC finding algorithm in C6000.c

			announceItem(PROMPT_SEQUENCE_CONTACT_TG_OR_PC,PROMPT_THRESHOLD_NEVER_PLAY_IMMEDIATELY);

			uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
			uiChannelModeUpdateScreen(0);
			uiDataGlobal.displayQSOState = QSO_DISPLAY_CALLER_DATA_UPDATE;
			soundSetMelody(MELODY_ACK_BEEP);
			return;
		}

		// Display channel settings (RX/TX/etc) while SK1 is pressed
		if ((uiDataGlobal.displayChannelSettings == false) && BUTTONCHECK_DOWN(ev, BUTTON_SK1))
		{
			if (uiDataGlobal.Scan.active == false)
			{
				int prevQSODisp = uiDataGlobal.displayQSOStatePrev;
				uiDataGlobal.displayChannelSettings = true;
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
				uiChannelModeUpdateScreen(0);
				uiDataGlobal.displayQSOStatePrev = prevQSODisp;
			}
			return;

		}
		else if ((uiDataGlobal.displayChannelSettings == true) && (BUTTONCHECK_DOWN(ev, BUTTON_SK1) == 0))
		{
			uiDataGlobal.displayChannelSettings = false;
			uiDataGlobal.displayQSOState = uiDataGlobal.displayQSOStatePrev;

			// Maybe QSO State has been overridden, double check if we could now
			// display QSO Data
			if (uiDataGlobal.displayQSOState == QSO_DISPLAY_DEFAULT_SCREEN)
			{
				if (isQSODataAvailableForCurrentTalker())
				{
					uiDataGlobal.displayQSOState = QSO_DISPLAY_CALLER_DATA;
				}
			}

			uiChannelModeUpdateScreen(0);
			return;
		}

#if !defined(PLATFORM_RD5R)
		if (BUTTONCHECK_SHORTUP(ev, BUTTON_ORANGE) && (BUTTONCHECK_DOWN(ev, BUTTON_SK1) == 0))
		{
			if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
			{
				announceItem(PROMPT_SEQUENCE_BATTERY, AUDIO_PROMPT_MODE_VOICE_LEVEL_1);
			}
			else
			{
				// Quick Menu
				menuSystemPushNewMenu(UI_CHANNEL_QUICK_MENU);

				// Trick to beep (AudioAssist), since ORANGE button doesn't produce any beep event
				ev->keys.event |= KEY_MOD_UP;
				ev->keys.key = 127;
				menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
				// End Trick
			}

			return;
		}
#endif
	}

	if (ev->events & KEY_EVENT)
	{
#if defined(PLATFORM_MD9600)
		if (KEYCHECK_LONGDOWN(ev->keys, KEY_GREEN))
		{
			if (uiDataGlobal.Scan.active)
			{
				uiChannelModeStopScanning();
			}

			menuSystemPushNewMenu(UI_CHANNEL_QUICK_MENU);

			// Trick to beep (AudioAssist), since ORANGE button doesn't produce any beep event
			ev->keys.event |= KEY_MOD_UP;
			ev->keys.key = 127;
			menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
			// End Trick
			return;
		}
		else
#endif
		if (KEYCHECK_SHORTUP(ev->keys, KEY_GREEN))
		{
			if (directChannelNumber > 0)
			{
				if(CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
				{
					// All Channels virtual zone
					if (codeplugAllChannelsIndexIsInUse(directChannelNumber))
					{
						settingsSet(nonVolatileSettings.currentChannelIndexInAllZone, (int16_t) directChannelNumber);
						loadChannelData(false, true);

					}
					else
					{
						soundSetMelody(MELODY_ERROR_BEEP);
					}
				}
				else
				{
					if ((directChannelNumber - 1) < currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone)
					{
						settingsSet(nonVolatileSettings.currentChannelIndexInZone, (int16_t) (directChannelNumber - 1));
						loadChannelData(false, true);
					}
					else
					{
						soundSetMelody(MELODY_ERROR_BEEP);
					}

				}
				directChannelNumber = 0;
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
				uiChannelModeUpdateScreen(0);
			}
			else if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
			{
				menuSystemPushNewMenu(MENU_CHANNEL_DETAILS);
			}
			else
			{
				menuSystemPushNewMenu(MENU_MAIN_MENU);
			}
			return;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_HASH))
		{
			if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
			{
				// Assignment for SK2 + #
				menuSystemPushNewMenu(MENU_CONTACT_QUICKLIST);
			}
			else
			{
				menuSystemPushNewMenu(MENU_NUMERICAL_ENTRY);
			}
			return;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_RED))
		{
			if (BUTTONCHECK_DOWN(ev, BUTTON_SK2) && (uiDataGlobal.tgBeforePcMode != 0))
			{
				settingsSet(nonVolatileSettings.overrideTG, uiDataGlobal.tgBeforePcMode);
				menuPrivateCallClear();

				updateTrxID();
				uiDataGlobal.displayQSOState= QSO_DISPLAY_DEFAULT_SCREEN;// Force redraw
				uiChannelModeUpdateScreen(0);
				return;// The event has been handled
			}

			if(directChannelNumber > 0)
			{
				announceItem(PROMPT_SEQUENCE_CHANNEL_NAME_OR_VFO_FREQ, PROMPT_THRESHOLD_NEVER_PLAY_IMMEDIATELY);

				directChannelNumber = 0;
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
				uiChannelModeUpdateScreen(0);
			}
			else
			{
#if defined(PLATFORM_GD77) || defined(PLATFORM_DM1801A) || defined(PLATFORM_MD9600) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017) 
				menuSystemSetCurrentMenu(UI_VFO_MODE);
#endif
				return;
			}
		}
#if defined(PLATFORM_DM1801) || defined(PLATFORM_RD5R)
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_VFO_MR))
		{
			directChannelNumber = 0;
			menuSystemSetCurrentMenu(UI_VFO_MODE);
			return;
		}
#endif
#if defined(PLATFORM_RD5R)
		else if (KEYCHECK_LONGDOWN(ev->keys, KEY_VFO_MR) && (BUTTONCHECK_DOWN(ev, BUTTON_SK1) == 0))
		{
			if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
			{
				announceItem(PROMPT_SEQUENCE_BATTERY, AUDIO_PROMPT_MODE_VOICE_LEVEL_1);
			}
			else
			{
				menuSystemPushNewMenu(UI_CHANNEL_QUICK_MENU);

				// Trick to beep (AudioAssist), since ORANGE button doesn't produce any beep event
				ev->keys.event |= KEY_MOD_UP;
				ev->keys.key = 127;
				menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
				// End Trick
			}

			return;
		}
#endif
		else if (KEYCHECK_LONGDOWN(ev->keys, KEY_FRONT_UP) && BUTTONCHECK_DOWN(ev, BUTTON_SK2))
		{
			// Long press allows the 5W+ power setting to be selected immediately
			if (increasePowerLevel(true))
			{
				uiUtilityRedrawHeaderOnly(false, false);
			}
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_FRONT_UP))
		{
			if (uiDataGlobal.Scan.active == true)
			{
				handleUpKey(ev);
			}
			else
			{
				if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
				{
					if (increasePowerLevel(false))
					{
						uiUtilityRedrawHeaderOnly(false, false);
					}
				}
				else
				{
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						if (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup > 1)
						{
							if (nonVolatileSettings.overrideTG == 0)
							{
								settingsIncrement(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 1);
								if (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] > (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1))
								{
									settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 0);
									menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
								}
							}
						}
						settingsSet(nonVolatileSettings.overrideTG, 0);// setting the override TG to 0 indicates the TG is not overridden
						menuPrivateCallClear();
						updateTrxID();
						// We're in digital mode, RXing, and current talker is already at the top of last heard list,
						// hence immediately display complete contact/TG info on screen
						uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;//(isQSODataAvailableForCurrentTalker() ? QSO_DISPLAY_CALLER_DATA : QSO_DISPLAY_DEFAULT_SCREEN);
						if (isQSODataAvailableForCurrentTalker())
						{
							(void)addTimerCallback(uiUtilityRenderQSODataAndUpdateScreen, 2000, UI_CHANNEL_MODE, true);
						}
						uiChannelModeUpdateScreen(0);
						announceItem(PROMPT_SEQUENCE_CONTACT_TG_OR_PC,PROMPT_THRESHOLD_3);
					}
					else
					{
						if(currentChannelData->sql == 0)			//If we were using default squelch level
						{
							currentChannelData->sql = nonVolatileSettings.squelchDefaults[trxCurrentBand[TRX_RX_FREQ_BAND]];			//start the adjustment from that point.
						}

						if (currentChannelData->sql < CODEPLUG_MAX_VARIABLE_SQUELCH)
						{
							currentChannelData->sql++;
						}

						announceItem(PROMPT_SQUENCE_SQUELCH,PROMPT_THRESHOLD_3);

						uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
						uiNotificationShow(NOTIFICATION_TYPE_SQUELCH, NOTIFICATION_ID_SQUELCH, 1000, NULL, false);
						uiChannelModeUpdateScreen(0);
					}
				}
			}
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_FRONT_DOWN))
		{
			if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
			{
				if (decreasePowerLevel())
				{
					uiUtilityRedrawHeaderOnly(false, false);
				}

				if (trxGetPowerLevel() == 0)
				{
					menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
				}
			}
			else
			{
				if (trxGetMode() == RADIO_MODE_DIGITAL)
				{
					if (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup > 1)
					{
						// To Do change TG in on same channel freq
						if (nonVolatileSettings.overrideTG == 0)
						{
							settingsDecrement(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 1);
							if (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < 0)
							{
								settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE],
										(int16_t) (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1));
							}

							if (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] == 0)
							{
								menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
							}
						}
					}
					settingsSet(nonVolatileSettings.overrideTG, 0);// setting the override TG to 0 indicates the TG is not overridden
					menuPrivateCallClear();
					updateTrxID();
					// We're in digital mode, RXing, and current talker is already at the top of last heard list,
					// hence immediately display complete contact/TG info on screen
					uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;//(isQSODataAvailableForCurrentTalker() ? QSO_DISPLAY_CALLER_DATA : QSO_DISPLAY_DEFAULT_SCREEN);
					if (isQSODataAvailableForCurrentTalker())
					{
						(void)addTimerCallback(uiUtilityRenderQSODataAndUpdateScreen, 2000, UI_CHANNEL_MODE, true);
					}
					uiChannelModeUpdateScreen(0);
					announceItem(PROMPT_SEQUENCE_CONTACT_TG_OR_PC,PROMPT_THRESHOLD_3);
				}
				else
				{
					if(currentChannelData->sql == 0)			//If we were using default squelch level
					{
						currentChannelData->sql = nonVolatileSettings.squelchDefaults[trxCurrentBand[TRX_RX_FREQ_BAND]];			//start the adjustment from that point.
					}

					if (currentChannelData->sql > CODEPLUG_MIN_VARIABLE_SQUELCH)
					{
						currentChannelData->sql--;
					}

					announceItem(PROMPT_SQUENCE_SQUELCH,PROMPT_THRESHOLD_3);

					uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
					uiNotificationShow(NOTIFICATION_TYPE_SQUELCH, NOTIFICATION_ID_SQUELCH, 1000, NULL, false);
					uiChannelModeUpdateScreen(0);
				}

			}
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_STAR))
		{
			if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))  // Toggle Channel Mode
			{
				if (trxGetMode() == RADIO_MODE_ANALOG)
				{
					currentChannelData->chMode = RADIO_MODE_DIGITAL;
					uiDataGlobal.VoicePrompts.inhibitInitial = true;// Stop VP playing in loadChannelData
					loadChannelData(true, false);
					uiDataGlobal.VoicePrompts.inhibitInitial = false;
					menuChannelExitStatus |= MENU_STATUS_FORCE_FIRST;
				}
				else
				{
					currentChannelData->chMode = RADIO_MODE_ANALOG;
					trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));
					trxSetRxCSS(currentChannelData->rxTone);
				}

				announceItem(PROMPT_SEQUENCE_MODE, PROMPT_THRESHOLD_1);
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
				uiChannelModeUpdateScreen(0);
			}
			else
			{
				if (trxGetMode() == RADIO_MODE_DIGITAL)
				{
					// Toggle timeslot
					trxSetDMRTimeSlot(1 - trxGetDMRTimeSlot(), true);
					tsSetManualOverride(CHANNEL_CHANNEL, (trxGetDMRTimeSlot() + 1));

					if ((nonVolatileSettings.overrideTG == 0) && (currentContactData.reserve1 & 0x01) == 0x00)
					{
						tsSetContactHasBeenOverriden(CHANNEL_CHANNEL, true);
					}

					disableAudioAmp(AUDIO_AMP_MODE_RF);
					lastHeardClearLastID();
					uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
					uiChannelModeUpdateScreen(0);

					if (trxGetDMRTimeSlot() == 0)
					{
						menuChannelExitStatus |= MENU_STATUS_FORCE_FIRST;
					}
					announceItem(PROMPT_SEQUENCE_TS,PROMPT_THRESHOLD_3);
				}
				else
				{
					if (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K))
					{
						codeplugChannelSetFlag(currentChannelData, CHANNEL_FLAG_BW_25K, false);
					}
					else
					{
						codeplugChannelSetFlag(currentChannelData, CHANNEL_FLAG_BW_25K, true);
						nextKeyBeepMelody = (int *)MELODY_KEY_BEEP_FIRST_ITEM;
					}
					// ToDo announce VP for bandwidth perhaps

					trxSetModeAndBandwidth(RADIO_MODE_ANALOG, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));
					soundSetMelody(MELODY_NACK_BEEP);
					headerRowIsDirty = true;
					uiChannelModeUpdateScreen(0);
				}
			}
		}
		else if (KEYCHECK_LONGDOWN(ev->keys, KEY_STAR) && (BUTTONCHECK_DOWN(ev, BUTTON_SK2) == 0))
		{
			if (trxGetMode() == RADIO_MODE_DIGITAL)
			{
				tsSetManualOverride(CHANNEL_CHANNEL, TS_NO_OVERRIDE);
				tsSetContactHasBeenOverriden(CHANNEL_CHANNEL, false);

				if ((currentRxGroupData.name[0] != 0) && (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup))
				{
					codeplugContactGetDataForIndex(currentRxGroupData.contacts[nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE]], &currentContactData);
				}
				else
				{
					codeplugContactGetDataForIndex(currentChannelData->contact, &currentContactData);
				}

				trxUpdateTsForCurrentChannelWithSpecifiedContact(&currentContactData);

				lastHeardClearLastID();
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
				uiChannelModeUpdateScreen(0);
				announceItem(PROMPT_SEQUENCE_TS, PROMPT_THRESHOLD_1);
			}
		}
		else if (KEYCHECK_LONGDOWN(ev->keys, KEY_HASH) && (KEYCHECK_LONGDOWN_REPEAT(ev->keys, KEY_HASH) == false))
		{
			if (!uiDataGlobal.reverseRepeaterChannel)
			{
				trxSetFrequency(currentChannelData->txFreq, currentChannelData->rxFreq, DMR_MODE_DMO);// Swap Tx and Rx freqs but force DMR Active
			}
			else
			{
				trxSetFrequency(currentChannelData->rxFreq, currentChannelData->txFreq, DMR_MODE_AUTO);
			}

			uiDataGlobal.reverseRepeaterChannel = !uiDataGlobal.reverseRepeaterChannel;
			announceItem(PROMPT_SEQUENCE_CHANNEL_NAME_AND_CONTACT_OR_VFO_FREQ_AND_MODE, PROMPT_THRESHOLD_NEVER_PLAY_IMMEDIATELY);
			uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
			uiChannelModeUpdateScreen(0);
			return;
		}
		else if (KEYCHECK_SHORTUP(ev->keys,KEY_ROTARY_DECREMENT))
		{
			handleDownKey(ev);
			return;
		}
		else if (KEYCHECK_SHORTUP(ev->keys,KEY_ROTARY_INCREMENT))
		{
			handleUpKey(ev);
			return;
		}
		else if (KEYCHECK_LONGDOWN(ev->keys, KEY_FRONT_UP) && (BUTTONCHECK_DOWN(ev, BUTTON_SK2) == 0))
		{
			if (uiDataGlobal.Scan.active == false)
			{
				scanStart(true);
				return;
			}
		}
		else
		{
			int keyval = menuGetKeypadKeyValue(ev, true);

			if ((keyval < 10) && (!BUTTONCHECK_DOWN(ev, BUTTON_SK2)))
			{
				directChannelNumber = (directChannelNumber * 10) + keyval;
				if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
				{
					// All Channels virtual zone
					if(directChannelNumber > CODEPLUG_CONTACTS_MAX)
					{
						directChannelNumber = 0;
						soundSetMelody(MELODY_ERROR_BEEP);
					}
				}
				else
				{
					if(directChannelNumber > currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone)
					{
						directChannelNumber = 0;
						soundSetMelody(MELODY_ERROR_BEEP);
					}
				}

				if (directChannelNumber > 0)
				{
					voicePromptsInit();
					if (directChannelNumber < 10)
					{
						voicePromptsAppendLanguageString(&currentLanguage->gotoChannel);
					}
					voicePromptsAppendPrompt(PROMPT_0 + keyval);
					voicePromptsPlay();
				}
				else
				{
					announceItem(PROMPT_SEQUENCE_CHANNEL_NAME_OR_VFO_FREQ, PROMPT_THRESHOLD_3);
				}

				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
				uiChannelModeUpdateScreen(0);
			}
		}
	}
#endif // ! PLATFORM_GD77S
}

#if ! defined(PLATFORM_GD77S)
static void selectPrevNextZone(bool nextZone)
{
	int numZones = codeplugZonesGetCount();

	if (nextZone)
	{
		settingsIncrement(nonVolatileSettings.currentZone, 1);

		if (nonVolatileSettings.currentZone >= numZones)
		{
			settingsSet(nonVolatileSettings.currentZone, 0);
		}
	}
	else
	{
		if (nonVolatileSettings.currentZone == 0)
		{
			settingsSet(nonVolatileSettings.currentZone, (int16_t) (numZones - 1));
		}
		else
		{
			settingsDecrement(nonVolatileSettings.currentZone, 1);
		}
	}

/*
 * VK3KYY
 * I don't understand why these should be reset when changing zones.
 * Only the change to TG override will be clear to the operator.
 *
 * Changing zones should only change the zone.
 * I can't see a compelling reason to override what the operator has setup just because they change zones
 *
	settingsSet(nonVolatileSettings.overrideTG, 0); // remove any TG override

	tsSetManualOverride(CHANNEL_CHANNEL, TS_NO_OVERRIDE);// remove any TS override
*/
	settingsSet(nonVolatileSettings.currentChannelIndexInZone, 0);// Since we are switching zones the channel index should be reset
	currentChannelData->rxFreq = 0x00; // Flag to the Channel screen that the channel data is now invalid and needs to be reloaded
}

static void handleUpKey(uiEvent_t *ev)
{
	if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
	{
		selectPrevNextZone(true);
		menuSystemPopAllAndDisplaySpecificRootMenu(UI_CHANNEL_MODE, false);
		uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // Force screen redraw

		if (nonVolatileSettings.currentZone == 0)
		{
			menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
		}
		return;
	}
	else
	{
		int16_t nextChan = -1;

		if (uiDataGlobal.Scan.active)
		{
			// We are scanning downward
			if (uiDataGlobal.Scan.state == SCAN_PAUSED)
			{
				if (uiDataGlobal.Scan.direction == -1)
				{
					handleDownKey(ev);
					return;
				}

				// Let's select the next channel
			}
			else
			{
				// We're not paused, we shouldn't change the current channel
				return;
			}
		}

		if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
		{
			if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1)
			{
				nextChan = nonVolatileSettings.currentChannelIndexInAllZone;

				// All Channels virtual zone
				do
				{
					nextChan = ((((nextChan - 1) + 1) % currentZone.NOT_IN_CODEPLUGDATA_highestIndex) + 1);

					if (nextChan == CODEPLUG_CONTACTS_MIN)
					{
						menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
					}

				} while (!codeplugAllChannelsIndexIsInUse(nextChan));

				settingsSet(nonVolatileSettings.currentChannelIndexInAllZone, nextChan);
			}
		}
		else
		{
			if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1)
			{
				nextChan = ((nonVolatileSettings.currentChannelIndexInZone + 1) % currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone);

				settingsSet(nonVolatileSettings.currentChannelIndexInZone, nextChan);

				if (nonVolatileSettings.currentChannelIndexInZone == 0)
				{
					menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
				}
			}
		}
		if (uiDataGlobal.Scan.active && (nextChan != -1))
		{
			scanNextChannelIndex = nextChan;
			scanNextChannelReady = true;
		}

		uiDataGlobal.Scan.timer.timeout = (uiDataGlobal.Scan.active ? 0 : 500); // when scanning is running, don't let it pick another channel
		uiDataGlobal.Scan.state = SCAN_SCANNING;
	}

	lastHeardClearLastID();
	loadChannelData(false, true);
	uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
	uiChannelModeUpdateScreen(0);
}

static void handleDownKey(uiEvent_t *ev)
{
	if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
	{
		selectPrevNextZone(false);
		menuSystemPopAllAndDisplaySpecificRootMenu(UI_CHANNEL_MODE, false);
		uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // Force screen redraw

		if (nonVolatileSettings.currentZone == 0)
		{
			menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
		}

		return;
	}
	else
	{
		int16_t prevChan = -1;

		if (uiDataGlobal.Scan.active)
		{
			// We are scanning downward
			if (uiDataGlobal.Scan.state == SCAN_PAUSED)
			{
				if (uiDataGlobal.Scan.direction == 1)
				{
					handleUpKey(ev);
					return;
				}

				// Let's select the previous channel
			}
			else
			{
				// We're not paused, we shouldn't change the current channel
				return;
			}
		}

		if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
		{
			if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1)
			{
				prevChan = nonVolatileSettings.currentChannelIndexInAllZone;

				// All Channels virtual zone
				do
				{
					prevChan = ((((prevChan - 1) + currentZone.NOT_IN_CODEPLUGDATA_highestIndex - 1) % currentZone.NOT_IN_CODEPLUGDATA_highestIndex) + 1);

				} while (!codeplugAllChannelsIndexIsInUse(prevChan));

				settingsSet(nonVolatileSettings.currentChannelIndexInAllZone, prevChan);

				if (nonVolatileSettings.currentChannelIndexInAllZone == 1)
				{
					menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
				}
			}
		}
		else
		{
			if (currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone > 1)
			{
				prevChan = ((nonVolatileSettings.currentChannelIndexInZone + currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone - 1) % currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone);

				settingsSet(nonVolatileSettings.currentChannelIndexInZone, prevChan);

				if (nonVolatileSettings.currentChannelIndexInZone == 0)
				{
					menuChannelExitStatus |= (MENU_STATUS_LIST_TYPE | MENU_STATUS_FORCE_FIRST);
				}
			}
		}

		if (uiDataGlobal.Scan.active && (prevChan != -1))
		{
			scanNextChannelIndex = prevChan;
			scanNextChannelReady = true;
		}

		uiDataGlobal.Scan.timer.timeout = (uiDataGlobal.Scan.active ? 0 : 500); // when scanning is running, don't let it pick another channel
		uiDataGlobal.Scan.state = SCAN_SCANNING;
	}

	lastHeardClearLastID();
	loadChannelData(false, true);
	uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
	uiChannelModeUpdateScreen(0);
}

#endif // ! PLATFORM_GD77S


// ---------------------------------------- Quick Menu functions -------------------------------------------------------------------
menuStatus_t uiChannelModeQuickMenu(uiEvent_t *ev, bool isFirstRun)
{
	if (isFirstRun)
	{
		if (quickmenuChannelFromVFOHandled)
		{
			quickmenuChannelFromVFOHandled = false;
			menuSystemPopAllAndDisplayRootMenu();
			return MENU_STATUS_SUCCESS;
		}

		uiChannelModeStopScanning();
		uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel = nonVolatileSettings.dmrDestinationFilter;
		uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel = nonVolatileSettings.dmrCcTsFilter;
		uiDataGlobal.QuickMenu.tmpAnalogFilterLevel = nonVolatileSettings.analogFilterLevel;

		menuDataGlobal.numItems = NUM_CH_SCREEN_QUICK_MENU_ITEMS;

		menuDataGlobal.menuOptionsSetQuickkey = 0;
		menuDataGlobal.menuOptionsTimeout = 0;
		menuDataGlobal.newOptionSelected = true;

		voicePromptsInit();
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		voicePromptsAppendLanguageString(&currentLanguage->quick_menu);
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		voicePromptsAppendPrompt(PROMPT_SILENCE);

		updateQuickMenuScreen(true);
		return (MENU_STATUS_LIST_TYPE | MENU_STATUS_SUCCESS);
	}
	else
	{
		menuQuickChannelExitStatus = MENU_STATUS_SUCCESS;

		if ((ev->hasEvent) || (menuDataGlobal.menuOptionsTimeout > 0))
		{
			handleQuickMenuEvent(ev);
		}
	}

	return menuQuickChannelExitStatus;
}

static bool validateOverwriteChannel(void)
{
	quickmenuChannelFromVFOHandled = true;

	if (uiDataGlobal.MessageBox.keyPressed == KEY_GREEN)
	{
		struct_codeplugContact_t vfoContact;
		int8_t vfoTS = -1;

		uiVFOLoadContact(&vfoContact);
		memcpy(&currentChannelData->rxFreq, &settingsVFOChannel[nonVolatileSettings.currentVFONumber].rxFreq, CODEPLUG_CHANNEL_DATA_STRUCT_SIZE - 16);// Don't copy the name of the vfo, which are in the first 16 bytes
		// Find out which TS was in use.
		if ((nonVolatileSettings.overrideTG == 0) && (vfoContact.reserve1 & 0x01) == 0x00)
		{
			vfoTS = ((vfoContact.reserve1 & 0x02) != 0);
		}
		else
		{
			vfoTS = tsGetManualOverride((Channel_t)nonVolatileSettings.currentVFONumber);

			// No Override, use the TS from the Channel
			if (vfoTS == 0)
			{
				vfoTS = (codeplugChannelIsFlagSet(&settingsVFOChannel[nonVolatileSettings.currentVFONumber], CHANNEL_FLAG_TIMESLOT_TWO) ? 1 : 0);
			}
			else
			{
				vfoTS--; // convert to real TS
			}
		}

		codeplugChannelSetFlag(currentChannelData, CHANNEL_FLAG_TIMESLOT_TWO, ((vfoTS == 0) ? false : true));
		codeplugChannelSaveDataForIndex(uiDataGlobal.currentSelectedChannelNumber, currentChannelData);
	}

	return true;
}

static void updateQuickMenuScreen(bool isFirstRun)
{
	int mNum = 0;
	char buf[SCREEN_LINE_BUFFER_SIZE];
	char * const *leftSide;// initialise to please the compiler
	char * const *rightSideConst;// initialise to please the compiler
	char rightSideVar[SCREEN_LINE_BUFFER_SIZE];

	displayClearBuf();
	bool settingOption = uiShowQuickKeysChoices(buf, SCREEN_LINE_BUFFER_SIZE, currentLanguage->quick_menu);

	for(int i = 1 - ((MENU_MAX_DISPLAYED_ENTRIES - 1) / 2) - 1; i <= (MENU_MAX_DISPLAYED_ENTRIES - ((MENU_MAX_DISPLAYED_ENTRIES - 1) / 2) - 1); i++)
	{
		if ((settingOption == false) || (i == 0))
		{
			mNum = menuGetMenuOffset(NUM_CH_SCREEN_QUICK_MENU_ITEMS, i);
			if (mNum == MENU_OFFSET_BEFORE_FIRST_ENTRY)
			{
				continue;
			}
			else if (mNum == MENU_OFFSET_AFTER_LAST_ENTRY)
			{
				break;
			}

			buf[0] = 0;
			rightSideVar[0] = 0;
			rightSideConst = NULL;
			leftSide = NULL;

			switch(mNum)
			{
				case CH_SCREEN_QUICK_MENU_COPY2VFO:
					rightSideConst = (char * const *)&currentLanguage->channelToVfo;
					break;
				case CH_SCREEN_QUICK_MENU_COPY_FROM_VFO:
					rightSideConst = (char * const *)&currentLanguage->vfoToChannel;
					break;
				case CH_SCREEN_QUICK_MENU_FILTER_FM:
					leftSide = (char * const *)&currentLanguage->filter;
					if (uiDataGlobal.QuickMenu.tmpAnalogFilterLevel == 0)
					{
						rightSideConst = (char * const *)&currentLanguage->none;
					}
					else
					{
						snprintf(rightSideVar, SCREEN_LINE_BUFFER_SIZE, "%s", ANALOG_FILTER_LEVELS[uiDataGlobal.QuickMenu.tmpAnalogFilterLevel - 1]);
					}
					break;
				case CH_SCREEN_QUICK_MENU_FILTER_DMR:
					leftSide = (char * const *)&currentLanguage->dmr_filter;
					if (uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel == 0)
					{
						rightSideConst = (char * const *)&currentLanguage->none;
					}
					else
					{
						snprintf(rightSideVar, SCREEN_LINE_BUFFER_SIZE, "%s", DMR_DESTINATION_FILTER_LEVELS[uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel - 1]);
					}
					break;
				case CH_SCREEN_QUICK_MENU_DMR_CC_SCAN:
					leftSide = (char * const *)&currentLanguage->dmr_cc_scan;
					rightSideConst = (uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel & DMR_CC_FILTER_PATTERN) ? (char * const *)&currentLanguage->off : (char * const *)&currentLanguage->on;
					break;
				case CH_SCREEN_QUICK_MENU_FILTER_DMR_TS:
					leftSide = (char * const *)&currentLanguage->dmr_ts_filter;
					rightSideConst = (uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel & DMR_TS_FILTER_PATTERN) ? (char * const *)&currentLanguage->on : (char * const *)&currentLanguage->off;
					break;
				default:
					buf[0] = 0;
			}

			if (leftSide != NULL)
			{
				snprintf(buf, SCREEN_LINE_BUFFER_SIZE, "%s:%s", *leftSide, (rightSideVar[0] ? rightSideVar : *rightSideConst));
			}
			else
			{
				snprintf(buf, SCREEN_LINE_BUFFER_SIZE, "%s", (rightSideVar[0] ? rightSideVar : *rightSideConst));
			}

			if (i == 0)
			{
				if (!isFirstRun && (menuDataGlobal.menuOptionsSetQuickkey == 0))
				{
					voicePromptsInit();
				}

				if ((leftSide != NULL) || menuDataGlobal.newOptionSelected)
				{
					voicePromptsAppendLanguageString((const char * const *)leftSide);
				}

				if (rightSideVar[0] != 0)
				{
					voicePromptsAppendString(rightSideVar);
				}
				else
				{
					voicePromptsAppendLanguageString((const char * const *)rightSideConst);
				}

				if (menuDataGlobal.menuOptionsTimeout != -1)
				{
					promptsPlayNotAfterTx();
				}
				else
				{
					menuDataGlobal.menuOptionsTimeout = 0;// clear flag indicating that a QuickKey has just been set
				}
			}

			// QuickKeys
			if (menuDataGlobal.menuOptionsTimeout > 0)
			{
				menuDisplaySettingOption(*leftSide, (rightSideVar[0] ? rightSideVar : *rightSideConst));
			}
			else
			{
				menuDisplayEntry(i, mNum, buf);
			}
		}
	}

	displayRender();
}

static void handleQuickMenuEvent(uiEvent_t *ev)
{
	bool isDirty = false;
	bool executingQuickKey = false;

	if ((menuDataGlobal.menuOptionsTimeout > 0) && (!BUTTONCHECK_DOWN(ev, BUTTON_SK2)))
	{
		menuDataGlobal.menuOptionsTimeout--;
		if (menuDataGlobal.menuOptionsTimeout == 0)
		{
			// Let the QuickKey's VP playback to ends before
			// going back to the previous menu
			if (voicePromptsIsPlaying())
			{
				menuDataGlobal.menuOptionsTimeout++;
				return;
			}

			menuSystemPopPreviousMenu();
			return;
		}
	}

	if (ev->events & BUTTON_EVENT)
	{
		if (repeatVoicePromptOnSK1(ev))
		{
			return;
		}
	}

	if (ev->events & FUNCTION_EVENT)
	{
		isDirty = true;
		if ((QUICKKEY_TYPE(ev->function) == QUICKKEY_MENU) && (QUICKKEY_ENTRYID(ev->function) < NUM_CH_SCREEN_QUICK_MENU_ITEMS))
		{
			menuDataGlobal.currentItemIndex = QUICKKEY_ENTRYID(ev->function);
		}
		if ((QUICKKEY_FUNCTIONID(ev->function) != 0))
		{
			menuDataGlobal.menuOptionsTimeout = 1000;
			executingQuickKey = true;
		}
	}

	if ((ev->events & KEY_EVENT) && (menuDataGlobal.menuOptionsSetQuickkey == 0) && (menuDataGlobal.menuOptionsTimeout == 0))
	{
		if (KEYCHECK_PRESS(ev->keys, KEY_DOWN) && (menuDataGlobal.numItems != 0))
		{
			isDirty = true;
			menuSystemMenuIncrement(&menuDataGlobal.currentItemIndex, NUM_CH_SCREEN_QUICK_MENU_ITEMS);
			menuDataGlobal.newOptionSelected = true;
			menuQuickChannelExitStatus |= MENU_STATUS_LIST_TYPE;
		}
		else if (KEYCHECK_PRESS(ev->keys, KEY_UP))
		{
			isDirty = true;
			menuSystemMenuDecrement(&menuDataGlobal.currentItemIndex, NUM_CH_SCREEN_QUICK_MENU_ITEMS);
			menuDataGlobal.newOptionSelected = true;
			menuQuickChannelExitStatus |= MENU_STATUS_LIST_TYPE;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_GREEN))
		{
			quickKeyApply: // branching here when to quickkey was used.

			switch(menuDataGlobal.currentItemIndex)
			{
				case CH_SCREEN_QUICK_MENU_COPY2VFO:
				{
					int8_t currentTS = trxGetDMRTimeSlot();

					memcpy(&settingsVFOChannel[nonVolatileSettings.currentVFONumber].rxFreq, &currentChannelData->rxFreq, CODEPLUG_CHANNEL_DATA_STRUCT_SIZE - 16);// Don't copy the name of channel, which are in the first 16 bytes
					settingsVFOChannel[nonVolatileSettings.currentVFONumber].rxTone = currentChannelData->rxTone;
					settingsVFOChannel[nonVolatileSettings.currentVFONumber].txTone = currentChannelData->txTone;

					if (nonVolatileSettings.overrideTG == 0)
					{
						nonVolatileSettings.overrideTG = trxTalkGroupOrPcId;
					}

					// Set TS override
					tsSetManualOverride(((Channel_t)nonVolatileSettings.currentVFONumber), currentTS + 1);

					codeplugChannelSetFlag(&settingsVFOChannel[nonVolatileSettings.currentVFONumber], CHANNEL_FLAG_TIMESLOT_TWO, ((currentTS == 0) ? false : true));

					menuSystemPopAllAndDisplaySpecificRootMenu(UI_VFO_MODE, true);
					return;
				}
				break;

				case CH_SCREEN_QUICK_MENU_COPY_FROM_VFO:
					if (quickmenuChannelFromVFOHandled == false)
					{
						snprintf(uiDataGlobal.MessageBox.message, MESSAGEBOX_MESSAGE_LEN_MAX, "%s\n%s", currentLanguage->overwrite_qm, currentLanguage->please_confirm);
						uiDataGlobal.MessageBox.type = MESSAGEBOX_TYPE_INFO;
						uiDataGlobal.MessageBox.decoration = MESSAGEBOX_DECORATION_FRAME;
						uiDataGlobal.MessageBox.buttons = MESSAGEBOX_BUTTONS_YESNO;
						uiDataGlobal.MessageBox.validatorCallback = validateOverwriteChannel;

						menuSystemPushNewMenu(UI_MESSAGE_BOX);
						voicePromptsInit();
						voicePromptsAppendLanguageString(&currentLanguage->overwrite_qm);
						voicePromptsAppendLanguageString(&currentLanguage->please_confirm);
						voicePromptsPlay();
					}
					return;
					break;

				default:
					// CH_SCREEN_QUICK_MENU_FILTER_FM
					if (nonVolatileSettings.analogFilterLevel != uiDataGlobal.QuickMenu.tmpAnalogFilterLevel)
					{
						settingsSet(nonVolatileSettings.analogFilterLevel, uiDataGlobal.QuickMenu.tmpAnalogFilterLevel);
						trxSetAnalogFilterLevel(nonVolatileSettings.analogFilterLevel);
					}

					// CH_SCREEN_QUICK_MENU_FILTER_DMR
					if (nonVolatileSettings.dmrDestinationFilter != uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel)
					{
						settingsSet(nonVolatileSettings.dmrDestinationFilter, uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel);
						if (trxGetMode() == RADIO_MODE_DIGITAL)
						{
							HRC6000InitDigitalDmrRx();
							disableAudioAmp(AUDIO_AMP_MODE_RF);
						}
					}

					// CH_SCREEN_QUICK_MENU_FILTER_DMR_CC
					// CH_SCREEN_QUICK_MENU_FILTER_DMR_TS
					if (nonVolatileSettings.dmrCcTsFilter != uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel)
					{
						settingsSet(nonVolatileSettings.dmrCcTsFilter, uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel);
						if (trxGetMode() == RADIO_MODE_DIGITAL)
						{
							HRC6000InitDigitalDmrRx();
							HRC6000ResyncTimeSlot();
							disableAudioAmp(AUDIO_AMP_MODE_RF);
						}
					}
					break;
			}

			if (executingQuickKey)
			{
				updateQuickMenuScreen(false);
			}
			else
			{
				menuSystemPopPreviousMenu();
			}
			return;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_RED))
		{
			uiChannelModeStopScanning();
			menuSystemPopPreviousMenu();
			return;
		}
		else if (KEYCHECK_SHORTUP_NUMBER(ev->keys) && BUTTONCHECK_DOWN(ev, BUTTON_SK2))
		{
			isDirty = true;
			menuDataGlobal.menuOptionsSetQuickkey = ev->keys.key;
		}
	}

	if ((ev->events & (KEY_EVENT | FUNCTION_EVENT)) && (menuDataGlobal.menuOptionsSetQuickkey == 0))
	{
		if ((QUICKKEY_FUNCTIONID(ev->function) == FUNC_RIGHT) || KEYCHECK_PRESS(ev->keys, KEY_RIGHT))
		{
			if (menuDataGlobal.menuOptionsTimeout > 0)
			{
				menuDataGlobal.menuOptionsTimeout = 1000;
			}
			isDirty = true;
			menuDataGlobal.newOptionSelected = false;

			switch(menuDataGlobal.currentItemIndex)
			{
				case CH_SCREEN_QUICK_MENU_FILTER_FM:
					if (uiDataGlobal.QuickMenu.tmpAnalogFilterLevel < NUM_ANALOG_FILTER_LEVELS - 1)
					{
						uiDataGlobal.QuickMenu.tmpAnalogFilterLevel++;
					}
					break;
				case CH_SCREEN_QUICK_MENU_FILTER_DMR:
					if (uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel < NUM_DMR_DESTINATION_FILTER_LEVELS - 1)
					{
						uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel++;
					}
					break;
				case CH_SCREEN_QUICK_MENU_DMR_CC_SCAN:
					if ((uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel & DMR_CC_FILTER_PATTERN))
					{
						uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel &= ~DMR_CC_FILTER_PATTERN;
					}
					break;
				case CH_SCREEN_QUICK_MENU_FILTER_DMR_TS:
					if (!(uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel & DMR_TS_FILTER_PATTERN))
					{
						uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel |= DMR_TS_FILTER_PATTERN;
					}
					break;

			}

			if (executingQuickKey) // Instantly apply new setting
			{
				goto quickKeyApply;
			}
		}
		else if (KEYCHECK_PRESS(ev->keys, KEY_LEFT) || (QUICKKEY_FUNCTIONID(ev->function) == FUNC_LEFT))
		{
			if (menuDataGlobal.menuOptionsTimeout > 0)
			{
				menuDataGlobal.menuOptionsTimeout = 1000;
			}
			isDirty = true;
			menuDataGlobal.newOptionSelected = false;

			switch(menuDataGlobal.currentItemIndex)
			{
				case CH_SCREEN_QUICK_MENU_FILTER_FM:
					if (uiDataGlobal.QuickMenu.tmpAnalogFilterLevel > ANALOG_FILTER_NONE)
					{
						uiDataGlobal.QuickMenu.tmpAnalogFilterLevel--;
					}
					break;
				case CH_SCREEN_QUICK_MENU_FILTER_DMR:
					if (uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel > DMR_DESTINATION_FILTER_NONE)
					{
						uiDataGlobal.QuickMenu.tmpDmrDestinationFilterLevel--;
					}
					break;
				case CH_SCREEN_QUICK_MENU_DMR_CC_SCAN:
					if (!(uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel & DMR_CC_FILTER_PATTERN))
					{
						uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel |= DMR_CC_FILTER_PATTERN;
					}
					break;
				case CH_SCREEN_QUICK_MENU_FILTER_DMR_TS:
					if ((uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel & DMR_TS_FILTER_PATTERN))
					{
						uiDataGlobal.QuickMenu.tmpDmrCcTsFilterLevel &= ~DMR_TS_FILTER_PATTERN;
					}
					break;
			}

			if (executingQuickKey) // Instantly apply new setting
			{
				goto quickKeyApply;
			}
		}
		else if ((ev->keys.event & KEY_MOD_PRESS) && (menuDataGlobal.menuOptionsTimeout > 0))
		{
			menuDataGlobal.menuOptionsTimeout = 0;
			menuSystemPopPreviousMenu();
			return;
		}
	}

	if ((ev->events & KEY_EVENT) && (menuDataGlobal.menuOptionsSetQuickkey != 0) && (menuDataGlobal.menuOptionsTimeout == 0))
	{
		if (KEYCHECK_SHORTUP(ev->keys, KEY_RED))
		{
			menuDataGlobal.menuOptionsSetQuickkey = 0;
			menuDataGlobal.menuOptionsTimeout = 0;
			menuQuickChannelExitStatus |= MENU_STATUS_ERROR;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_GREEN))
		{
			saveQuickkeyMenuIndex(menuDataGlobal.menuOptionsSetQuickkey, menuSystemGetCurrentMenuNumber(), menuDataGlobal.currentItemIndex, 0);
			menuDataGlobal.menuOptionsSetQuickkey = 0;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_LEFT))
		{
			saveQuickkeyMenuIndex(menuDataGlobal.menuOptionsSetQuickkey, menuSystemGetCurrentMenuNumber(), menuDataGlobal.currentItemIndex, FUNC_LEFT);
			menuDataGlobal.menuOptionsSetQuickkey = 0;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_RIGHT))
		{
			saveQuickkeyMenuIndex(menuDataGlobal.menuOptionsSetQuickkey, menuSystemGetCurrentMenuNumber(), menuDataGlobal.currentItemIndex, FUNC_RIGHT);
			menuDataGlobal.menuOptionsSetQuickkey = 0;
		}
		isDirty = true;
	}

	if (isDirty)
	{
		updateQuickMenuScreen(false);
	}
}

//Scan Mode
static void scanStart(bool longPressBeep)
{
	// At least two channels are needed to run a scan process.
	if (canCurrentZoneBeScanned(&uiDataGlobal.Scan.availableChannelsCount) == false)
	{
		menuChannelExitStatus |= MENU_STATUS_ERROR;
		return;
	}

	if (voicePromptsIsPlaying())
	{
		voicePromptsTerminate();
	}

	directChannelNumber = 0;
	uiDataGlobal.Scan.direction = 1;

	// Clear all nuisance delete channels at start of scanning
	for (int i = 0; i < MAX_ZONE_SCAN_NUISANCE_CHANNELS; i++)
	{
		uiDataGlobal.Scan.nuisanceDelete[i] = -1;
	}
	uiDataGlobal.Scan.nuisanceDeleteIndex = 0;

	uiDataGlobal.Scan.active = true;
	uiDataGlobal.Scan.state = SCAN_SCANNING;
	uiDataGlobal.Scan.lastIteration = false;

	uiDataGlobal.Scan.stepTimeMilliseconds = settingsGetScanStepTimeMilliseconds();

	// In DIGITAL mode, we need at least 120ms to see the HR-C6000 to start the TS ISR.
	if (trxGetMode() == RADIO_MODE_DIGITAL)
	{
		int dwellTime;
		if(uiDataGlobal.Scan.stepTimeMilliseconds > 150)				// if >150ms use DMR Slow mode
		{
			dwellTime = ((trxDMRModeRx == DMR_MODE_DMO) ? SCAN_DMR_SIMPLEX_SLOW_MIN_DWELL_TIME : SCAN_DMR_DUPLEX_SLOW_MIN_DWELL_TIME);
		}
		else
		{
			dwellTime = ((trxDMRModeRx == DMR_MODE_DMO) ? SCAN_DMR_SIMPLEX_FAST_MIN_DWELL_TIME : SCAN_DMR_DUPLEX_FAST_MIN_DWELL_TIME);
		}

		uiDataGlobal.Scan.dwellTime = ((uiDataGlobal.Scan.stepTimeMilliseconds < dwellTime) ? dwellTime : uiDataGlobal.Scan.stepTimeMilliseconds);
	}
	else
	{
		uiDataGlobal.Scan.dwellTime = uiDataGlobal.Scan.stepTimeMilliseconds;
	}

	uiDataGlobal.Scan.timer.timeout = uiDataGlobal.Scan.dwellTime;
	uiDataGlobal.Scan.scanType = SCAN_TYPE_NORMAL_STEP;

	// Need to set the melody here, otherwise long press will remain silent
	// since beeps aren't allowed while scanning
	if (longPressBeep)
	{
		soundSetMelody(MELODY_KEY_LONG_BEEP);
	}

	// Set current channel index
	if (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
	{
		scanNextChannelIndex = nonVolatileSettings.currentChannelIndexInAllZone;
	}
	else
	{
		scanNextChannelIndex = currentZone.channels[nonVolatileSettings.currentChannelIndexInZone];
	}

	scanNextChannelReady = false;
}

static void updateTrxID(void)
{
	if (nonVolatileSettings.overrideTG != 0)
	{
		trxTalkGroupOrPcId = nonVolatileSettings.overrideTG;
	}
	else
	{
		/*
		 * VK3KYY
		 * I can't see a compelling reason to remove the TS override when changing TG
		 * The function trxUpdateTsForCurrentChannelWithSpecifiedContact(), used below, is used to handle the TS
		 *
			tsSetManualOverride(CHANNEL_CHANNEL, TS_NO_OVERRIDE);
		*/
		if ((currentRxGroupData.name[0] != 0) && (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup))
		{
			codeplugContactGetDataForIndex(currentRxGroupData.contacts[nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE]], &currentContactData);
		}
		else
		{
			codeplugContactGetDataForIndex(currentChannelData->contact, &currentContactData);
		}

		tsSetContactHasBeenOverriden(CHANNEL_CHANNEL, false);

		trxUpdateTsForCurrentChannelWithSpecifiedContact(&currentContactData);
		trxTalkGroupOrPcId = codeplugContactGetPackedId(&currentContactData);
	}
	lastHeardClearLastID();
	menuPrivateCallClear();
}

static void scanning(void)
{
	// After initial settling time
	if((uiDataGlobal.Scan.state == SCAN_SCANNING) && (uiDataGlobal.Scan.timer.timeout > SCAN_SKIP_CHANNEL_INTERVAL) && (uiDataGlobal.Scan.timer.timeout < (uiDataGlobal.Scan.dwellTime - SCAN_FREQ_CHANGE_SETTLING_INTERVAL)))
	{
		//Signal detect for DMR channels
		if (trxGetMode() == RADIO_MODE_DIGITAL)
		{
			if(uiDataGlobal.Scan.stepTimeMilliseconds > 150)  // if >150ms use DMR Slow mode
			{                                                 // DMR Scan Slow mode for signal detect
				if (((nonVolatileSettings.dmrCcTsFilter & DMR_TS_FILTER_PATTERN)
						&&
						((slotState != DMR_STATE_IDLE) && ((dmrMonitorCapturedTS != -1) &&
								(((trxDMRModeRx == DMR_MODE_DMO) && (dmrMonitorCapturedTS == trxGetDMRTimeSlot())) ||
										(trxDMRModeRx == DMR_MODE_RMO)))))
						||
						// As soon as the HRC6000 get sync, timeCode != -1 or TS ISR is running
						HRC6000HasGotSync())
				{
					uiDataGlobal.Scan.state = SCAN_SHORT_PAUSED;
#if defined(PLATFORM_MD9600)
					uiDataGlobal.Scan.clickDiscriminator = CLICK_DISCRIMINATOR;
#endif

#if ! defined(PLATFORM_GD77S) // GD77S handle voice prompts on its own
					// Reload the channel as voice prompts aren't set while scanning
					if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
					{
						loadChannelData(false, true);
					}
#endif
					uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // Force screen refresh
					uiDataGlobal.Scan.timer.timeout = ((TIMESLOT_DURATION * 12) + TIMESLOT_DURATION) * 4; // (1 superframe + 1 TS) * 4 = TS Sync + incoming audio
				}
			}
			else //DMR Scan fast mode signal detect
			{
				if(trxCarrierDetected())
				{
#if ! defined(PLATFORM_GD77S) // GD77S handle voice prompts on its own
					// Reload the channel as voice prompts aren't set while scanning
					if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
					{
						loadChannelData(false, true);
					}
#endif
					uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // Force screen refresh

					if (((nonVolatileSettings.dmrCcTsFilter & DMR_TS_FILTER_PATTERN) == 0))
					{
						uiDataGlobal.Scan.timer.timeout = SCAN_SHORT_PAUSE_TIME * 2;	//needs longer delay if in DMR mode and TS Filter is off to allow full detection of signal
					}
					else
					{
						uiDataGlobal.Scan.timer.timeout = SCAN_SHORT_PAUSE_TIME;	//start short delay to allow full detection of signal
					}

					uiDataGlobal.Scan.state = SCAN_SHORT_PAUSED;		//state 1 = pause and test for valid signal that produces audio
#if defined(PLATFORM_MD9600)
					uiDataGlobal.Scan.clickDiscriminator = CLICK_DISCRIMINATOR;
#endif
				}
			}
		}
		else //Signal Detect for FM channels
		{
			if(trxCarrierDetected())
			{
#if ! defined(PLATFORM_GD77S) // GD77S handle voice prompts on its own
				// Reload the channel as voice prompts aren't set while scanning
				if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
				{
					loadChannelData(false, true);
				}
#endif
				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // Force screen refresh

				uiDataGlobal.Scan.timer.timeout = SCAN_SHORT_PAUSE_TIME;	//start short delay to allow full detection of signal
				uiDataGlobal.Scan.state = SCAN_SHORT_PAUSED;		//state 1 = pause and test for valid signal that produces audio
#if defined(PLATFORM_MD9600)
				uiDataGlobal.Scan.clickDiscriminator = CLICK_DISCRIMINATOR;
#endif
			}
		}
	}

	// Only do this once if scan mode is PAUSE do it every time if scan mode is HOLD
	if(((uiDataGlobal.Scan.state == SCAN_PAUSED) && (nonVolatileSettings.scanModePause == SCAN_MODE_HOLD)) || (uiDataGlobal.Scan.state == SCAN_SHORT_PAUSED))
	{
#if defined(PLATFORM_MD9600)
		if (uiDataGlobal.Scan.clickDiscriminator > 0)
		{
			uiDataGlobal.Scan.clickDiscriminator--;
		}
		else
		{
#endif
			if (getAudioAmpStatus() & AUDIO_AMP_MODE_RF)
			{
				if (nonVolatileSettings.scanModePause == SCAN_MODE_STOP)
				{
					uiChannelModeStopScanning();
					return;
				}
				else
				{
					uiDataGlobal.Scan.timer.timeout = nonVolatileSettings.scanDelay * 1000;
					uiDataGlobal.Scan.state = SCAN_PAUSED;
				}
			}
#if defined(PLATFORM_MD9600)
		}
#endif
	}

	if(uiDataGlobal.Scan.timer.timeout > 0)
	{
		if (scanNextChannelReady == false)
		{
			scanSearchForNextChannel();
		}

		uiDataGlobal.Scan.timer.timeout--;
	}
	else
	{
		if (scanNextChannelReady)
		{
			scanApplyNextChannel();

			// When less than 2 channel remain in the Zone
			if (uiDataGlobal.Scan.lastIteration)
			{
				scanStop(false);
				return;
			}
		}

		uiDataGlobal.Scan.state = SCAN_SCANNING;													//state 0 = settling and test for carrier present.
	}
}

static void scanStop(bool loadChannel)
{
	int prevTS = dmrMonitorCapturedTS; // Always -1 on Simplex
	bool wasRXingDigital = ((trxGetMode() == RADIO_MODE_DIGITAL) && (slotState != DMR_STATE_IDLE) && (prevTS != -1));

	uiChannelModeStopScanning();
	uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
	uiChannelModeUpdateScreen(0);

	// It loads the channel data when exiting scan mode (as it was partialy readed)
	if (loadChannel)
	{
		loadChannelData(false, true);
	}

	// We were receiving something in Digital (Duplex), but since the TS filtering is OFF, we
	// will double check if selected TS stills match the previous one, when scan was paused.
	if (wasRXingDigital && ((nonVolatileSettings.dmrCcTsFilter & DMR_TS_FILTER_PATTERN) == 0))
	{
		int retries = 120;

		// Wait a bit until the TS is detected
		watchdogRun(false); // Temporary disable the watchdog here, as it could take too much time for it.
		do
		{
			vTaskDelay((10 / portTICK_PERIOD_MS));
		}
		while ((dmrMonitorCapturedTS == -1) && (retries-- > 0));
		watchdogRun(true);

		// Okay, we can now toggle the TS, if required
		if (((dmrMonitorCapturedTS != -1) && (prevTS != -1)) && (prevTS != dmrMonitorCapturedTS))
		{
			trxSetDMRTimeSlot(trxGetDMRTimeSlot(), true);
		}
	}
}

void uiChannelModeStopScanning(void)
{
	uiDataGlobal.Scan.active = false;
	uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN; // Force screen refresh

#if ! defined(PLATFORM_GD77S) // GD77S handle voice prompts on its own
	// Reload the channel as voice prompts aren't set while scanning
	if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
	{
		loadChannelData(false, true);
	}
#endif
}

bool uiChannelModeIsScanning(void)
{
	return uiDataGlobal.Scan.active;
}

void uiChannelModeColdStart(void)
{
	currentChannelData->rxFreq = 0;	// Force to re-read codeplug data (needed due to "All Channels" translation)
}

// This can also be called from the VFO, on VFO -> New Channel, as currentZone could be uninitialized.
void uiChannelInitializeCurrentZone(void)
{
	codeplugZoneGetDataForNumber(nonVolatileSettings.currentZone, &currentZone);
	codeplugUtilConvertBufToString(currentZone.name, currentZoneName, 16);// need to convert to zero terminated string
}

#if defined(PLATFORM_GD77S)
bool uiChannelModeTransmitDTMFContactForGD77S(void)
{
	if (GD77SParameters.uiMode == GD77S_UIMODE_DTMF_CONTACTS)
	{
		if (GD77SParameters.dtmfListCount > 0)
		{
			// start dtmf sequence
			if(dtmfSequenceIsKeying() == false)
			{
				struct_codeplugDTMFContact_t dtmfContact;

				if (voicePromptsIsPlaying())
				{
					voicePromptsTerminate();
				}

				codeplugDTMFContactGetDataForNumber(GD77SParameters.dtmfListSelected + 1, &dtmfContact);
				dtmfSequencePrepare(dtmfContact.code, true);
			}
			else
			{
				dtmfSequenceStop();
				dtmfSequenceTick(false);
				dtmfSequenceReset();
			}
		}
		else
		{
			voicePromptsInit();
			voicePromptsAppendLanguageString(&currentLanguage->empty_list);
			voicePromptsPlay();
		}

		return true;
	}

	return false;
}

void toggleTimeslotForGD77S(void)
{
	if (trxGetMode() == RADIO_MODE_DIGITAL)
	{
		// Toggle timeslot
		trxSetDMRTimeSlot(1 - trxGetDMRTimeSlot(), true);
		tsSetManualOverride(CHANNEL_CHANNEL, (trxGetDMRTimeSlot() + 1));

		disableAudioAmp(AUDIO_AMP_MODE_RF);
		HRC6000ClearActiveDMRID();
		lastHeardClearLastID();
		uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
		uiChannelModeUpdateScreen(0);
	}
}

void uiChannelModeHeartBeatActivityForGD77S(uiEvent_t *ev)
{
	static const uint32_t periods[] = { 6000, 100, 100, 100, 100, 100 };
	static const uint32_t periodsScan[] = { 2000, 50, 2000, 50, 2000, 50 };
	static uint8_t        beatRoll = 0;
	static uint32_t       mTime = 0;

	// <paranoid_mode>
	//   We use real time GPIO readouts, as LED could be turned on/off by another task.
	// </paranoid_mode>
	if ((LedRead(LED_RED) || LedRead(LED_GREEN)) // Any led is ON
			&& (trxTransmissionEnabled || (uiDataGlobal.DTMFContactList.isKeying) || (ev->buttons & BUTTON_PTT) || (getAudioAmpStatus() & (AUDIO_AMP_MODE_RF | AUDIO_AMP_MODE_BEEP | AUDIO_AMP_MODE_PROMPT)) || trxCarrierDetected() || ev->hasEvent)) // we're transmitting, or receiving, or user interaction.
	{
		// Turn off the red LED, if not transmitting
		if (LedRead(LED_RED) // Red is ON
				&& ((uiDataGlobal.DTMFContactList.isKeying == false) && ((trxTransmissionEnabled == false) || ((ev->buttons & BUTTON_PTT) == 0)))) // No TX
		{
			if ((rxPowerSavingIsRxOn() == false) && (ev->hasEvent == false))
			{
				rxPowerSavingSetState(ECOPHASE_POWERSAVE_INACTIVE);
			}

			LedWrite(LED_RED, 0);
		}

		// Turn off the green LED, if not receiving, or no AF output
		if (LedRead(LED_GREEN)) // Green is ON
		{
			if ((trxTransmissionEnabled || (uiDataGlobal.DTMFContactList.isKeying) || (ev->buttons & BUTTON_PTT))
					|| ((trxGetMode() == RADIO_MODE_DIGITAL) && (slotState != DMR_STATE_IDLE))
					|| (((getAudioAmpStatus() & (AUDIO_AMP_MODE_RF | AUDIO_AMP_MODE_BEEP | AUDIO_AMP_MODE_PROMPT)) != 0) || trxCarrierDetected()))
			{
				if ((ev->buttons & BUTTON_PTT) && (trxTransmissionEnabled == false)) // RX Only or Out of Band
				{
					if ((rxPowerSavingIsRxOn() == false) && (ev->hasEvent == false))
					{
						rxPowerSavingSetState(ECOPHASE_POWERSAVE_INACTIVE);
					}

					LedWrite(LED_GREEN, 0);
				}
			}
			else
			{
				if ((rxPowerSavingIsRxOn() == false) && (ev->hasEvent == false))
				{
					rxPowerSavingSetState(ECOPHASE_POWERSAVE_INACTIVE);
				}

				LedWrite(LED_GREEN, 0);
			}
		}

		// Reset pattern sequence
		beatRoll = 0;
		// And update the timer for the next first starting (OFF for 5 seconds) blink sequence.
		mTime = ev->time;
		return;
	}

	if (!rxPowerSavingIsRxOn())
	{
		return;
	}

	// Nothing is happening, blink
	if (((trxTransmissionEnabled == false) && (uiDataGlobal.DTMFContactList.isKeying == false) && ((ev->buttons & BUTTON_PTT) == 0))
			&& ((ev->hasEvent == false) && ((getAudioAmpStatus() & (AUDIO_AMP_MODE_RF | AUDIO_AMP_MODE_BEEP | AUDIO_AMP_MODE_PROMPT)) == 0) && (trxCarrierDetected() == false)))
	{
		// Blink both LEDs to have Orange color
		if ((ev->time - mTime) > (uiDataGlobal.Scan.active ? periodsScan[beatRoll] : periods[beatRoll]))
		{
			if ((nonVolatileSettings.ecoLevel > 0) && (ev->hasEvent == false))
			{
				rxPowerSavingSetState(ECOPHASE_POWERSAVE_INACTIVE);
			}

			mTime = ev->time;
			beatRoll = (beatRoll + 1) % (uiDataGlobal.Scan.active ? (sizeof(periodsScan) / sizeof(periodsScan[0])) : (sizeof(periods) / sizeof(periods[0])));
			LedWrite(LED_RED, (beatRoll % 2));
			LedWrite(LED_GREEN, (beatRoll % 2));
		}
	}
	else
	{
		// Reset pattern sequence
		beatRoll = 0;
		// And update the timer for the next first starting (OFF for 5 seconds) blink sequence.
		mTime = ev->time;
	}
}

static uint16_t getCurrentChannelInCurrentZoneForGD77S(void)
{
	return (CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone) ? nonVolatileSettings.currentChannelIndexInAllZone : nonVolatileSettings.currentChannelIndexInZone + 1);
}

static void checkAndUpdateSelectedChannelForGD77S(uint16_t chanNum, bool forceSpeech)
{
	bool updateDisplay = false;

	if(CODEPLUG_ZONE_IS_ALLCHANNELS(currentZone))
	{
		GD77SParameters.channelOutOfBounds = false;
		if (codeplugAllChannelsIndexIsInUse(chanNum))
		{
			if (chanNum != nonVolatileSettings.currentChannelIndexInAllZone)
			{
				settingsSet(nonVolatileSettings.currentChannelIndexInAllZone, (int16_t) chanNum);
				loadChannelData(false, false);
				updateDisplay = true;
			}
		}
		else
		{
			GD77SParameters.channelOutOfBounds = true;
			voicePromptsInit();
			voicePromptsAppendPrompt(PROMPT_CHANNEL);
			voicePromptsAppendLanguageString(&currentLanguage->error);
			voicePromptsPlay();
		}
	}
	else
	{
		if ((chanNum - 1) < currentZone.NOT_IN_CODEPLUGDATA_numChannelsInZone)
		{
			GD77SParameters.channelOutOfBounds = false;
			if ((chanNum - 1) != nonVolatileSettings.currentChannelIndexInZone)
			{
				settingsSet(nonVolatileSettings.currentChannelIndexInZone, (int16_t) (chanNum - 1));
				loadChannelData(false, false);
				updateDisplay = true;
			}
		}
		else
		{
			GD77SParameters.channelOutOfBounds = true;
			voicePromptsInit();
			voicePromptsAppendPrompt(PROMPT_CHANNEL);
			voicePromptsAppendLanguageString(&currentLanguage->error);
			voicePromptsPlay();
		}
	}

	// Prevent TXing while an invalid channel is selected
	if (getCurrentChannelInCurrentZoneForGD77S() != chanNum)
	{
		PTTLocked = true;
	}
	else
	{
		if (PTTLocked)
		{
			PTTLocked = false;
			forceSpeech = true;
		}
	}

	if (updateDisplay || forceSpeech)
	{
		// Remove TS override when a new channel is selected, otherwise it will be set until the zone is changed.
		if (updateDisplay && (tsGetManualOverride(CHANNEL_CHANNEL) != 0))
		{
			tsSetManualOverride(CHANNEL_CHANNEL, TS_NO_OVERRIDE);
		}

		if (GD77SParameters.channelOutOfBounds == false)
		{
			char buf[17];

			voicePromptsInit();
			voicePromptsAppendPrompt(PROMPT_CHANNEL);
			voicePromptsAppendInteger(chanNum);
			voicePromptsAppendPrompt(PROMPT_SILENCE);
			codeplugUtilConvertBufToString(currentChannelData->name, buf, 16);
			voicePromptsAppendString(buf);
			voicePromptsPlay();
		}

		if (!forceSpeech)
		{
			uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
			uiChannelModeUpdateScreen(0);
		}
	}
}

static void buildSpeechChannelDetailsForGD77S()
{
	char buf[17];

	codeplugUtilConvertBufToString(currentChannelData->name, buf, 16);
	voicePromptsAppendString(buf);

	voicePromptsAppendPrompt(PROMPT_SILENCE);
	announceFrequency();
	voicePromptsAppendPrompt(PROMPT_SILENCE);

	if (trxGetMode() == RADIO_MODE_DIGITAL)
	{
		announceContactNameTgOrPc(voicePromptsIsPlaying());
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		announceTS();
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		announceCC();
	}
	else
	{
		CodeplugCSSTypes_t type = codeplugGetCSSType(currentChannelData->rxTone);
		if ((type & CSS_TYPE_NONE) == 0)
		{
			buildCSSCodeVoicePrompts(currentChannelData->rxTone, type, DIRECTION_RECEIVE, true);
			voicePromptsAppendPrompt(PROMPT_SILENCE);
		}

		type = codeplugGetCSSType(currentChannelData->txTone);
		if ((type & CSS_TYPE_NONE) == 0)
		{
			buildCSSCodeVoicePrompts(currentChannelData->txTone, type, DIRECTION_TRANSMIT, true);
		}
	}
}

static void buildSpeechUiModeForGD77S(GD77S_UIMODES_t uiMode)
{
	char buf[17];

	if (voicePromptsIsPlaying())
	{
		voicePromptsTerminate();
	}

	switch (uiMode)
	{
		case GD77S_UIMODE_TG_OR_SQUELCH: // Channel
			codeplugUtilConvertBufToString(currentChannelData->name, buf, 16);
			voicePromptsAppendString(buf);

			if (trxGetMode() == RADIO_MODE_DIGITAL)
			{
				announceTS();
			}
			else
			{
				announceSquelchLevel(voicePromptsIsPlaying());
			}
			break;

		case GD77S_UIMODE_SCAN: // Scan
			voicePromptsAppendLanguageString(&currentLanguage->scan);
			voicePromptsAppendLanguageString(uiDataGlobal.Scan.active ? &currentLanguage->on : &currentLanguage->off);
			break;

		case GD77S_UIMODE_TS: // Timeslot
			if (trxGetMode() == RADIO_MODE_DIGITAL)
			{
				announceTS();
			}
			break;

		case GD77S_UIMODE_CC: // Color code
			if (trxGetMode() == RADIO_MODE_DIGITAL)
			{
				announceCC();
			}
			break;

		case GD77S_UIMODE_FILTER: // DMR/Analog filter
			voicePromptsAppendLanguageString(&currentLanguage->filter);
			if (trxGetMode() == RADIO_MODE_DIGITAL)
			{
				if (nonVolatileSettings.dmrDestinationFilter == DMR_DESTINATION_FILTER_NONE)
				{
					voicePromptsAppendLanguageString(&currentLanguage->none);
				}
				else
				{
					voicePromptsAppendString((char *)DMR_DESTINATION_FILTER_LEVELS[nonVolatileSettings.dmrDestinationFilter - 1]);
				}

			}
			else
			{
				if (nonVolatileSettings.analogFilterLevel == ANALOG_FILTER_NONE)
				{
					voicePromptsAppendLanguageString(&currentLanguage->none);
				}
				else
				{
					voicePromptsAppendString((char *)ANALOG_FILTER_LEVELS[nonVolatileSettings.analogFilterLevel - 1]);
				}
			}
			break;

		case GD77S_UIMODE_DTMF_CONTACTS:
			if (GD77SParameters.dtmfListCount > 0)
			{
				struct_codeplugDTMFContact_t dtmfContact;

				codeplugDTMFContactGetDataForNumber(GD77SParameters.dtmfListSelected + 1, &dtmfContact);
				codeplugUtilConvertBufToString(dtmfContact.name, buf, 16);
				voicePromptsAppendString(buf);
			}
			else
			{
				voicePromptsAppendLanguageString(&currentLanguage->empty_list);
			}
			break;

		case GD77S_UIMODE_ZONE: // Zone
			announceZoneName(voicePromptsIsPlaying());
			break;

		case GD77S_UIMODE_POWER: // Power
			announcePowerLevel(voicePromptsIsPlaying());
			break;

		case GD77S_UIMODE_ECO:
			announceEcoLevel(voicePromptsIsPlaying());
			break;

		case GD77S_UIMODE_MAX:
			break;
	}
}

static void handleEventForGD77S(uiEvent_t *ev)
{
	if (ev->events & ROTARY_EVENT)
	{
		if (dtmfSequenceIsKeying())
		{
			dtmfSequenceStop();
		}

		if (!trxTransmissionEnabled && (ev->rotary > 0))
		{
			if (uiDataGlobal.Scan.active)
			{
				scanStop(false);
			}

			settingsSet(nonVolatileSettings.overrideTG, 0);
			checkAndUpdateSelectedChannelForGD77S(ev->rotary, false);
			HRC6000ClearActiveDMRID();
			lastHeardClearLastID();
		}
	}

	if (handleMonitorMode(ev))
	{
		return;
	}

	if (ev->events & BUTTON_EVENT)
	{
		if (dtmfSequenceIsKeying() && (ev->buttons & (BUTTON_SK1 | BUTTON_SK2 | BUTTON_ORANGE)))
		{
			dtmfSequenceStop();
		}

		if (BUTTONCHECK_SHORTUP(ev, BUTTON_ORANGE) && uiDataGlobal.Scan.active)
		{
			scanStop(false);

			voicePromptsInit();
			buildSpeechUiModeForGD77S(GD77S_UIMODE_SCAN);
			voicePromptsPlay();
			return;
		}

		if (BUTTONCHECK_LONGDOWN(ev, BUTTON_ORANGE) && (uiDataGlobal.DTMFContactList.isKeying == false))
		{
			announceItem(PROMPT_SEQUENCE_BATTERY, PROMPT_THRESHOLD_3);
			return;
		}
		else if (BUTTONCHECK_SHORTUP(ev, BUTTON_ORANGE) && (uiDataGlobal.DTMFContactList.isKeying == false))
		{
			voicePrompt_t vp = NUM_VOICE_PROMPTS;
			char * const *vpString = NULL;

			GD77SParameters.uiMode = (GD77S_UIMODES_t) (GD77SParameters.uiMode + 1) % GD77S_UIMODE_MAX;

			//skip over Digital controls if the radio is in Analog mode
			if (trxGetMode() == RADIO_MODE_ANALOG)
			{
				// Analog
				if ((GD77SParameters.uiMode == GD77S_UIMODE_TS) ||
					(GD77SParameters.uiMode == GD77S_UIMODE_CC))
				{
					GD77SParameters.uiMode = GD77S_UIMODE_FILTER;
				}
			}
			else
			{
				// digital
				if (GD77SParameters.uiMode == GD77S_UIMODE_DTMF_CONTACTS)
				{
					GD77SParameters.uiMode = GD77S_UIMODE_ZONE;
				}
			}

			switch (GD77SParameters.uiMode)
			{
				case GD77S_UIMODE_TG_OR_SQUELCH: // Channel Mode
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						vp = PROMPT_CHANNEL_MODE;
					}
					else
					{
						vpString = (char * const *)&currentLanguage->squelch;
					}
					break;

				case GD77S_UIMODE_SCAN:
					vp = PROMPT_SCAN_MODE;
					break;

				case GD77S_UIMODE_TS: // Timeslot Mode
					vp = PROMPT_TIMESLOT_MODE;
					break;

				case GD77S_UIMODE_CC: // ColorCode Mode
					vp = PROMPT_COLORCODE_MODE;
					break;

				case GD77S_UIMODE_FILTER: // DMR/Analog Filter
					vp = PROMPT_FILTER_MODE;
					break;

				case GD77S_UIMODE_DTMF_CONTACTS:
					vpString = (char * const *)&currentLanguage->dtmf_contact_list;
					break;

				case GD77S_UIMODE_ZONE: // Zone Mode
					vp = PROMPT_ZONE_MODE;
					break;

				case GD77S_UIMODE_POWER: // Power Mode
					vp = PROMPT_POWER_MODE;
					break;

				case GD77S_UIMODE_ECO:
					vp = PROMPT_ECO_MODE;
					break;

				case GD77S_UIMODE_MAX:
					break;
			}

			if ((vp != NUM_VOICE_PROMPTS) || (vpString != NULL))
			{
				voicePromptsInit();
				if (vpString)
				{
					voicePromptsAppendLanguageString((const char * const *)vpString);
					voicePromptsAppendPrompt(PROMPT_MODE);
				}
				else
				{
					voicePromptsAppendPrompt(vp);
				}
				voicePromptsAppendPrompt(PROMPT_SILENCE);
				buildSpeechUiModeForGD77S(GD77SParameters.uiMode);
				voicePromptsPlay();
			}
		}
		else if (BUTTONCHECK_LONGDOWN(ev, BUTTON_SK1) && (monitorModeData.isEnabled == false) && (uiDataGlobal.DTMFContactList.isKeying == false))
		{
			if (GD77SParameters.channelOutOfBounds == false)
			{
				voicePromptsInit();
				buildSpeechChannelDetailsForGD77S();
				voicePromptsPlay();
			}
		}
		else if (BUTTONCHECK_SHORTUP(ev, BUTTON_SK1) && (uiDataGlobal.DTMFContactList.isKeying == false))
		{
			switch (GD77SParameters.uiMode)
			{
				case GD77S_UIMODE_TG_OR_SQUELCH:
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						// Next in TGList
						if (nonVolatileSettings.overrideTG == 0)
						{
							settingsIncrement(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 1);
							if (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] > (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1))
							{
								settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 0);
							}
						}
						settingsSet(nonVolatileSettings.overrideTG, 0);// setting the override TG to 0 indicates the TG is not overridden
						menuPrivateCallClear();
						updateTrxID();
						uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
						uiChannelModeUpdateScreen(0);
						announceItem(PROMPT_SEQUENCE_CONTACT_TG_OR_PC, PROMPT_THRESHOLD_3);
					}
					else
					{
						if(currentChannelData->sql == 0)			//If we were using default squelch level
						{
							currentChannelData->sql = nonVolatileSettings.squelchDefaults[trxCurrentBand[TRX_RX_FREQ_BAND]];			//start the adjustment from that point.
						}

						if (currentChannelData->sql < CODEPLUG_MAX_VARIABLE_SQUELCH)
						{
							currentChannelData->sql++;
						}

						announceItem(PROMPT_SQUENCE_SQUELCH, PROMPT_THRESHOLD_3);
					}
					break;

				case GD77S_UIMODE_SCAN:
					if (uiDataGlobal.Scan.active)
					{
						scanStop(false);
					}
					else
					{
						scanStart(false);
					}

					voicePromptsInit();
					voicePromptsAppendLanguageString(&currentLanguage->scan);
					voicePromptsAppendLanguageString(uiDataGlobal.Scan.active ? &currentLanguage->on : &currentLanguage->off);
					voicePromptsPlay();
					break;

				case GD77S_UIMODE_TS:
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						toggleTimeslotForGD77S();
						announceItem(PROMPT_SEQUENCE_TS, PROMPT_THRESHOLD_3);
					}
					break;

				case GD77S_UIMODE_CC:
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						if (currentChannelData->rxColor < 15)
						{
							currentChannelData->rxColor++;
							trxSetDMRColourCode(currentChannelData->rxColor);
						}

						voicePromptsInit();
						announceCC();
						voicePromptsPlay();
					}
					break;

				case GD77S_UIMODE_FILTER:
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						if (nonVolatileSettings.dmrDestinationFilter < NUM_DMR_DESTINATION_FILTER_LEVELS - 1)
						{
							settingsIncrement(nonVolatileSettings.dmrDestinationFilter, 1);
							HRC6000InitDigitalDmrRx();
							disableAudioAmp(AUDIO_AMP_MODE_RF);
						}
					}
					else
					{
						if (nonVolatileSettings.analogFilterLevel < NUM_ANALOG_FILTER_LEVELS - 1)
						{
							settingsIncrement(nonVolatileSettings.analogFilterLevel, 1);
							trxSetAnalogFilterLevel(nonVolatileSettings.analogFilterLevel);
						}
					}

					voicePromptsInit();
					buildSpeechUiModeForGD77S(GD77SParameters.uiMode);
					voicePromptsPlay();
					break;

				case GD77S_UIMODE_DTMF_CONTACTS:
					// select next DTMF contact and spell it
					if (GD77SParameters.dtmfListCount > 0)
					{
						GD77SParameters.dtmfListSelected = (GD77SParameters.dtmfListSelected + 1) % GD77SParameters.dtmfListCount;
					}
					voicePromptsInit();
					buildSpeechUiModeForGD77S(GD77SParameters.uiMode);
					voicePromptsPlay();
					break;

				case GD77S_UIMODE_ZONE: // Zones
					// No "All Channels" on GD77S
					nonVolatileSettings.currentZone = (nonVolatileSettings.currentZone + 1) % (codeplugZonesGetCount() - 1);

					settingsSet(nonVolatileSettings.overrideTG, 0); // remove any TG override
					tsSetManualOverride(CHANNEL_CHANNEL, TS_NO_OVERRIDE);
					settingsSet(nonVolatileSettings.currentChannelIndexInZone, (int16_t) -2); // Will be updated when reloading the UiChannelMode screen
					currentChannelData->rxFreq = 0x00; // Flag to the Channel screen that the channel data is now invalid and needs to be reloaded

					menuSystemPopAllAndDisplaySpecificRootMenu(UI_CHANNEL_MODE, true);
					checkAndUpdateSelectedChannelForGD77S(rotarySwitchGetPosition(), false);
					GD77SParameters.uiMode = GD77S_UIMODE_ZONE;

					announceItem(PROMPT_SEQUENCE_ZONE, PROMPT_THRESHOLD_3);
					break;

				case GD77S_UIMODE_POWER: // Power
					increasePowerLevel(true);// true = Allow 5W++
					break;

				case GD77S_UIMODE_ECO:
					if (nonVolatileSettings.ecoLevel < ECO_LEVEL_MAX)
					{
						settingsIncrement(nonVolatileSettings.ecoLevel, 1);
						rxPowerSavingSetLevel(nonVolatileSettings.ecoLevel);
					}
					voicePromptsInit();
					buildSpeechUiModeForGD77S(GD77SParameters.uiMode);
					voicePromptsPlay();
					break;

				case GD77S_UIMODE_MAX:
					break;
			}
		}
		else if (BUTTONCHECK_LONGDOWN(ev, BUTTON_SK2) && (monitorModeData.isEnabled == false) && (uiDataGlobal.DTMFContactList.isKeying == false))
		{
			uint32_t tg = (LinkHead->talkGroupOrPcId & 0xFFFFFF);

			// If Blue button is long pressed during reception it sets the Tx TG to the incoming TG
			if (uiDataGlobal.isDisplayingQSOData && BUTTONCHECK_DOWN(ev, BUTTON_SK2) && (trxGetMode() == RADIO_MODE_DIGITAL) &&
					((trxTalkGroupOrPcId != tg) ||
							((dmrMonitorCapturedTS != -1) && (dmrMonitorCapturedTS != trxGetDMRTimeSlot())) ||
							(trxGetDMRColourCode() != currentChannelData->rxColor)))
			{
				lastHeardClearLastID();

				// Set TS to overriden TS
				if ((dmrMonitorCapturedTS != -1) && (dmrMonitorCapturedTS != trxGetDMRTimeSlot()))
				{
					trxSetDMRTimeSlot(dmrMonitorCapturedTS, true);
					tsSetManualOverride(CHANNEL_CHANNEL, (dmrMonitorCapturedTS + 1));
				}
				if (trxTalkGroupOrPcId != tg)
				{
					if ((tg >> 24) & PC_CALL_FLAG)
					{
						acceptPrivateCall(tg & 0xffffff, -1);
					}
					else
					{
						trxTalkGroupOrPcId = tg;
						settingsSet(nonVolatileSettings.overrideTG, trxTalkGroupOrPcId);
					}
				}

				currentChannelData->rxColor = trxGetDMRColourCode();// Set the CC to the current CC, which may have been determined by the CC finding algorithm in C6000.c

				uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
				uiChannelModeUpdateScreen(0);

				voicePromptsInit();
				voicePromptsAppendLanguageString(&currentLanguage->select_tx);
				voicePromptsPlay();
				return;
			}
		}
		else if (BUTTONCHECK_SHORTUP(ev, BUTTON_SK2) && (uiDataGlobal.DTMFContactList.isKeying == false))
		{
			switch (GD77SParameters.uiMode)
			{
				case GD77S_UIMODE_TG_OR_SQUELCH: // Previous in TGList
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						// To Do change TG in on same channel freq
						if (nonVolatileSettings.overrideTG == 0)
						{
							settingsDecrement(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], 1);
							if (nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE] < 0)
							{
								settingsSet(nonVolatileSettings.currentIndexInTRxGroupList[SETTINGS_CHANNEL_MODE], (int16_t) (currentRxGroupData.NOT_IN_CODEPLUG_numTGsInGroup - 1));
							}
						}
						settingsSet(nonVolatileSettings.overrideTG, 0);// setting the override TG to 0 indicates the TG is not overridden
						menuPrivateCallClear();
						updateTrxID();
						uiDataGlobal.displayQSOState = QSO_DISPLAY_DEFAULT_SCREEN;
						uiChannelModeUpdateScreen(0);
						announceItem(PROMPT_SEQUENCE_CONTACT_TG_OR_PC, PROMPT_THRESHOLD_3);
					}
					else
					{
						if(currentChannelData->sql == 0)			//If we were using default squelch level
						{
							currentChannelData->sql = nonVolatileSettings.squelchDefaults[trxCurrentBand[TRX_RX_FREQ_BAND]];			//start the adjustment from that point.
						}

						if (currentChannelData->sql > CODEPLUG_MIN_VARIABLE_SQUELCH)
						{
							currentChannelData->sql--;
						}

						announceItem(PROMPT_SQUENCE_SQUELCH, PROMPT_THRESHOLD_3);
					}
					break;

				case GD77S_UIMODE_SCAN:
					if (uiDataGlobal.Scan.active)
					{
						// if we are scanning and down key is pressed then enter current channel into nuisance delete array.
						if(uiDataGlobal.Scan.state == SCAN_PAUSED)
						{
							// There is two channels available in the Zone, just stop scanning
							if (uiDataGlobal.Scan.nuisanceDeleteIndex == (uiDataGlobal.Scan.availableChannelsCount - 2))
							{
								uiDataGlobal.Scan.lastIteration = true;
							}

							uiDataGlobal.Scan.nuisanceDelete[uiDataGlobal.Scan.nuisanceDeleteIndex] = uiDataGlobal.currentSelectedChannelNumber;
							uiDataGlobal.Scan.nuisanceDeleteIndex = (uiDataGlobal.Scan.nuisanceDeleteIndex + 1) % MAX_ZONE_SCAN_NUISANCE_CHANNELS;
							uiDataGlobal.Scan.timer.timeout = SCAN_SKIP_CHANNEL_INTERVAL;	//force scan to continue;
							uiDataGlobal.Scan.state = SCAN_SCANNING;
							return;
						}

						// Left key reverses the scan direction
						if (uiDataGlobal.Scan.state == SCAN_SCANNING)
						{
							uiDataGlobal.Scan.direction *= -1;
							return;
						}
					}
					break;

				case GD77S_UIMODE_TS:
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						toggleTimeslotForGD77S();
						announceItem(PROMPT_SEQUENCE_TS, PROMPT_THRESHOLD_3);
					}
					break;

				case GD77S_UIMODE_CC:
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						if (currentChannelData->rxColor > 0)
						{
							currentChannelData->rxColor--;
							trxSetDMRColourCode(currentChannelData->rxColor);
						}

						voicePromptsInit();
						announceCC();
						voicePromptsPlay();
					}
					break;

				case GD77S_UIMODE_FILTER:
					if (trxGetMode() == RADIO_MODE_DIGITAL)
					{
						if (nonVolatileSettings.dmrDestinationFilter > DMR_DESTINATION_FILTER_NONE)
						{
							settingsDecrement(nonVolatileSettings.dmrDestinationFilter, 1);
							HRC6000InitDigitalDmrRx();
							disableAudioAmp(AUDIO_AMP_MODE_RF);
						}
					}
					else
					{
						if (nonVolatileSettings.analogFilterLevel > ANALOG_FILTER_NONE)
						{
							settingsDecrement(nonVolatileSettings.analogFilterLevel, 1);
							trxSetAnalogFilterLevel(nonVolatileSettings.analogFilterLevel);
						}
					}

					voicePromptsInit();
					buildSpeechUiModeForGD77S(GD77SParameters.uiMode);
					voicePromptsPlay();
					break;

				case GD77S_UIMODE_DTMF_CONTACTS:
					// select previous DTMF contact and spell it
					if (GD77SParameters.dtmfListCount > 0)
					{
						GD77SParameters.dtmfListSelected = (GD77SParameters.dtmfListSelected + GD77SParameters.dtmfListCount - 1) % GD77SParameters.dtmfListCount;
					}
					voicePromptsInit();
					buildSpeechUiModeForGD77S(GD77SParameters.uiMode);
					voicePromptsPlay();
					break;

				case GD77S_UIMODE_ZONE: // Zones
					// No "All Channels" on GD77S
					nonVolatileSettings.currentZone = (nonVolatileSettings.currentZone + (codeplugZonesGetCount() - 1) - 1) % (codeplugZonesGetCount() - 1);

					settingsSet(nonVolatileSettings.overrideTG, 0); // remove any TG override
					tsSetManualOverride(CHANNEL_CHANNEL, TS_NO_OVERRIDE);
					settingsSet(nonVolatileSettings.currentChannelIndexInZone, (int16_t) -2); // Will be updated when reloading the UiChannelMode screen
					currentChannelData->rxFreq = 0x00; // Flag to the Channel screeen that the channel data is now invalid and needs to be reloaded

					menuSystemPopAllAndDisplaySpecificRootMenu(UI_CHANNEL_MODE, true);
					checkAndUpdateSelectedChannelForGD77S(rotarySwitchGetPosition(), false);
					GD77SParameters.uiMode = GD77S_UIMODE_ZONE;

					announceItem(PROMPT_SEQUENCE_ZONE, PROMPT_THRESHOLD_3);
					break;

				case GD77S_UIMODE_POWER: // Power
					decreasePowerLevel();
					break;

				case GD77S_UIMODE_ECO:
					if (nonVolatileSettings.ecoLevel > 0)
					{
						settingsDecrement(nonVolatileSettings.ecoLevel, 1);
						rxPowerSavingSetLevel(nonVolatileSettings.ecoLevel);
					}
					voicePromptsInit();
					buildSpeechUiModeForGD77S(GD77SParameters.uiMode);
					voicePromptsPlay();
					break;

				case GD77S_UIMODE_MAX:
					break;
			}
		}
	}
}
#endif // PLATFORM_GD77S
