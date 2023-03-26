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
#include "functions/settings.h"
#include "user_interface/menuSystem.h"
#include "user_interface/uiLocalisation.h"
#include "user_interface/uiUtilities.h"
#include "interfaces/wdog.h"
#include "utils.h"
#include "functions/rxPowerSaving.h"
#include "hardware/radioHardwareInterface.h"

static void updateScreen(bool isFirstRun);
static void handleEvent(uiEvent_t *ev);
void setRefOscTemp(uint8_t cal);
void setDACTemp(uint8_t cal);


static uint8_t freqIndex = 0;
static int calFreq[] = {13600000,14550000,15500000,16450000,17400000,40000000,41000000,42000000,43000000,44000000,45000000,46000000,47000000,48000000};
#define NO_OF_CAL_FREQS 14

static uint8_t powerIndex = 0;
static uint8_t calPower[] = {250,1,2,4};				//power calibration is done at the 250mW 1W 2W and 4W levels
#define NO_OF_POWER_LEVELS 4

static uint8_t oscTune[2];						//VHF and UHF osccilator tuning values


static uint8_t powerSetting[NO_OF_CAL_FREQS][NO_OF_POWER_LEVELS];

static bool calIsTransmitting = false;
static bool factoryReset = false;

static menuStatus_t menuOptionsExitCode = MENU_STATUS_SUCCESS;
enum CALIBRATION_MENU_LIST
{
	CALIBRATION_MENU_CAL_FREQUENCY = 0U,
	CALIBRATION_MENU_POWER_LEVEL,
	CALIBRATION_MENU_POWER_SET,
	CALIBRATION_MENU_REF_OSC,
	CALIBRATION_MENU_FACTORY,
	NUM_CALIBRATION_MENU_ITEMS
};

menuStatus_t menuCalibration(uiEvent_t *ev, bool isFirstRun)
{
	if (isFirstRun)
	{
		menuDataGlobal.menuOptionsSetQuickkey = 0;
		menuDataGlobal.menuOptionsTimeout = 0;
		menuDataGlobal.newOptionSelected = true;
		menuDataGlobal.numItems = NUM_CALIBRATION_MENU_ITEMS;

//get the current calibration values from calibration.c
		oscTune[0]=calibrationGetVHFOscTune();
		oscTune[1]=calibrationGetUHFOscTune();
        for(int i=0 ; i < NO_OF_CAL_FREQS ; i++)
        {
        	for(int j=0 ; j < NO_OF_POWER_LEVELS ; j++)
        	{
            	powerSetting[i][j] = calibrationGetPower(i,j);
        	}
        }

		voicePromptsInit();
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		voicePromptsAppendLanguageString(&currentLanguage->calibration);
		voicePromptsAppendLanguageString(&currentLanguage->menu);
		voicePromptsAppendPrompt(PROMPT_SILENCE);

		updateScreen(true);

		trxSetFrequency(calFreq[freqIndex], calFreq[freqIndex], DMR_MODE_AUTO);
		trxSetModeAndBandwidth(RADIO_MODE_ANALOG, true);

		return (MENU_STATUS_LIST_TYPE | MENU_STATUS_SUCCESS);
	}
	else
	{
		menuOptionsExitCode = MENU_STATUS_SUCCESS;

		if (ev->hasEvent || (menuDataGlobal.menuOptionsTimeout > 0))
		{
			handleEvent(ev);
		}
	}
	return menuOptionsExitCode;
}

