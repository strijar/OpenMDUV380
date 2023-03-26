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
#include "user_interface/menuSystem.h"
#include "user_interface/uiLocalisation.h"
#include "user_interface/uiUtilities.h"
#include "utils.h"
#include "interfaces/pit.h"
#include "functions/ticks.h"
#include "user_interface/uiGlobals.h"
#include "main.h"
#include "functions/satellite.h"
#include "functions/codeplug.h"
#include "interfaces/batteryAndPowerManagement.h"
#include "semphr.h"
#include "interfaces/gps.h"

static SemaphoreHandle_t battSemaphore = NULL;

#define VOLTAGE_BUFFER_LEN 128
static const float BATTERY_CRITICAL_VOLTAGE = 66.7f;
static const int TEMPERATURE_CRITICAL = 500; // 50°C
static const uint8_t daysPerMonth[12] = { 31,28,31,30,31,30,31,31,30,31,30,31 };
static float prevAverageBatteryVoltage = 0.0f;
static int prevTemperature = 0;
static char keypadInputDigits[17]; // HHMMSS + terminator (Displayed as HH:MM:SS, or YYYY:MM:DD or LAT.LATIT,LON.LONGI)
static int keypadInputDigitsLength = 0;
static menuStatus_t menuRadioInfosExitCode = MENU_STATUS_SUCCESS;
//static int32_t timeClockPITOffset = 0; // Time difference between PITCounter and real time.
#define VP_TIMEBUF_SIZE 9
static uint32_t hours;
static uint32_t minutes;
static uint32_t seconds;
static struct tm timeAndDate;
bool latLonIsSouthernHemisphere = false;
bool latLonIsWesternHemisphere = false;
const uint32_t LOCATION_TEXT_BUFFER_SIZE = 32;

typedef struct
{
	int32_t  buffer[VOLTAGE_BUFFER_LEN];
	int32_t *head;
	int32_t *tail;
	int32_t *end;
	bool     modified;
} voltageCircularBuffer_t;

__attribute__((section(".ccmram"))) voltageCircularBuffer_t batteryVoltageHistory;

enum { GRAPH_FILL = 0, GRAPH_LINE };

static int displayMode = RADIO_INFOS_BATTERY_LEVEL;
static bool pureBatteryLevel = false;
static int graphStyle = GRAPH_FILL;
static int battery_stack_iter = 0;
static const int BATTERY_ITER_PUSHBACK = 20;

static void updateScreen(uiEvent_t *ev, bool forceRedraw);
static void handleEvent(uiEvent_t *ev);
static void updateVoicePrompts(bool spellIt, bool firstRun);
static uint32_t menuRadioInfosNextUpdateTime = 0;



static void circularBufferInit(voltageCircularBuffer_t *cb)
{
	cb->end = &cb->buffer[VOLTAGE_BUFFER_LEN - 1];
	cb->head = cb->buffer;
	cb->tail = cb->buffer;
	cb->modified = false;
}

static void circularBufferPushBack(voltageCircularBuffer_t *cb, const int32_t item)
{
	cb->modified = true;

	*cb->head = item;
	cb->head++;

    if(cb->head == cb->end)
    {
    	cb->head = cb->buffer;
    }

    if (cb->tail == cb->head)
    {
    	cb->tail++;

    	if(cb->tail == cb->end)
    	{
    		cb->tail = cb->buffer;
    	}
    }
}

static size_t circularBufferGetData(voltageCircularBuffer_t *cb, int32_t *data, size_t dataLen)
{
     size_t  count = 0;
     int32_t *p = cb->tail;

     while ((p != cb->head) && (count < dataLen))
     {
    	 *(data + count) = *p;

    	 p++;
    	 count++;

    	 if (p == cb->end)
    	 {
    		 p = cb->buffer;
    	 }
     }

     return count;
}


static uint32_t inputDigitsLonToFixed_10_5(void)
{
	uint32_t inPart =		((keypadInputDigits[6] - '0') * 100) +
							((keypadInputDigits[7] - '0') *  10) +
							((keypadInputDigits[8] - '0') *   1);

	uint32_t decimalPart =	((keypadInputDigits[9] - '0')  * 10000) +
							((keypadInputDigits[10] - '0') *  1000) +
							((keypadInputDigits[11] - '0') *   100) +
							((keypadInputDigits[12] - '0') *    10);

	uint32_t fixedVal = (inPart << 23) + decimalPart;
	if (latLonIsWesternHemisphere)
	{
		fixedVal |= 0x80000000;// set MSB to indicate negative number / southern hemisphere
	}
	return fixedVal;
}
static uint32_t inputDigitsLatToFixed_10_5(void)
{
	uint32_t inPart =		((keypadInputDigits[0] - '0') *  10) +
							((keypadInputDigits[1] - '0') *   1);
	uint32_t decimalPart =	((keypadInputDigits[2] - '0') * 10000) +
							((keypadInputDigits[3] - '0') *  1000) +
							((keypadInputDigits[4] - '0') *   100)+
							((keypadInputDigits[5] - '0') *    10);

	uint32_t fixedVal = (inPart << 23) + decimalPart;
	if (latLonIsSouthernHemisphere)
	{
		fixedVal |= 0x80000000;// set MSB to indicate negative number / southrern hemisphere
	}
	return fixedVal;
}

menuStatus_t menuRadioInfos(uiEvent_t *ev, bool isFirstRun)
{
	if (isFirstRun)
	{
		keypadInputDigits[0] = 0;
		keypadInputDigitsLength = 0;
		menuDataGlobal.numItems = NUM_RADIO_INFOS_MENU_ITEMS;
		displayClearBuf();
		menuDisplayTitle(currentLanguage->radio_info);
		displayRenderRows(0, 2);
#if defined(PLATFORM_MD9600)
		gpsOn(); //enable GPS DMA to see if we have a GPS fitted.
#endif

		if (nonVolatileSettings.locationLat != SETTINGS_UNITIALISED_LOCATION_LAT)
		{
			if (nonVolatileSettings.locationLat & 0x80000000)
			{
				latLonIsSouthernHemisphere = true;
			}
			if (nonVolatileSettings.locationLon & 0x80000000)
			{
				latLonIsWesternHemisphere = true;
			}
		}

		updateScreen(ev, true);

		updateVoicePrompts(true, true);
	}
	else
	{
		if (ev->time > menuRadioInfosNextUpdateTime)
		{
			menuRadioInfosNextUpdateTime = ev->time + 500;
			updateScreen(ev, false);// update the screen each 500ms to show any changes to the battery voltage or low battery
		}

		menuRadioInfosExitCode = MENU_STATUS_SUCCESS;

		if (ev->hasEvent)
		{
			handleEvent(ev);
		}
	}
	return menuRadioInfosExitCode;
}


