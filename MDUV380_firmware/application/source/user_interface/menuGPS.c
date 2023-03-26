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
#include "main.h"
#include "functions/settings.h"
#include "user_interface/menuSystem.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/uiLocalisation.h"
#include "interfaces/gps.h"

static void updateScreen(bool isFirstRun);
static void handleEvent(uiEvent_t *ev);
static void displayGPSData(bool isFirstRun);
static void displayCoords(bool isFirstRun);
static int displayBars(gpsSatellitesData_t satellitesArray[],int dispPosition, float spacing, uint32_t barColour);
static void displayRSSI(void);
static void displaySatellitesPolar(gpsSatellitesData_t satellitesArray[]);
static void displayPolar(void);

static const int POLAR_GRAPHICS_X_OFFSET  = 0;
static const int POLAR_GRAPHICS_Y_OFFSET  = 72;
static menuStatus_t menuZoneExitCode = MENU_STATUS_SUCCESS;
static uint32_t updateTick = 0;
static bool lastFixStatus = false;
static int displayPage = 0;

#if defined(PLATFORM_MDUV380) || defined(PLATFORM_MD380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
				static const int MAX_RADIUS = 44;
#else
				static const int MAX_RADIUS = ((DISPLAY_SIZE_Y / 2) - 4);
#endif

menuStatus_t menuGPS(uiEvent_t *ev, bool isFirstRun)
{
	if (isFirstRun)
	{
		lastFixStatus = gpsData.HasFix;
		voicePromptsInit();
		voicePromptsAppendPrompt(PROMPT_SILENCE);
		voicePromptsAppendLanguageString(&currentLanguage->gps);
		voicePromptsAppendLanguageString(&currentLanguage->menu);
		voicePromptsAppendPrompt(PROMPT_SILENCE);

		updateScreen(true);

		return (MENU_STATUS_LIST_TYPE | MENU_STATUS_SUCCESS);
	}
	else
	{
		menuZoneExitCode = MENU_STATUS_SUCCESS;

		if (ev->hasEvent)
		{
			handleEvent(ev);
		}
		else
		{
			if ((updateTick % 1000) == 0)
			{
				updateScreen(false);
			}
			updateTick++;
		}
	}
	return menuZoneExitCode;
}

/*
static int countSatellites(gpsSatellitesData_t satellitesArray[])
{
	int count = 0;
    for (int i = 0; i < 32; i++)
    {
    	if (satellitesArray[i].Number != 0)
		{
			count++;
		}
    }
    return count;
}*/

static int displayBars(gpsSatellitesData_t satellitesArray[],int dispPosition, float spacing, uint32_t barColour)
{
	char buf[3];
	const int Y_POS = 120;
	int lastNumber = -1;

    for (int i = 0; ((i < 32) && (satellitesArray[i].Number != 0) && (satellitesArray[i].Number != lastNumber)); i++)
    {
		lastNumber = satellitesArray[i].Number;

    	if (satellitesArray[i].RSSI > 0)
    	{
			int xPos = 2 + dispPosition * spacing;
			if (xPos > (DISPLAY_SIZE_X - spacing + 2))
			{
				break;
			}

			int rssi = satellitesArray[i].RSSI;

			sprintf(buf, "%d", satellitesArray[i].Number%10);
			displayPrintAt(xPos + 1, Y_POS, buf, FONT_SIZE_1);

			sprintf(buf, "%d", satellitesArray[i].Number/10);
			displayPrintAt(xPos + 1, Y_POS - 8, buf, FONT_SIZE_1);

			displaySetForegroundColour(barColour);
			displayFillRect(xPos, 120 - 12  - 2 - rssi, spacing - 2, rssi, false);
			displaySetToDefaultForegroundColour();

			dispPosition++;
			if (dispPosition > 15)
			{
				return dispPosition;
			}
    	}

    }
    return dispPosition;
}

static void displayRSSI(void)
{
	float spacing = 10;
	int dispPosition = 0;

	for(int i = 0;i < 16; i++)
	{
		int xPos = 2 + (i * spacing);
		displayFillRect(xPos, 120 - 12 - 2, spacing - 2, 2, false);
	}

	if ((gpsData.SatsInViewGP + gpsData.SatsInViewBD) > 0)
	{
		dispPosition = displayBars(gpsData.GPSatellites, dispPosition, spacing, 0x0000FF);
		displayBars(gpsData.BDSatellites, dispPosition, spacing, 0xFF0000);
	}
}