static void updateScreen(bool isFirstRun)
{
	int mNum = 0;
	char buf[SCREEN_LINE_BUFFER_SIZE];
	char * const *leftSide = NULL;// initialize to please the compiler
	char * const *rightSideConst = NULL;// initialize to please the compiler
	char rightSideVar[SCREEN_LINE_BUFFER_SIZE];
	voicePrompt_t rightSideUnitsPrompt;
	const char * rightSideUnitsStr;
	int firstline;
	int lastline;

	displayClearBuf();
	bool settingOption = uiShowQuickKeysChoices(buf, SCREEN_LINE_BUFFER_SIZE, currentLanguage->calibration);

	firstline = 1 - ((MENU_MAX_DISPLAYED_ENTRIES - 1) / 2) - 1;
	lastline = MENU_MAX_DISPLAYED_ENTRIES - ((MENU_MAX_DISPLAYED_ENTRIES - 1) / 2) - 1;

	if(NUM_CALIBRATION_MENU_ITEMS <= MENU_MAX_DISPLAYED_ENTRIES)      //Don't scroll the menu if it will all fit onto the screen
	{
		firstline = 0;
		lastline = NUM_CALIBRATION_MENU_ITEMS -1;
	}

	for(int i = firstline; i <= lastline; i++)
	{
		if ((settingOption == false) || (i == 0))
		{
			if(NUM_CALIBRATION_MENU_ITEMS <= MENU_MAX_DISPLAYED_ENTRIES)      //Don't scroll the menu if it will all fit onto the screen
			{
				mNum = i;
			}
			else
			{
				mNum = menuGetMenuOffset(NUM_CALIBRATION_MENU_ITEMS, i);
			}

			if (mNum == MENU_OFFSET_BEFORE_FIRST_ENTRY)
			{
				continue;
			}
			else if (mNum == MENU_OFFSET_AFTER_LAST_ENTRY)
			{
				break;
			}

			buf[0] = 0;
			buf[2] = 0;
			leftSide = NULL;
			rightSideConst = NULL;
			rightSideVar[0] = 0;
			rightSideUnitsPrompt = PROMPT_SILENCE;// use PROMPT_SILENCE as flag that the unit has not been set
			rightSideUnitsStr = NULL;

			switch(mNum)
			{
				case CALIBRATION_MENU_REF_OSC://  Reference Oscillator Tuning
					leftSide = (char * const *)&currentLanguage->freq_set;
					snprintf(rightSideVar, SCREEN_LINE_BUFFER_SIZE, "%d", oscTune[freqIndex > 4 ? 1 : 0] - 128);
					break;
				case CALIBRATION_MENU_CAL_FREQUENCY:// Calibration Frequency (from cal table)
					leftSide = (char * const *)&currentLanguage->cal_frequency;
					int val_before_dp = calFreq[freqIndex] / 100000;
					int val_after_dp = (calFreq[freqIndex] - val_before_dp * 100000)/10000;
					snprintf(rightSideVar, SCREEN_LINE_BUFFER_SIZE, "%d.%01d ", val_before_dp, val_after_dp);
					rightSideUnitsPrompt = PROMPT_MEGAHERTZ;
					rightSideUnitsStr = "MHz";
					break;
				case CALIBRATION_MENU_POWER_LEVEL:// Power Level
					leftSide = (char * const *)&currentLanguage->cal_pwr;
					snprintf(rightSideVar, SCREEN_LINE_BUFFER_SIZE, "%d", calPower[powerIndex]);
					if(powerIndex == 0)
					{
						rightSideUnitsPrompt = PROMPT_MILLIWATTS ;
						rightSideUnitsStr = "mW";
					}
					else
					{
						rightSideUnitsPrompt = PROMPT_WATTS ;
						rightSideUnitsStr = "W";
					}
					break;
				case CALIBRATION_MENU_POWER_SET:// Power Setting
					leftSide = (char * const *)&currentLanguage->pwr_set;
					snprintf(rightSideVar, SCREEN_LINE_BUFFER_SIZE, "%d", powerSetting[freqIndex][powerIndex]);
					break;
				case CALIBRATION_MENU_FACTORY:// Factory Reset
					leftSide = (char * const *)&currentLanguage->factory_reset;
					rightSideConst = (char * const *)(factoryReset ? &currentLanguage->yes : &currentLanguage->no);
					break;
			}

			snprintf(buf, SCREEN_LINE_BUFFER_SIZE, "%s:%s", *leftSide, (rightSideVar[0] ? rightSideVar : (rightSideConst ? *rightSideConst : "")));

			int voicetrig;
			if(NUM_CALIBRATION_MENU_ITEMS <= MENU_MAX_DISPLAYED_ENTRIES)      //Don't scroll the menu if it will all fit onto the screen
			{
				voicetrig = menuDataGlobal.currentItemIndex;
			}
			else
			{
				voicetrig = 0;
			}

			if (i == voicetrig)
			{
				bool wasPlaying = voicePromptsIsPlaying();

				if (!isFirstRun && (menuDataGlobal.menuOptionsSetQuickkey == 0))
				{
					voicePromptsInit();
				}

				if (!wasPlaying || menuDataGlobal.newOptionSelected)
				{
					voicePromptsAppendLanguageString((const char * const *)leftSide);
				}

				if ((rightSideVar[0] != 0) || ((rightSideVar[0] == 0) && (rightSideConst == NULL)))
				{
					voicePromptsAppendString(rightSideVar);
				}
				else
				{
					voicePromptsAppendLanguageString((const char * const *)rightSideConst);
				}

				if (rightSideUnitsPrompt != PROMPT_SILENCE)
				{
					voicePromptsAppendPrompt(rightSideUnitsPrompt);
				}

				if (rightSideUnitsStr != NULL)
				{
					strncat(rightSideVar, rightSideUnitsStr, SCREEN_LINE_BUFFER_SIZE);
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
				if (rightSideUnitsStr != NULL)
				{
					strncat(buf, rightSideUnitsStr, SCREEN_LINE_BUFFER_SIZE);
				}

				if(NUM_CALIBRATION_MENU_ITEMS <= MENU_MAX_DISPLAYED_ENTRIES)      //Don't scroll the menu if it will all fit onto the screen
				{
					menuDisplayEntry(i-((MENU_MAX_DISPLAYED_ENTRIES - 1) / 2), mNum, buf);
				}
				else
				{
					menuDisplayEntry(i, mNum, buf);
				}

			}
		}
	}

	displayRender();
}

static void handleEvent(uiEvent_t *ev)
{
	bool isDirty = false;
	static uint8_t promptSave;

	//if PTT pressed (special case while in the calibration menu)
	if ((HAL_GPIO_ReadPin(PTT_GPIO_Port, PTT_Pin) == GPIO_PIN_RESET) || (HAL_GPIO_ReadPin(PTT_EXTERNAL_GPIO_Port, PTT_EXTERNAL_Pin) == GPIO_PIN_RESET))
		{
			if(!calIsTransmitting)
			{
			rxPowerSavingSetState(ECOPHASE_POWERSAVE_INACTIVE);
			promptSave = nonVolatileSettings.audioPromptMode;
		    nonVolatileSettings.audioPromptMode = AUDIO_PROMPT_MODE_SILENT;			    //can't have prompts when adjusting because it interferes when changing the values
			trxSetModeAndBandwidth(RADIO_MODE_ANALOG, true);
			trxSetFrequency(calFreq[freqIndex], calFreq[freqIndex], DMR_MODE_AUTO);
			trxEnableTransmission();
			setDACTemp(powerSetting[freqIndex][powerIndex]);		  //Temporarily use the current power setting
			setRefOscTemp(oscTune[freqIndex > 4 ? 1 : 0]);           //temporarily use this value for Osc Tuning
			calIsTransmitting = true;
			}
		}
		else										//PTT not pressed
		{
			if(calIsTransmitting)
			{
			trxDisableTransmission();
			trxTransmissionEnabled = false;
			calIsTransmitting = false;
			nonVolatileSettings.audioPromptMode = promptSave; 			//restore prompt mode
			}
		}





	if (ev->events & BUTTON_EVENT)
	{
		if (repeatVoicePromptOnSK1(ev))
		{
			return;
		}
	}

	if ((menuDataGlobal.menuOptionsTimeout > 0) && (!BUTTONCHECK_DOWN(ev, BUTTON_SK2)))
	{
		menuDataGlobal.menuOptionsTimeout--;
		if (menuDataGlobal.menuOptionsTimeout == 0)
		{
			menuSystemPopPreviousMenu();
			return;
		}
	}
	if (ev->events & FUNCTION_EVENT)
	{
		isDirty = true;
		if ((QUICKKEY_TYPE(ev->function) == QUICKKEY_MENU) && (QUICKKEY_ENTRYID(ev->function) < NUM_CALIBRATION_MENU_ITEMS))
		{
			menuDataGlobal.currentItemIndex = QUICKKEY_ENTRYID(ev->function);
		}
		if ((QUICKKEY_FUNCTIONID(ev->function) != 0))
		{
			menuDataGlobal.menuOptionsTimeout = 1000;
		}
	}

	if ((ev->events & KEY_EVENT) && (menuDataGlobal.menuOptionsSetQuickkey == 0) && (menuDataGlobal.menuOptionsTimeout == 0))
	{
		if (KEYCHECK_PRESS(ev->keys, KEY_DOWN) && (menuDataGlobal.numItems != 0))
		{
			isDirty = true;
			menuSystemMenuIncrement(&menuDataGlobal.currentItemIndex, NUM_CALIBRATION_MENU_ITEMS);
			menuDataGlobal.newOptionSelected = true;
			menuOptionsExitCode |= MENU_STATUS_LIST_TYPE;
		}
		else if (KEYCHECK_PRESS(ev->keys, KEY_UP))
		{
			isDirty = true;
			menuSystemMenuDecrement(&menuDataGlobal.currentItemIndex, NUM_CALIBRATION_MENU_ITEMS);
			menuDataGlobal.newOptionSelected = true;
			menuOptionsExitCode |= MENU_STATUS_LIST_TYPE;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_GREEN))
		{
			//copy the new calibration values to calibration table
			calibrationPutVHFOscTune(oscTune[0]);
			calibrationPutUHFOscTune(oscTune[1]);
			for(int i=0 ; i < NO_OF_CAL_FREQS ; i++)
				{
			     for(int j=0 ; j < NO_OF_POWER_LEVELS ; j++)
			     {
				   calibrationPutPower(i , j , powerSetting[i][j] );
				  }
			     }

			if(BUTTONCHECK_DOWN(ev, BUTTON_SK2))					//only save to flash or factory reset if SK2 + green is pressed.
			{
			  if(factoryReset)
			  {
				calibrationReadFactory();        //restore the factory values
			  }

			  calibrationSaveLocal();	        // save as the local copy
			}

			factoryReset=false;

			trxSetFrequency(currentChannelData->rxFreq + 10, currentChannelData->txFreq + 10, DMR_MODE_AUTO);   //FORCE A SMALL FREQUENCY CHANGE TO TIDY UP
			trxSetFrequency(currentChannelData->rxFreq, currentChannelData->txFreq, DMR_MODE_AUTO);
			trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));
			menuSystemPopAllAndDisplayRootMenu();
			return;
		}
		else if (KEYCHECK_SHORTUP(ev->keys, KEY_RED))
		{
			factoryReset=false;
			trxSetFrequency(currentChannelData->rxFreq + 10, currentChannelData->txFreq + 10, DMR_MODE_AUTO);      //FORCE A SMALL FREQUENCY CHANGE TO TIDY UP
			trxSetFrequency(currentChannelData->rxFreq, currentChannelData->txFreq, DMR_MODE_AUTO);
			trxSetModeAndBandwidth(currentChannelData->chMode, codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_BW_25K));
			menuSystemPopPreviousMenu();
			return;
		}
		else if (KEYCHECK_SHORTUP_NUMBER(ev->keys) && BUTTONCHECK_DOWN(ev, BUTTON_SK2))
		{
				menuDataGlobal.menuOptionsSetQuickkey = ev->keys.key;
				isDirty = true;
		}
	}
	if ((ev->events & (KEY_EVENT | FUNCTION_EVENT)) && (menuDataGlobal.menuOptionsSetQuickkey == 0))
	{

		if (KEYCHECK_PRESS(ev->keys, KEY_RIGHT) || (QUICKKEY_FUNCTIONID(ev->function) == FUNC_RIGHT))
		{
			isDirty = true;
			menuDataGlobal.newOptionSelected = false;
			switch(menuDataGlobal.currentItemIndex)
			{
				case CALIBRATION_MENU_REF_OSC:
					if (oscTune[freqIndex > 4 ? 1 : 0] < 255)
					{
						oscTune[freqIndex > 4 ? 1 : 0]++;
						setRefOscTemp(oscTune[freqIndex > 4 ? 1 : 0]);			//temporarily use this value for Osc Tuning
					}
					break;
				case CALIBRATION_MENU_CAL_FREQUENCY:
					if (freqIndex < NO_OF_CAL_FREQS -1)
					{
						freqIndex++;
						trxDisableTransmission();
						trxTransmissionEnabled = false;
						trxSetFrequency(calFreq[freqIndex], calFreq[freqIndex], DMR_MODE_AUTO);
						if(calIsTransmitting)
						{
						  trxEnableTransmission();
						  setDACTemp(powerSetting[freqIndex][powerIndex]);		  //Temporarily use the current power setting
						  setRefOscTemp(oscTune[freqIndex > 4 ? 1 : 0]);           //temporarily use this value for Osc Tuning
						}
					}
					break;
				case CALIBRATION_MENU_POWER_LEVEL:
					if (powerIndex < NO_OF_POWER_LEVELS -1)
					{
						powerIndex++;
						setDACTemp(powerSetting[freqIndex][powerIndex]);		  //Temporarily use the current power setting
					}
					break;
				case CALIBRATION_MENU_POWER_SET:
					if (powerSetting[freqIndex][powerIndex] < 255)
					{
						powerSetting[freqIndex][powerIndex] = powerSetting[freqIndex][powerIndex] + 1;
						setDACTemp(powerSetting[freqIndex][powerIndex]);		  //Temporarily use the current power setting
					}
					break;
				case CALIBRATION_MENU_FACTORY:
					factoryReset = true;
					break;

			}
		}
		else if (KEYCHECK_PRESS(ev->keys, KEY_LEFT) || (QUICKKEY_FUNCTIONID(ev->function) == FUNC_LEFT))
		{
			isDirty = true;
			menuDataGlobal.newOptionSelected = false;
			switch(menuDataGlobal.currentItemIndex)
			{
			case CALIBRATION_MENU_REF_OSC:
				if (oscTune[freqIndex > 4 ? 1 : 0] > 0)
				{
					oscTune[freqIndex > 4 ? 1 : 0]--;
					setRefOscTemp(oscTune[freqIndex > 4 ? 1 : 0]);           //temporarily use this value for Osc Tuning
				}
				break;
			case CALIBRATION_MENU_CAL_FREQUENCY:
				if (freqIndex > 0)
				{
					freqIndex--;
					trxDisableTransmission();
					trxTransmissionEnabled = false;
					trxSetFrequency(calFreq[freqIndex], calFreq[freqIndex], DMR_MODE_AUTO);
					if(calIsTransmitting)
					{
					  trxEnableTransmission();
					  setDACTemp(powerSetting[freqIndex][powerIndex]);		  //Temporarily use the current power setting
					  setRefOscTemp(oscTune[freqIndex > 4 ? 1 : 0]);           //temporarily use this value for Osc Tuning
					}
				}
				break;
			case CALIBRATION_MENU_POWER_LEVEL:
				if (powerIndex > 0)
				{
					powerIndex--;
					setDACTemp(powerSetting[freqIndex][powerIndex]);		  //Temporarily use the current power setting
				}
				break;
			case CALIBRATION_MENU_POWER_SET:
				if (powerSetting[freqIndex][powerIndex] > 0)
				{
					powerSetting[freqIndex][powerIndex] = powerSetting[freqIndex][powerIndex] -1;
					setDACTemp(powerSetting[freqIndex][powerIndex]);		  //Temporarily use the current power setting
				}
				break;
			case CALIBRATION_MENU_FACTORY:
				factoryReset = false;
				break;
			}
		}
		else if ((ev->keys.event & KEY_MOD_PRESS) && (menuDataGlobal.menuOptionsTimeout > 0))
		{
			menuDataGlobal.menuOptionsTimeout = 0;;
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
			menuOptionsExitCode |= MENU_STATUS_ERROR;
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
		updateScreen(false);
	}
}

//Temporarily adjust the Ref Oscillator value
void setRefOscTemp(uint8_t cal)
{
	int8_t cal2;
	cal2 = cal - 128;
	SPI0WritePageRegByte(0x04, 0x47, cal2);			// Set the reference tuning offset
	SPI0WritePageRegByte(0x04, 0x48, cal2<0?0x03:0x00) ;
	SPI0WritePageRegByte(0x04, 0x04, cal2);									//Set MOD 2 Offset (Cal Value)
}

//Temporarily adjust the Tx Power DAC
void setDACTemp(uint8_t cal)
{
	dac_Out(1, cal << 4);
}