void buildMaidenHead(char *maidenheadBuffer,uint32_t intPartLat,uint32_t decPartLat,bool isSouthern,uint32_t intPartLon,uint32_t decPartLon, bool isWestern)
{
	double latitude = intPartLat + (((double)decPartLat) /  LOCATION_DECIMAL_PART_MULIPLIER);
	double longitude = intPartLon + (((double)decPartLon) / LOCATION_DECIMAL_PART_MULIPLIER);

	if (isSouthern)
	{
		latitude *= -1;
	}

	if (isWestern)
	{
		longitude *= -1;
	}

	coordsToMaidenhead((uint8_t *)maidenheadBuffer, latitude, longitude);
}

void buildLocationTextBuffer(char *buffer, char * maidenheadBuf, bool locIsValid)
{
	if (locIsValid)
	{
		uint32_t intPartLat = (nonVolatileSettings.locationLat & 0x7FFFFFFF) >> 23;
		uint32_t decPartLat = (nonVolatileSettings.locationLat & 0x7FFFFF);
		bool southernHemisphere = false;
		bool westernHemisphere = false;

		if (nonVolatileSettings.locationLat & 0x80000000)
		{
			southernHemisphere = true;
		}
		uint32_t intPartLon = (nonVolatileSettings.locationLon & 0x7FFFFFFF) >> 23;
		uint32_t decPartLon = (nonVolatileSettings.locationLon & 0x7FFFFF);
		if (nonVolatileSettings.locationLon & 0x80000000)
		{
			westernHemisphere = true;
		}

		buildMaidenHead(maidenheadBuf, intPartLat, decPartLat, southernHemisphere, intPartLon, decPartLon, westernHemisphere );

		snprintf(buffer, LOCATION_TEXT_BUFFER_SIZE, "%02u.%04u%c %03u.%04u%c",
				intPartLat, decPartLat/10, LanguageGetSymbol(southernHemisphere ? SYMBOLS_SOUTH : SYMBOLS_NORTH),
				intPartLon, decPartLon/10, LanguageGetSymbol(westernHemisphere ? SYMBOLS_WEST : SYMBOLS_EAST));

	}
	else
	{
		strcpy(buffer, "??.???? ???.????");
		maidenheadBuf[0] = 0;
	}
}