static void displaySatellitesPolar(gpsSatellitesData_t satellitesArray[])
{
	float az,elFactor,s,c;
	int x, y;
	const int DOT_RADIUS = 2;

	for (int i = 0; ((i < 32) && (satellitesArray[i].Number != 0)); i++)
    {


    	if (satellitesArray[i].RSSI > 0)
    	{
    		az = (M_PI * satellitesArray[i].Az) / 180.0;

    		if (satellitesArray[i].El <= 0)
    		{
        		elFactor = 0;// put in the middle of the screen if there is no real elevation data
    		}
    		else
    		{
        		elFactor = (1 - (fabs(satellitesArray[i].El) / 90)) * MAX_RADIUS;
    		}

    		s = sin(az);
    		c = cos(az);
    		x = POLAR_GRAPHICS_X_OFFSET + (DISPLAY_SIZE_X / 2) + (s * elFactor);
    		y = POLAR_GRAPHICS_Y_OFFSET - (c * elFactor);
    		displayFillCircle(x, y , (DOT_RADIUS+1), true);
    	}
    }
}

static void displayPolar(void)
{
	displayDrawCircle(POLAR_GRAPHICS_X_OFFSET + (DISPLAY_SIZE_X / 2), POLAR_GRAPHICS_Y_OFFSET, MAX_RADIUS, true);
	displayDrawCircle(POLAR_GRAPHICS_X_OFFSET + (DISPLAY_SIZE_X / 2), POLAR_GRAPHICS_Y_OFFSET, (MAX_RADIUS / 3 ) * 2, true);
	displayDrawCircle(POLAR_GRAPHICS_X_OFFSET + (DISPLAY_SIZE_X / 2), POLAR_GRAPHICS_Y_OFFSET, (MAX_RADIUS / 3 ), true);

	displayDrawFastVLine(POLAR_GRAPHICS_X_OFFSET + (DISPLAY_SIZE_X / 2),
			(POLAR_GRAPHICS_Y_OFFSET) - (MAX_RADIUS + 4), (MAX_RADIUS + 4) * 2, true);
	displayDrawFastHLine((POLAR_GRAPHICS_X_OFFSET + (DISPLAY_SIZE_X / 2)) - (MAX_RADIUS + 4),
			(POLAR_GRAPHICS_Y_OFFSET), (MAX_RADIUS + 4) * 2, true);

	if ((gpsData.SatsInViewGP + gpsData.SatsInViewBD) > 0)
	{
		displaySetForegroundColour(0x0000FF);
		displaySatellitesPolar(gpsData.GPSatellites);
		displaySetForegroundColour(0xFF0000);
		displaySatellitesPolar(gpsData.BDSatellites);
		displaySetToDefaultForegroundColour();
	}
}

static void displayCoords(bool isFirstRun)
{
	char buffer[64];

	if (gpsData.HasFix)
	{
		uint32_t intPartLat = (gpsData.Latitude & 0x7FFFFFFF) >> 23;
		uint32_t decPartLat = (gpsData.Latitude & 0x7FFFFF)/10;// convert from 5DP to 4DP for display
		bool southernHemisphere = false;
		bool westernHemisphere = false;

		if (gpsData.Latitude & 0x80000000)
		{
			southernHemisphere = true;
		}

		uint32_t intPartLon = (gpsData.Longitude & 0x7FFFFFFF) >> 23;
		uint32_t decPartLon = (gpsData.Longitude & 0x7FFFFF)/10;// convert from 5DP to 4DP for display

		if (gpsData.Longitude & 0x80000000)
		{
			westernHemisphere = true;
		}

		snprintf(buffer, 20, "%02u.%04u%c %03u.%04u%c",
				intPartLat, decPartLat, LanguageGetSymbol(southernHemisphere ? SYMBOLS_SOUTH : SYMBOLS_NORTH),
				intPartLon, decPartLon, LanguageGetSymbol(westernHemisphere ? SYMBOLS_WEST : SYMBOLS_EAST));

		if (!isFirstRun && (lastFixStatus != gpsData.HasFix))
		{
			voicePromptsInit();
		}

		if (isFirstRun || (lastFixStatus != gpsData.HasFix))
		{
			voicePromptsAppendString(buffer);
		}

		displayPrintAt(0, 16, buffer, FONT_SIZE_3);

		snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%s:%dm", currentLanguage->altitude, gpsData.HeightInM);
		displayPrintCore(0, 32, buffer, FONT_SIZE_3, TEXT_ALIGN_LEFT, false);

		if (isFirstRun || (lastFixStatus != gpsData.HasFix))
		{
			voicePromptsAppendLanguageString(&currentLanguage->altitude);
			snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "%d", gpsData.HeightInM);
			voicePromptsAppendString(buffer);
		}

		snprintf(buffer, SCREEN_LINE_BUFFER_SIZE, "+/-:%dm",gpsData.AccuracyInCm/100);
		displayPrintCore(0, 32, buffer, FONT_SIZE_3, TEXT_ALIGN_RIGHT, false);
	}
	else
	{
		strcpy(buffer, currentLanguage->gps_acquiring);
		displayPrintCentered(16, buffer, FONT_SIZE_3);

		if (isFirstRun)
		{
			voicePromptsAppendLanguageString(&currentLanguage->gps_acquiring);
		}
	}
}