static void updateScreen(uiEvent_t *ev, bool forceRedraw)
{
	static bool blink = false;
	bool renderArrowOnly = true;
	char buffer[SCREEN_LINE_BUFFER_SIZE];

	switch (displayMode)
	{
		case RADIO_INFOS_BATTERY_LEVEL:
		{
			if ((prevAverageBatteryVoltage != averageBatteryVoltage) || (averageBatteryVoltage < BATTERY_CRITICAL_VOLTAGE) || pureBatteryLevel || forceRedraw)
			{
#if defined(PLATFORM_MD9600)
				int volts, mvolts;
				const int x = 72;
				const int battLevelHeight = 28;

				prevAverageBatteryVoltage = averageBatteryVoltage;
				renderArrowOnly = false;

				if (forceRedraw)
				{
					displayClearBuf();
					menuDisplayTitle(currentLanguage->battery);

					// Draw...
					// Inner body frame
					displayDrawRoundRect(x + 1, 23, 49, 34, 3, true);
					// Outer body frame
					displayDrawRoundRect(x, 22, 51, 36, 3, true);
					// Positive poles frame
					displayFillRoundRect(x + 5, 18, 9, 6, 2, true);
					displayFillRoundRect(x + 37, 18, 9, 6, 2, true);
				}
				else
				{
					// Clear voltage area
					displayFillRect(0, (((DISPLAY_SIZE_Y - (14 + FONT_SIZE_3_HEIGHT)) >> 1) + 14), x - 1, 16, true);
					// Clear level area
					displayFillRoundRect(x + 4, 26, 43, battLevelHeight, 2, false);
				}

				// Want to display instant battery voltage, not the averaged value.
				if (pureBatteryLevel)
				{
					volts = (int)(batteryVoltage / 10);
					mvolts = (int)(batteryVoltage - (volts * 10));
				}
				else
				{
					getBatteryVoltage(&volts, &mvolts);
				}

				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%2d.%1dV", volts, mvolts);
				displayPrintAt(((x - (5 * 8)) >> 1), (((DISPLAY_SIZE_Y - (14 + FONT_SIZE_3_HEIGHT)) >> 1) + 14), buffer, FONT_SIZE_3);

				if (pureBatteryLevel == false)
				{
					uint32_t h = (uint32_t)(((averageBatteryVoltage - CUTOFF_VOLTAGE_UPPER_HYST) * battLevelHeight) / (BATTERY_MAX_VOLTAGE - CUTOFF_VOLTAGE_UPPER_HYST));
					if (h > battLevelHeight)
					{
						h = battLevelHeight;
					}

					// Draw Level
					displayFillRoundRect(x + 4, 26 + battLevelHeight - h , 43, h, 2, (averageBatteryVoltage < BATTERY_CRITICAL_VOLTAGE) ? blink : true);
				}
				else
				{
					displayPrintCore(x + (20 / 2), 26 + ((battLevelHeight - FONT_SIZE_3_HEIGHT) >> 1), "?", FONT_SIZE_3, TEXT_ALIGN_LEFT, blink);
				}

				if (voicePromptsIsPlaying() == false)
				{
					updateVoicePrompts(false, false);
				}
#else
				int volts, mvolts;
				const int x = 88;
				const int battLevelHeight = (DISPLAY_SIZE_Y - 28);

				prevAverageBatteryVoltage = averageBatteryVoltage;
				renderArrowOnly = false;

				if (forceRedraw)
				{
					displayClearBuf();
					menuDisplayTitle(currentLanguage->battery);

					// Draw...
					// Inner body frame
					displayDrawRoundRect(x + 1, 20, 26 + DISPLAY_H_EXTRA_PIXELS, DISPLAY_SIZE_Y - 22, 3, true);
					// Outer body frame
					displayDrawRoundRect(x, 19, 28 + DISPLAY_H_EXTRA_PIXELS, DISPLAY_SIZE_Y - 20, 3, true);
					// Positive pole frame
					displayFillRoundRect(x + 9 + DISPLAY_H_OFFSET, 15, 10, 6, 2, true);
				}
				else
				{
					// Clear voltage area
					displayFillRect(((x - (4 * 8)) >> 1), 19 + 1, (4 * 8), (DISPLAY_SIZE_Y - 20) - 4, true);
					// Clear level area
					displayFillRoundRect(x + 4, 23, 20 + DISPLAY_H_EXTRA_PIXELS, battLevelHeight, 2, false);
				}

				// Want to display instant battery voltage, not the averaged value.
				if (pureBatteryLevel)
				{
					volts = (int)(batteryVoltage / 10);
					mvolts = (int)(batteryVoltage - (volts * 10));
				}
				else
				{
					getBatteryVoltage(&volts, &mvolts);
				}

				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%1d.%1dV", volts, mvolts);
				displayPrintAt(((x - (4 * 8)) >> 1), 19 + 1, buffer, FONT_SIZE_3);

				if (pureBatteryLevel == false)
				{
					snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%d%%", getBatteryPercentage());
					displayPrintAt(((x - (strlen(buffer) * 8)) >> 1), (DISPLAY_SIZE_Y - 20)
#if defined(PLATFORM_RD5R)
							+ 7
#endif
							, buffer, FONT_SIZE_3);

					uint32_t h = (uint32_t)(((averageBatteryVoltage - CUTOFF_VOLTAGE_UPPER_HYST) * battLevelHeight) / (BATTERY_MAX_VOLTAGE - CUTOFF_VOLTAGE_UPPER_HYST));
					if (h > battLevelHeight)
					{
						h = battLevelHeight;
					}

					// Draw Level
					displayFillRoundRect(x + 4, 23 + battLevelHeight - h , 20 + DISPLAY_H_EXTRA_PIXELS, h, 2, (averageBatteryVoltage < BATTERY_CRITICAL_VOLTAGE) ? blink : true);
				}
				else
				{
					displayPrintCore(x + (20 / 2), 23 + ((battLevelHeight - FONT_SIZE_3_HEIGHT) >> 1), "?", FONT_SIZE_3, TEXT_ALIGN_LEFT, blink);
				}

				if (voicePromptsIsPlaying() == false)
				{
					updateVoicePrompts(false, false);
				}
#endif
			}

			// Low blinking arrow
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), blink);
		}
		break;

		case RADIO_INFOS_CURRENT_TIME:
			{
				displayClearBuf();
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s %s", currentLanguage->time, ((nonVolatileSettings.timezone & 0x80) ? "" : "UTC"));
				menuDisplayTitle(buffer);

				if (keypadInputDigitsLength == 0)
				{
					time_t_custom t = uiDataGlobal.dateTimeSecs + ((nonVolatileSettings.timezone & 0x80) ? ((nonVolatileSettings.timezone & 0x7F) - 64) * (15 * 60) : 0);

					gmtime_r_Custom(&t, &timeAndDate);

					snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%02u:%02u:%02u", timeAndDate.tm_hour, timeAndDate.tm_min, timeAndDate.tm_sec);

					if (voicePromptsIsPlaying() == false)
					{
						updateVoicePrompts(false, false);
					}
				}
				else
				{
					strcpy(buffer,"__:__:__");
					int bufPos = 0;
					for(int i = 0; i < keypadInputDigitsLength; i++)
					{
						buffer[bufPos++] = keypadInputDigits[i];
						if ((bufPos == 2) || (bufPos == 5))
						{
							bufPos++;
						}
					}
				}

				displayPrintCentered((DISPLAY_SIZE_Y / 2) - 8, buffer, FONT_SIZE_4);
				renderArrowOnly = false;

				// Up/Down blinking arrow
				displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
				displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			}
			break;

		case RADIO_INFOS_DATE:
			displayClearBuf();
			snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s %s", currentLanguage->date, ((nonVolatileSettings.timezone & 0x80) ? "" : "UTC"));
			menuDisplayTitle(buffer);

			if (keypadInputDigitsLength == 0)
			{
				time_t_custom t = uiDataGlobal.dateTimeSecs + ((nonVolatileSettings.timezone & 0x80) ? ((nonVolatileSettings.timezone & 0x7F) - 64) * (15 * 60) : 0);

				gmtime_r_Custom(&t, &timeAndDate);
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%04u-%02u-%02u", (timeAndDate.tm_year + 1900), (timeAndDate.tm_mon + 1), timeAndDate.tm_mday);

				if (voicePromptsIsPlaying() == false)
				{
					updateVoicePrompts(false, false);
				}
			}
			else
			{
				strcpy(buffer, "____-__-__");

				int bufPos = 0;
				for(int i = 0; i < keypadInputDigitsLength; i++)
				{
					buffer[bufPos++] = keypadInputDigits[i];
					if ((bufPos == 4) || (bufPos == 7))
					{
						bufPos++;
					}
				}
			}

			displayPrintCentered((DISPLAY_SIZE_Y / 2) - 8, buffer, FONT_SIZE_3);

			renderArrowOnly = false;
			// Up/Down blinking arrow
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			break;

		case RADIO_INFOS_LOCATION:
			displayClearBuf();
			menuDisplayTitle(currentLanguage->location);
			{
				char maidenheadBuf[7];
				if (keypadInputDigitsLength == 0)
				{
					bool locIsValid = (nonVolatileSettings.locationLat != SETTINGS_UNITIALISED_LOCATION_LAT);

					buildLocationTextBuffer(buffer, maidenheadBuf, locIsValid);

					if (locIsValid == false)
					{
						displayPrintCentered((DISPLAY_SIZE_Y / 2) + 8, currentLanguage->not_set, FONT_SIZE_3);
					}

					if (voicePromptsIsPlaying() == false)
					{
						updateVoicePrompts(false, false);
					}
				}
				else
				{
					sprintf(buffer, "__.____%c ___.____%c",
							LanguageGetSymbol(latLonIsSouthernHemisphere ? SYMBOLS_SOUTH : SYMBOLS_NORTH),
							LanguageGetSymbol(latLonIsWesternHemisphere ? SYMBOLS_WEST : SYMBOLS_EAST));
					int bufPos = 0;
					for(int i = 0; i < keypadInputDigitsLength; i++)
					{
						buffer[bufPos++] = keypadInputDigits[i];
						if ((bufPos == 2) || (bufPos == 12))
						{
							bufPos++;
						}
						if (bufPos == 7)
						{
							bufPos +=2;
						}
					}
					maidenheadBuf[0] = 0;
				}

				displayPrintCentered((DISPLAY_SIZE_Y / 2) - 8, buffer, FONT_SIZE_3);
				displayPrintCentered(((DISPLAY_SIZE_Y / 4) * 3) - 8 , maidenheadBuf, FONT_SIZE_3);
			}
			renderArrowOnly = false;
			// Up/Down blinking arrow
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			break;
		case RADIO_INFOS_TEMPERATURE_LEVEL:
		{
			int temperature = getTemperature();

			if ((prevTemperature != temperature) || (temperature > TEMPERATURE_CRITICAL) || forceRedraw)
			{
				const int x = 102 + DISPLAY_H_OFFSET;
#if defined(PLATFORM_RD5R)
				const int temperatureHeight = (DISPLAY_SIZE_Y - 34);
				const int tankVCenter = (DISPLAY_SIZE_Y - 10);
				const int tankRadius = 9;
#else
				const int temperatureHeight = (DISPLAY_SIZE_Y - 40);
				const int tankVCenter = (DISPLAY_SIZE_Y - 14);
				const int tankRadius = 11;
#endif
				prevTemperature = temperature;
				renderArrowOnly = false;

				if (forceRedraw)
				{
					displayClearBuf();
					menuDisplayTitle(currentLanguage->temperature);

					// Body frame
					displayDrawCircleHelper(x, 20 + 2, 7, (1 | 2), true);
					displayDrawCircleHelper(x, 20 + 2, 6, (1 | 2), true);
					displaySetPixel(x, (20 + 2) - 7, true);
					displayDrawFastVLine(x - 7, 20 + 2, temperatureHeight - 1, true);
					displayDrawFastVLine(x - 6, 20 + 2, temperatureHeight - 2, true);
					displayDrawFastVLine(x + 6, 20 + 2, temperatureHeight - 2, true);
					displayDrawFastVLine(x + 7, 20 + 2, temperatureHeight - 1, true);

					displayDrawCircle(x, tankVCenter, tankRadius, true);
					displayDrawCircle(x, tankVCenter, tankRadius - 1, true);
					displayFillCircle(x, tankVCenter, tankRadius - 3, ((temperature > TEMPERATURE_CRITICAL) ? !blink : true));
					displayFillRect(x - 5, 20, 11, temperatureHeight, true);

					// H lines, min/max markers
					displayDrawFastHLine(x - (7 + 5), 20, 5, true); // MAX: 70°C
					displayDrawFastHLine(x - (7 + 5), (temperatureHeight + 20) - 1, 5, true); // MIN: 10°C
				}
				else
				{
					// Clear temperature text area
					displayFillRect((((x - (7 + 5)) - (7 * 8)) >> 1), 20, (7 * 8), (DISPLAY_SIZE_Y - 20) - 4, true);

					// Clear thermo area
					displayFillCircle(x, tankVCenter, tankRadius - 3, ((temperature > TEMPERATURE_CRITICAL) ? !blink : true));
					displayFillRect(x - 4, 20, 9, temperatureHeight, true);
				}

				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%3d.%1d%s", (temperature / 10), abs(temperature % 10), currentLanguage->celcius);
				displayPrintAt((((x - (7 + 5)) - (7 * 8)) >> 1), (((DISPLAY_SIZE_Y - (14 + FONT_SIZE_3_HEIGHT)) >> 1) + 14), buffer, FONT_SIZE_3);

				uint32_t t = (uint32_t)((((CLAMP(temperature, 100, 700)) - 100) * temperatureHeight) / (700 - 100)); // clamp to 10..70 °C, then scale

				// Draw Level
				if (t)
				{
					displayFillRect(x - 4, 20 + temperatureHeight - t , 9, t, (temperature > TEMPERATURE_CRITICAL) ? blink : false);
				}

				if (voicePromptsIsPlaying() == false)
				{
					updateVoicePrompts(false, false);
				}
			}

			// Up/Down blinking arrow
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
		}
		break;

		case RADIO_INFOS_BATTERY_GRAPH:
		{
#define  CHART_WIDTH 104
			static int32_t hist[CHART_WIDTH];
			static size_t histLen = 0;
			bool newHistAvailable = false;

			// Grab history values.
			// There is a 10 ticks timeout, if it kicks in, history length will be 0, then
			// redraw will be done on the next run
			if (xSemaphoreTake(battSemaphore, (TickType_t)10) == pdTRUE)
			{
				if ((newHistAvailable = batteryVoltageHistory.modified) == true)
				{
					histLen = circularBufferGetData(&batteryVoltageHistory, hist, (sizeof(hist) / sizeof(hist[0])));
					batteryVoltageHistory.modified = false;
				}
				xSemaphoreGive(battSemaphore);
			}

			if (newHistAvailable || forceRedraw)
			{
				static const uint8_t chartX = 2 + (2 * 6) + 3 + 2 + DISPLAY_H_OFFSET;
				static const uint8_t chartY = 14 + 1 + 2;
				const int chartHeight = (DISPLAY_SIZE_Y - 26);

				// Min is 10V, Max is 15V
				// Pick: MIN @ 11V, MAX @ 14V
				uint32_t minVH = (uint32_t)(((70 - CUTOFF_VOLTAGE_UPPER_HYST) * chartHeight) / (BATTERY_MAX_VOLTAGE - CUTOFF_VOLTAGE_UPPER_HYST));
				uint32_t maxVH = (uint32_t)(((80 - CUTOFF_VOLTAGE_UPPER_HYST) * chartHeight) / (BATTERY_MAX_VOLTAGE - CUTOFF_VOLTAGE_UPPER_HYST));

				renderArrowOnly = false;

				// Redraw chart's axes, ticks and so on
				if (forceRedraw)
				{
					displayClearBuf();
					menuDisplayTitle(currentLanguage->battery);

					// 2 axis chart
					displayDrawFastVLine(chartX - 3, chartY - 2, chartHeight + 2 + 3, true);
					displayDrawFastVLine(chartX - 2, chartY - 2, chartHeight + 2 + 2, true);
					displayDrawFastHLine(chartX - 3, chartY + chartHeight + 2, CHART_WIDTH + 3 + 3, true);
					displayDrawFastHLine(chartX - 2, chartY + chartHeight + 1, CHART_WIDTH + 3 + 2, true);

					// Min/Max Voltage ticks and values
					displayDrawFastHLine(chartX - 6, (chartY + chartHeight) - minVH, 3, true);
					displayPrintAt(DISPLAY_H_OFFSET, ((chartY + chartHeight) - minVH) - 3, "7V", FONT_SIZE_1);
					displayDrawFastHLine(chartX - 6, (chartY + chartHeight) - maxVH, 3, true);
					displayPrintAt(DISPLAY_H_OFFSET, ((chartY + chartHeight) - maxVH) - 3, "8V", FONT_SIZE_1);

					// Time ticks
					for (uint8_t i = 0; i < CHART_WIDTH + 2; i += 22 /* ~ 15 minutes */)
					{
						displaySetPixel(chartX + i, (chartY + chartHeight) + 3, true);
					}
				}
				else
				{
					displayFillRect(chartX, chartY, CHART_WIDTH, chartHeight, true);
				}

				// Draw chart values, according to style
				for (size_t i = 0; i < histLen; i++)
				{
					uint32_t y = (uint32_t)(((hist[i] - CUTOFF_VOLTAGE_UPPER_HYST) * chartHeight) / (BATTERY_MAX_VOLTAGE - CUTOFF_VOLTAGE_UPPER_HYST));

					if (graphStyle == GRAPH_FILL)
					{
						displayDrawFastVLine(chartX + i, ((chartY + chartHeight) - y), y, true);
					}
					else
					{
						displaySetPixel(chartX + i, ((chartY + chartHeight) - y), true);
					}
				}

				// Min/Max dot lines
				for (uint8_t i = 0; i < CHART_WIDTH + 2; i++)
				{
					displaySetPixel(chartX + i, ((chartY + chartHeight) - minVH), (i % 2) ? false : true);
					displaySetPixel(chartX + i, ((chartY + chartHeight) - maxVH), (i % 2) ? false : true);
				}
			}

			// Up blinking arrow
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);

			if (voicePromptsIsPlaying() == false)
			{
				updateVoicePrompts(false, false);
			}
		}
		break;

		case RADIO_INFOS_UP_TIME:
		{
			displayClearBuf();
			menuDisplayTitle(currentLanguage->uptime);
			uint32_t timeInSeconds = 0;//   (ev->time + uiDataGlobal.timeClockPITOffset) / 1000;

			hours = timeInSeconds / (60 * 60);
			minutes = (timeInSeconds % (60 * 60)) / 60;

			snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%u %s", hours, currentLanguage->hours);
			displayPrintCentered((DISPLAY_SIZE_Y / 2) - 8, buffer, FONT_SIZE_3);

			snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%u %s", minutes, currentLanguage->minutes);
			displayPrintCentered(((DISPLAY_SIZE_Y * 3) / 4) - 8, buffer, FONT_SIZE_3);

			if (voicePromptsIsPlaying() == false)
			{
				updateVoicePrompts(false, false);
			}

			renderArrowOnly = false;

			// Up/Down blinking arrow
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
		}
		break;

		case RADIO_INFOS_TIME_ALARM:
			{
				displayClearBuf();
				menuDisplayTitle(currentLanguage->alarm_time);

				if (keypadInputDigitsLength == 0)
				{
					hours = (uiDataGlobal.SatelliteAndAlarmData.alarmTime % (60 * 60 * 24))/ (60 * 60);
					minutes = (uiDataGlobal.SatelliteAndAlarmData.alarmTime % (60 * 60)) / 60;
					seconds = (uiDataGlobal.SatelliteAndAlarmData.alarmTime % 60);
					snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%02u:%02u:%02u", hours, minutes, seconds);

					if (voicePromptsIsPlaying() == false)
					{
						updateVoicePrompts(false, false);
					}
				}
				else
				{
					strcpy(buffer,"__:__:__");
					int bufPos = 0;
					for(int i = 0; i < keypadInputDigitsLength; i++)
					{
						buffer[bufPos++] = keypadInputDigits[i];
						if ((bufPos == 2) || (bufPos == 5))
						{
							bufPos++;
						}
					}
				}

				displayPrintCentered((DISPLAY_SIZE_Y / 2) - 8, buffer, FONT_SIZE_4);
				renderArrowOnly = false;

				// Up/Down blinking arrow
				displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 1), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
				displayFillTriangle(63 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 5), 59 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), 67 + DISPLAY_H_OFFSET, (DISPLAY_SIZE_Y - 3), blink);
			}
			break;
	}

	blink = !blink;

	displayRenderRows((renderArrowOnly ? (DISPLAY_NUMBER_OF_ROWS - 1) : 0), DISPLAY_NUMBER_OF_ROWS);
}

static void handleEvent(uiEvent_t *ev)
{
	if (ev->events & FUNCTION_EVENT)
	{
		if (QUICKKEY_TYPE(ev->function) == QUICKKEY_MENU)
		{
			displayMode = QUICKKEY_ENTRYID(ev->function);

			updateScreen(ev, true);
			updateVoicePrompts(true, false);
			return;
		}
	}

	if (ev->events & BUTTON_EVENT)
	{
		if (repeatVoicePromptOnSK1(ev))
		{
			return;
		}

		if ((pureBatteryLevel == false) && BUTTONCHECK_EXTRALONGDOWN(ev, BUTTON_SK2))
		{
			pureBatteryLevel = true;
			updateScreen(ev, true);
		}
		else if (pureBatteryLevel && (BUTTONCHECK_EXTRALONGDOWN(ev, BUTTON_SK2) == 0))
		{
			pureBatteryLevel = false;
			updateScreen(ev, true);
		}
	}


	if ((ev->keys.event & (KEY_MOD_UP | KEY_MOD_LONG)) == KEY_MOD_UP)
	{
		switch(ev->keys.key)
		{
			case KEY_GREEN:
				if (keypadInputDigitsLength == 0)
				{
					menuSystemPopPreviousMenu();
				}
				else
				{
					switch(displayMode)
					{
						case RADIO_INFOS_DATE:
						{
							// get the current date time because the time is constantly changing
							time_t_custom t = uiDataGlobal.dateTimeSecs + ((nonVolatileSettings.timezone & 0x80) ? ((nonVolatileSettings.timezone & 0x7F) - 64) * (15 * 60) : 0);
							gmtime_r_Custom(&t, &timeAndDate);// get the current date time as the date may have changed since starting to enter the time.

							timeAndDate.tm_mon		= (((keypadInputDigits[4] - '0') * 10) + (keypadInputDigits[5] - '0')) - 1;
							timeAndDate.tm_mday	= ((keypadInputDigits[6] - '0') * 10) + (keypadInputDigits[7] - '0');


							timeAndDate.tm_year = (((keypadInputDigits[0] - '0') * 1000) +
									((keypadInputDigits[1] - '0') * 100) +
									((keypadInputDigits[2] - '0') * 10) +
									((keypadInputDigits[3] - '0'))) - 1900;

							uiDataGlobal.dateTimeSecs = mktime_custom(&timeAndDate) - ((nonVolatileSettings.timezone & 0x80)?((nonVolatileSettings.timezone & 0x7F) - 64) * (15 * 60):0);
#if defined(PLATFORM_MD9600) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
							setRtc_custom(uiDataGlobal.dateTimeSecs);
#endif
							keypadInputDigits[0] = 0;// clear digits
							keypadInputDigitsLength = 0;

							menuSatelliteScreenClearPredictions(false);

							nextKeyBeepMelody = (int *)MELODY_ACK_BEEP;

							updateScreen(ev, true);
						}
							break;

						case RADIO_INFOS_LOCATION:
							if (keypadInputDigitsLength == 13)
							{
								settingsSet(nonVolatileSettings.locationLat, inputDigitsLatToFixed_10_5());
								settingsSet(nonVolatileSettings.locationLon, inputDigitsLonToFixed_10_5());

								keypadInputDigits[0] = 0;// clear digits
								keypadInputDigitsLength = 0;
								menuSatelliteScreenClearPredictions(false);
								updateScreen(ev, true);
								nextKeyBeepMelody = (int *)MELODY_ACK_BEEP;
							}
							else
							{
								nextKeyBeepMelody = (int *)MELODY_NACK_BEEP;
							}
							break;

						default:
						{
							const int multipliers[6] = { 36000, 3600, 600, 60, 10, 1 };

							if (keypadInputDigitsLength == 6)
							{
								int newTime = 0;

								for(int i = 0; i < 6; i++)
								{
									newTime += (keypadInputDigits[i] - '0') * multipliers[i];
								}
								if (displayMode == RADIO_INFOS_CURRENT_TIME)
								{
									PIT2SecondsCounter = 0;// Stop PIT2SecondsCounter rolling over during the next operations
									time_t_custom t = uiDataGlobal.dateTimeSecs + ((nonVolatileSettings.timezone & 0x80)?((nonVolatileSettings.timezone & 0x7F) - 64) * (15 * 60):0);
									gmtime_r_Custom(&t, &timeAndDate);// get the current date time as the date may have changed since starting to enter the time.
									timeAndDate.tm_hour 	= ((keypadInputDigits[0] - '0') * 10) + (keypadInputDigits[1] - '0');
									timeAndDate.tm_min		= ((keypadInputDigits[2] - '0') * 10) + (keypadInputDigits[3] - '0');
									timeAndDate.tm_sec		= ((keypadInputDigits[4] - '0') * 10) + (keypadInputDigits[5] - '0');

									PIT2SecondsCounter = 0;//Synchronise PIT2SecondsCounter
									uiDataGlobal.dateTimeSecs = mktime_custom(&timeAndDate) - ((nonVolatileSettings.timezone & 0x80)?((nonVolatileSettings.timezone & 0x7F) - 64) * (15 * 60):0);
#if defined(PLATFORM_MD9600) || defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380)  || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
									setRtc_custom(uiDataGlobal.dateTimeSecs);
#endif
									menuSatelliteScreenClearPredictions(false);
								}
								else
								{
									// alarm
									uiDataGlobal.SatelliteAndAlarmData.alarmTime = newTime;

									if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
									{
										uiDataGlobal.SatelliteAndAlarmData.alarmType = ALARM_TYPE_CLOCK;
										powerOffFinalStage(true, false);
									}
								}
								keypadInputDigits[0] = 0;// clear digits
								keypadInputDigitsLength = 0;
								updateScreen(ev, true);
								nextKeyBeepMelody = (int *)MELODY_ACK_BEEP;
							}
							break;
						}
					}
				}
				return;
				break;
			case KEY_RED:
				if (((displayMode == RADIO_INFOS_CURRENT_TIME) || (displayMode == RADIO_INFOS_DATE) || (displayMode == RADIO_INFOS_LOCATION))
					&& (keypadInputDigitsLength != 0))
				{
					keypadInputDigits[0] = 0;
					keypadInputDigitsLength = 0;
					updateScreen(ev, true);
				}
				else
				{
					menuSystemPopPreviousMenu();
				}

				return;
				break;
		}
	}


	if (ev->keys.event & KEY_MOD_PRESS)
	{
		switch(ev->keys.key)
		{
			case KEY_DOWN:
				if (keypadInputDigitsLength != 0)
				{
					if (displayMode == RADIO_INFOS_LOCATION)
					{
						char buf[2] = { 0, 0 };

						if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
						{
							latLonIsWesternHemisphere = true;
							buf[0] = LanguageGetSymbol(latLonIsWesternHemisphere ? SYMBOLS_WEST : SYMBOLS_EAST);
						}
						else
						{
							latLonIsSouthernHemisphere = true;
							buf[0] = LanguageGetSymbol(latLonIsSouthernHemisphere ? SYMBOLS_SOUTH : SYMBOLS_NORTH);
						}
						voicePromptsInit();
						voicePromptsAppendString(buf);
						voicePromptsPlay();
						updateScreen(ev, false);
					}
					return;
				}
				if (displayMode < (NUM_RADIO_INFOS_MENU_ITEMS - 1))
				{
					displayMode++;
					updateScreen(ev, true);
					updateVoicePrompts(true, false);
				}
				break;

			case KEY_UP:
				if (keypadInputDigitsLength != 0)
				{
					if (displayMode == RADIO_INFOS_LOCATION)
					{
						char buf[2] = { 0, 0 };

						if (BUTTONCHECK_DOWN(ev, BUTTON_SK2))
						{
							latLonIsWesternHemisphere = false;
							buf[0] = LanguageGetSymbol(latLonIsWesternHemisphere ? SYMBOLS_WEST : SYMBOLS_EAST);
						}
						else
						{
							latLonIsSouthernHemisphere = false;
							buf[0] = LanguageGetSymbol(latLonIsSouthernHemisphere ? SYMBOLS_SOUTH : SYMBOLS_NORTH);
						}
						voicePromptsInit();
						voicePromptsAppendString(buf);
						voicePromptsPlay();
						updateScreen(ev, false);
					}
					return;
				}

				if (displayMode > RADIO_INFOS_BATTERY_LEVEL)
				{
					displayMode--;
					updateScreen(ev, true);
					updateVoicePrompts(true, false);
				}
				break;

			case KEY_LEFT:
				switch(displayMode)
				{
					case RADIO_INFOS_BATTERY_GRAPH:
						if (graphStyle == GRAPH_LINE)
						{
							graphStyle = GRAPH_FILL;
							updateScreen(ev, true);
						}
						break;

					case RADIO_INFOS_CURRENT_TIME:
					case RADIO_INFOS_TIME_ALARM:
					case RADIO_INFOS_DATE:
					case RADIO_INFOS_LOCATION:
						{
							if (keypadInputDigitsLength > 0)
							{
								keypadInputDigits[keypadInputDigitsLength - 1] = 0;
								keypadInputDigitsLength--;
							}
							updateScreen(ev, true);
						}
						break;
				}
				break;

			case KEY_RIGHT:
				switch(displayMode)
				{
					case RADIO_INFOS_BATTERY_GRAPH:
						if (graphStyle == GRAPH_FILL)
						{
							graphStyle = GRAPH_LINE;
							updateScreen(ev, true);
						}
						break;
				}
				break;

			default:
				{
					int keyval = menuGetKeypadKeyValue(ev, true);
					if (keyval != 99)
					{
						int maxDigitsOnThisScreen;
						switch(displayMode)
						{
							case RADIO_INFOS_DATE:
								maxDigitsOnThisScreen = 8;
							break;
							case RADIO_INFOS_LOCATION:
								maxDigitsOnThisScreen = 13;
								break;
							case RADIO_INFOS_CURRENT_TIME:
								maxDigitsOnThisScreen = 6;
								break;
							default:
								return;// No other screens have key entry
								break;
						}

						if (keypadInputDigitsLength < maxDigitsOnThisScreen)
						{
							const uint8_t MAX_DIGIT_VALUE[3][9] = {
									{ 2, 9, 5, 9, 5, 9, 0, 0, 0 },
									{ 2, 9, 5, 9, 5, 9, 0, 0, 0 },
									{ 2, 9, 5, 9, 5, 9, 0, 0, 0 }
							};
							const uint8_t MAX_YEAR_DIGIT_VALUES[5] = { 2, 0, 4, 9, 1 };
							int maxDigValue = 9;
							int minDigValue = 0;

							switch(displayMode)
							{
								case RADIO_INFOS_DATE:
									switch(keypadInputDigitsLength)
									{
										case 0:
										case 1:
										case 2:
										case 3:
										case 4:
											// Year digits, and first digit of the month
											maxDigValue = MAX_YEAR_DIGIT_VALUES[keypadInputDigitsLength];
											break;
										case 5:
											// second digit of the month
											maxDigValue = (keypadInputDigits[4] == '1') ? 2 : 9;
											if (keypadInputDigits[4] == '0')
											{
												minDigValue = 1;
											}
											break;
										case 6:
											// first digit of the day
											maxDigValue = daysPerMonth[(((keypadInputDigits[4] - '0') * 10) + (keypadInputDigits[5] - '0')) - 1] / 10;
											break;
										case 7:
											{
												// second digit of the day
												uint32_t month = (((keypadInputDigits[4] - '0') * 10) + (keypadInputDigits[5] - '0'));

												if (month == 2)
												{
													// handle leap years
													uint32_t year = 0;
													uint32_t multiplier = 1000;

													for(int i = 0; i < 4; i++)
													{
														year += (keypadInputDigits[i] - '0') * multiplier;
														multiplier /= 10;
													}

													if ((keypadInputDigits[6] - '0') == 2) // 2_: Feb, 28 or 29 days (leap year checking)
													{
														if ((year % 4) == 0)
														{
															maxDigValue = 9;
														}
														else
														{
															maxDigValue = 8;
														}
													}
												}
												else
												{
													if ((keypadInputDigits[6] - '0') < 3)
													{
														maxDigValue = 9;
													}
													else
													{
														maxDigValue = daysPerMonth[month - 1] % 10;
													}
												}

												if (keypadInputDigits[6] == '0')
												{
													minDigValue = 1;
												}
											}
											break;
									}

								break;
								case RADIO_INFOS_LOCATION:

									maxDigValue = 9;// default value if no override is applied below

									switch(keypadInputDigitsLength)
									{
										case 1:
										case 2:
										case 3:
										case 4:
										case 5:
											if (keypadInputDigits[0] == '9')
											{
												maxDigValue = 0;
											}
											break;
										case 6:
											maxDigValue = 1;
											break;
										case 7:
											if (keypadInputDigits[6] == '1')
											{
												maxDigValue = 8;
											}
											break;
										case 8:
										case 9:
										case 10:
										case 11:
										case 12:
											if ((keypadInputDigits[6] == '1') && (keypadInputDigits[7] == '8'))
											{
												maxDigValue = 0;
											}
											break;
									}

									break;
								case RADIO_INFOS_CURRENT_TIME:
									if (keypadInputDigitsLength == 1 && (keypadInputDigits[0] == '2'))
									{
										maxDigValue = 3;
									}
									else
									{
										maxDigValue = MAX_DIGIT_VALUE[0][keypadInputDigitsLength];
									}
									break;
							}

							if ((keyval <=  maxDigValue) && (keyval >= minDigValue))
							{
								char c[2] = {0, 0};
								c[0] = keyval + '0';

								if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
								{
									voicePromptsInit();
									switch(displayMode)
									{
										case RADIO_INFOS_LOCATION:
											switch(keypadInputDigitsLength)
											{
												case 0:
													if (latLonIsSouthernHemisphere)
													{
														voicePromptsAppendPrompt(PROMPT_MINUS);
													}
													break;
												case 5:
													if (latLonIsWesternHemisphere)
													{
														voicePromptsAppendPrompt(PROMPT_MINUS);
													}
													break;
											}
										break;
									}
									voicePromptsAppendString(c);

									switch(displayMode)
									{
										case RADIO_INFOS_LOCATION:
											if ((keypadInputDigitsLength == 1) || (keypadInputDigitsLength == 8))
											{
												voicePromptsAppendPrompt(PROMPT_POINT);
											}
											else if (keypadInputDigitsLength == 5)
											{
												char buf[2] = { 0, 0 };
												buf[0] = LanguageGetSymbol(latLonIsSouthernHemisphere ? SYMBOLS_SOUTH : SYMBOLS_NORTH);
												voicePromptsAppendString(buf);
											}
											else if (keypadInputDigitsLength == 12)
											{
												char buf[2] = { 0, 0 };
												buf[0] = LanguageGetSymbol(latLonIsWesternHemisphere ? SYMBOLS_WEST : SYMBOLS_EAST);
												voicePromptsAppendString(buf);
											}
										break;
									}
									voicePromptsPlay();
								}

								strcat(keypadInputDigits, c);
								keypadInputDigitsLength++;
								updateScreen(ev, true);
								nextKeyBeepMelody = (int *)MELODY_KEY_BEEP;
							}
							else
							{
								if (keypadInputDigitsLength != 0)
								{
									nextKeyBeepMelody = (int *)MELODY_NACK_BEEP;
								}
							}
						}
						else
						{
							nextKeyBeepMelody = (int *)MELODY_NACK_BEEP;
						}
					}
				}
				break;
		}
	}


	if (KEYCHECK_SHORTUP_NUMBER(ev->keys) && (BUTTONCHECK_DOWN(ev, BUTTON_SK2)))
	{
		saveQuickkeyMenuIndex(ev->keys.key, menuSystemGetCurrentMenuNumber(), displayMode, 0);
		return;
	}
}