static void displayGPSData(bool isFirstRun)
{
	char buffer[64];

	if (nonVolatileSettings.gps > GPS_MODE_OFF)
	{
		switch(displayPage)
		{
			case 0:
				displayCoords(isFirstRun);
				displayRSSI();
				break;
			case 1:
				displayPolar();
				break;
		}
	}
	else
	{

		if (nonVolatileSettings.gps == GPS_MODE_OFF)
		{
			sprintf(buffer,"%s %s", currentLanguage->gps, currentLanguage->off);
			displayPrintCentered(16, buffer, FONT_SIZE_3);

			if (isFirstRun)
			{
				voicePromptsAppendLanguageString(&currentLanguage->gps);
				voicePromptsAppendLanguageString(&currentLanguage->off);
			}
		}
		else
		{
			sprintf(buffer,"%s %s", currentLanguage->no, currentLanguage->gps);
			displayPrintCentered(16, buffer, FONT_SIZE_3);

			if (isFirstRun)
			{
				voicePromptsAppendLanguageString(&currentLanguage->no);
				voicePromptsAppendLanguageString(&currentLanguage->gps);
			}
		}
	}

	if (isFirstRun || (lastFixStatus != gpsData.HasFix))
	{
		voicePromptsPlay();
		lastFixStatus = gpsData.HasFix;
	}

}

static void updateScreen(bool isFirstRun)
{
	char buffer[16];
	displayClearBuf();
	menuDisplayTitle(currentLanguage->gps);

	sprintf(buffer,"%d/2", (displayPage + 1));
	displayPrintCore(0, 3, buffer, FONT_SIZE_1, TEXT_ALIGN_RIGHT, false);

#if false
/* Debugging only */
 	sprintf(buffer,"#%u",gpsData.MessageCount);
	displayPrintAt(2, 2, buffer, FONT_SIZE_1);
#endif
	displayGPSData(isFirstRun);
	displayRender();
}

static void handleEvent(uiEvent_t *ev)
{
	if (ev->events & BUTTON_EVENT)
	{
		if (repeatVoicePromptOnSK1(ev))
		{
			return;
		}
	}

	if (KEYCHECK_SHORTUP(ev->keys, KEY_UP))
	{
		if (displayPage > 0)
		{
			displayPage--;
			updateScreen(false);
		}
		return;
	}

	if (KEYCHECK_SHORTUP(ev->keys, KEY_DOWN))
	{
		if (displayPage < 1)
		{
			displayPage++;
			updateScreen(false);
		}
		return;
	}

	if (KEYCHECK_SHORTUP(ev->keys, KEY_GREEN) && (gpsData.HasFix == true))
	{
		uiDataGlobal.dateTimeSecs = gpsData.Time;
		setRtc_custom(uiDataGlobal.dateTimeSecs);
		nextKeyBeepMelody = (int *)MELODY_ACK_BEEP;
		return;
	}

	if (KEYCHECK_SHORTUP(ev->keys, KEY_RED))
	{
		menuSystemPopPreviousMenu();
		return;
	}
}