void menuRadioInfosInit(void)
{
	battSemaphore = xSemaphoreCreateMutex();

	if (battSemaphore == NULL)
	{
		while(true); // Something better maybe ?
	}

	circularBufferInit(&batteryVoltageHistory);
}

// called every 2000 ticks
void menuRadioInfosPushBackVoltage(int32_t voltage)
{
	// Store value each 40k ticks
	if ((battery_stack_iter == 0) || (battery_stack_iter > BATTERY_ITER_PUSHBACK))
	{
		if (xSemaphoreTake(battSemaphore, (TickType_t)10) == pdTRUE)
		{
			circularBufferPushBack(&batteryVoltageHistory, voltage);
			xSemaphoreGive(battSemaphore);
		}

		battery_stack_iter = 0;
	}

	battery_stack_iter++;
}

static void updateVoicePrompts(bool spellIt, bool firstRun)
{
	if (nonVolatileSettings.audioPromptMode >= AUDIO_PROMPT_MODE_VOICE_LEVEL_1)
	{
		char buffer[SCREEN_LINE_BUFFER_SIZE];

		voicePromptsInit();

		if (firstRun)
		{
			voicePromptsAppendPrompt(PROMPT_SILENCE);
			voicePromptsAppendLanguageString(&currentLanguage->radio_info);
			voicePromptsAppendLanguageString(&currentLanguage->menu);
			voicePromptsAppendPrompt(PROMPT_SILENCE);
		}

		switch (displayMode)
		{
			case RADIO_INFOS_BATTERY_LEVEL:
			case RADIO_INFOS_BATTERY_GRAPH:
			{
				int volts, mvolts;

				voicePromptsAppendLanguageString(&currentLanguage->battery);
				getBatteryVoltage(&volts,  &mvolts);
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, " %1d.%1d", volts, mvolts);
				voicePromptsAppendString(buffer);
				voicePromptsAppendPrompt(PROMPT_VOLTS);
				voicePromptsAppendInteger(getBatteryPercentage());
				voicePromptsAppendPrompt(PROMPT_PERCENT);
			}
			break;
			case RADIO_INFOS_TEMPERATURE_LEVEL:
			{
				int temperature = getTemperature();

				voicePromptsAppendLanguageString(&currentLanguage->temperature);
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%d.%1d", (temperature / 10), (temperature % 10));
				voicePromptsAppendString(buffer);
				voicePromptsAppendLanguageString(&currentLanguage->celcius);
			}
			break;
			case RADIO_INFOS_CURRENT_TIME:
				voicePromptsAppendLanguageString(&currentLanguage->time);
				if (!(nonVolatileSettings.timezone & 0x80))
				{
					voicePromptsAppendString("UTC");
				}
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%02u %02u%02u", timeAndDate.tm_hour, timeAndDate.tm_min, timeAndDate.tm_sec);
				voicePromptsAppendString(buffer);
			break;
			case RADIO_INFOS_LOCATION:
				voicePromptsAppendLanguageString(&currentLanguage->location);
				if (nonVolatileSettings.locationLat != SETTINGS_UNITIALISED_LOCATION_LAT)
				{
					char maidenheadBuf[LOCATION_TEXT_BUFFER_SIZE];
					buildLocationTextBuffer(buffer, maidenheadBuf, true);
					voicePromptsAppendString(buffer);
					voicePromptsAppendString(maidenheadBuf);
				}
				else
				{
					voicePromptsAppendLanguageString(&currentLanguage->not_set);
				}
			break;
			case RADIO_INFOS_DATE:
				voicePromptsAppendLanguageString(&currentLanguage->date);
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%04u %02u %02u", (timeAndDate.tm_year + 1900),(timeAndDate.tm_mon + 1),timeAndDate.tm_mday);
				voicePromptsAppendString(buffer);
			break;

			case RADIO_INFOS_UP_TIME:
				voicePromptsAppendLanguageString(&currentLanguage->uptime);
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%u", hours);
				voicePromptsAppendString(buffer);
				voicePromptsAppendLanguageString(&currentLanguage->hours);
				snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%u", minutes);
				voicePromptsAppendString(buffer);
				voicePromptsAppendLanguageString(&currentLanguage->minutes);
			break;
		}

		if (spellIt)
		{
			promptsPlayNotAfterTx();
		}
	}
}

