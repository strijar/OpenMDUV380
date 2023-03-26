/*
 * Copyright (C) 2021-2022 Roger Clark, VK3KYY / G4KYF
 *                         Colin Durbridge, G4EML
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
#include "main.h"
#include "user_interface/uiGlobals.h"
#include "user_interface/uiUtilities.h"
#include "interfaces/gps.h"
#include "user_interface/uiLocalisation.h"
#include "usb/usb_com.h"

gpsData_t gpsData =
{
		.HasFix = false,
		.HasHDOP = false,
		.Latitude = 0U,
		.Longitude = 0U,
		.SatsInViewGP = 0U,
		.SatsInViewBD = 0U,
		.Time = 0U,
		.AccuracyInCm = 0U,
		.HeightInM = 0U,
		.FixType = 0
};

static char gpsLine[GPS_LINE_LENGTH] = {0};
static uint8_t gpsRxBuf[GPS_LINE_LENGTH] = {0};
static bool gpsLineReady;
static uint8_t gpsDMABuf[GPS_DMA_BUFFER_SIZE]; // double buffer (two halves) for GPS UART DMA receive
static size_t gpsCharPointer;
static char gpsLastLine[GPS_LINE_LENGTH];

//#define USE_DUMMY_GPS_DATA
#ifdef USE_DUMMY_GPS_DATA
const char *DUMMY_GPS_DATA[16]={
		"$GNZDA,074101.000,20,09,2022,,*42",
		"$GNGGA,074102.000,3858.1,N,14602.1,E,1,03,4.38,51.4,M,-1.5,M,,*4F",
		"$GPGSA,A,2,29,25,12,,,,,,,,,,4.49,4.38,1.00,1*16",
		"$BDGSA,A,2,,,,,,,,,,,,,4.49,4.38,1.00,4*0D",
		"$GPGSV,2,1,07,29,63,203,24,2,62,148,,25,61,339,24,20,33,129,*48",
		"$GPGSV,2,2,07,12,32,18,25,26,7,220,,23,1,340,*76",
		"$BDGSV,1,1,04,1,47,0,,4,44,22,,3,34,313,,2,12,289,*5D",
		"$GNRMC,074102.000,A,3758.10000,N,14502.10000,E,5.000,275.00,200922,,,A*53",
		"$GNZDA,074101.000,20,09,2022,,*42",
		"$GNGGA,074102.000,3858.10000,S,14502.10000,E,1,03,4.38,51.4,M,-1.5,M,,*4F",
		"$GPGSA,A,2,29,25,12,,,,,,,,,,4.49,4.38,1.00,1*16",
		"$BDGSA,A,2,,,,,,,,,,,,,4.49,4.38,1.00,4*0D",
		"$GPGSV,2,1,07,29,63,203,24,2,62,148,,25,61,339,24,20,33,129,*48",
		"$GPGSV,2,2,07,12,32,18,25,26,7,220,,23,1,340,*76",
		"$BDGSV,1,1,04,1,47,0,,4,44,22,,3,34,313,,2,12,289,*5D",
		"$GNRMC,074102.000,A,3758.00000,N,14502.00000,E,5.000,275.00,200922,,,A*53"
};
int32_t dummyGpsDataIndex = 0;
#endif


// converts the GPS data from the format DDDmm.mmmm   into our custom format Int<<23  + frac*1000
//assumes no leading or trailing spaces
static uint64_t gpsLatLongConvert(const char *input)
{
	uint32_t degrees;
	uint32_t minutes;
	uint8_t decimalpoint = 0;
	uint8_t digitsbeforepoint = 0;
	uint8_t digitsafterpoint = 0;

	for (size_t i = 0; i < strlen(input); i++)					//find the position of the decimal point
	{
		if (input[i] == '.')
		{
			decimalpoint = i;
		}

		if ((input[i] > 47) && (input[i] < 58))					//count the digits
		{
			if (decimalpoint > 0)
			{
				digitsafterpoint++;
			}
			else
			{
				digitsbeforepoint++;
			}
		}
	}

	degrees = 0;
	minutes = 0;
	if(digitsbeforepoint > 4)						//this is a latitude
	{
		degrees = (input[decimalpoint - 5] - 48) * 100;
	}

	if (digitsbeforepoint > 3)
	{
		degrees = degrees + ((input[decimalpoint - 4] - 48) * 10);
	}

	if (digitsbeforepoint > 2)
	{
		degrees = degrees + (input[decimalpoint - 3] - 48);
	}

	if (digitsbeforepoint > 1)
	{
		minutes = (input[decimalpoint - 2] - 48) * 1000000;
	}

	if (digitsbeforepoint > 0)
	{
		minutes = minutes + ((input[decimalpoint - 1] - 48) * 100000);
	}

	if (digitsafterpoint > 0)
	{
		minutes = minutes + ((input[decimalpoint + 1] - 48) * 10000);
	}

	if (digitsafterpoint > 1)
	{
		minutes = minutes + ((input[decimalpoint + 2] - 48) * 1000);
	}

	if (digitsafterpoint > 2)
	{
		minutes = minutes + ((input[decimalpoint + 3] - 48) * 100);
	}

	if (digitsafterpoint > 3)
	{
		minutes = minutes + ((input[decimalpoint + 3] - 48) * 10);
	}

	if (digitsafterpoint > 4)
	{
		minutes = minutes + (input[decimalpoint + 3] - 48);
	}

	return (degrees << 23) + (minutes / 60);
}

static time_t_custom gpsTimeConvert(const char *time, const char *date)
{
	struct tm gpsDateTime;
	uint8_t Date;
	uint8_t Month;
	uint8_t Year;
	uint8_t Hours;
	uint8_t Minutes;
	uint8_t Seconds;

	if (strlen(date) == 6)
	{
		Year = ((date[4] - 48) * 10) + (date[5] - 48);
		Month = ((date[2] - 48) * 10) + (date[3] - 48);
		Date = ((date[0] - 48) * 10) + (date[1] - 48);
	}
	else
	{
		Year = 21;
		Month = 12;
		Date = 25;
	}

	if (Year < 70)
	{
		Year = Year + 100;
	}

	if (strlen(time) >= 6)
	{
		Seconds = ((time[4] - 48) * 10) + (time[5] - 48);
		Minutes = ((time[2] - 48) * 10) + (time[3] - 48);
		Hours = ((time[0] - 48) * 10) + (time[1] - 48);
	}
	else
	{
		Seconds = 0;
		Minutes = 0;
		Hours = 0;
	}

	memset(&gpsDateTime, 0x00, sizeof(struct tm)); // clear entire struct
	gpsDateTime.tm_mday = Date;          /* day of the month, 1 to 31 */
	gpsDateTime.tm_mon = Month - 1;      /* months since January, 0 to 11 */
	gpsDateTime.tm_year = Year;          /* years since 1900 */
	gpsDateTime.tm_hour = Hours;
	gpsDateTime.tm_min = Minutes;
	gpsDateTime.tm_sec = Seconds;

	return mktime_custom(&gpsDateTime);
}

static void getParam(const char *line, char *result, int entryno, int reslen)
{
	int count = 0;
	int respoint = 0;

	for (size_t i = 0; i < strlen(line); i++)
	{
		if (line[i] == ',')
		{
			count++;
			if (count == entryno)
			{
				result[respoint] = 0;
				return;
			}
			else
			{
				respoint = 0;
			}
		}
		else
		{
			result[respoint++] = line[i];
			if (respoint > reslen - 1)
			{
				result[0] = 0;
				return;
			}
		}
	}

	result[0] = 0;
}

static void gpsProcessChar(uint8_t rxchar)
{
	if ((rxchar != 13) && (gpsCharPointer < (GPS_LINE_LENGTH - 2)))
	{
		if (rxchar > 32)
		{
			gpsRxBuf[gpsCharPointer++] = rxchar;
		}
	}
	else
	{

		gpsRxBuf[gpsCharPointer] = 0;
		memcpy(gpsLine, gpsRxBuf, gpsCharPointer + 1);
		gpsCharPointer = 0;
		gpsLineReady = true;
	}
}



void gpsDataInputStartStop(bool enable)
{
	gpsCharPointer = 0U;
	gpsLineReady = false;

	if (enable)
	{
		HAL_UART_Receive_DMA(
	#if defined(PLATFORM_MD9600) || defined(PLATFORM_MDUV380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
				&huart1
	#elif defined(PLATFORM_MD380)
				&huart3
	#endif
				, gpsDMABuf, GPS_DMA_BUFFER_SIZE);

	}
	else
	{
		HAL_UART_DMAStop(
		#if defined(PLATFORM_MD9600) || defined(PLATFORM_MDUV380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)
					&huart1
		#elif defined(PLATFORM_MD380)
					&huart3
		#endif
				);
	}
}

void gpsOn(void)
{
	memset((uint8_t *)&gpsData, 0x00, sizeof(gpsData_t));// reset everything
#if !(defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017))
	gpsPower(true);				//Turn on the power to the GPS module
#endif
	gpsDataInputStartStop(true);
}



void gpsOff(void)
{
#if !(defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017))
	gpsPower(false);//Turn off the power to the GPS module
#endif
	gpsDataInputStartStop(false);
	memset((uint8_t *)&gpsData, 0x00, sizeof(gpsData_t));// reset everything
}

void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart)
{
	for (size_t i = 0; i < 32; i++)
	{
		gpsProcessChar(gpsDMABuf[i]);
	}
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
	/* Debugging only
	 HAL_GPIO_TogglePin(LED_GREEN_GPIO_Port, LED_GREEN_Pin);
	*/

	for (size_t i = 0; i < 32; i++)
	{
		gpsProcessChar(gpsDMABuf[(GPS_DMA_BUFFER_SIZE / 2) + i]);
	}
}

#if defined(PLATFORM_MD9600)
//turn the GPS on and off. Note this also turns the Microphone power on and off, so the GPS must always be On when the radio is in use.
void gpsAndMicPower(bool on)
{
	if (on)
	{
		GPIOA->MODER = (GPIOA->MODER & ~GPIO_MODER_MODER9_Msk) | GPIO_MODER_MODER9_0;     //Set the GPIOA Pin 9 to GPIO mode
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, GPIO_PIN_SET);                               //set it high
	}
	else
	{
		GPIOA->MODER = (GPIOA->MODER & ~GPIO_MODER_MODER9_Msk) | GPIO_MODER_MODER9_0;     // Set the GPIOA Pin 9 to GPIO mode
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, GPIO_PIN_RESET);                             //set it Low
	}
}
#elif defined(PLATFORM_MD380) || defined(PLATFORM_MDUV380)
void gpsPower(bool on)
{
	if (on)
	{
#if defined(PLATFORM_MD380)
		GPIOD->MODER = (GPIOD->MODER & ~GPIO_MODER_MODER8_Msk) | GPIO_MODER_MODER8_0;     //Set the GPIOD Pin 8 to GPIO mode
		HAL_GPIO_WritePin(GPIOD, GPIO_PIN_8, GPIO_PIN_SET);                               //set it high
#else
		GPIOA->MODER = (GPIOA->MODER & ~GPIO_MODER_MODER9_Msk) | GPIO_MODER_MODER9_0;     //Set the GPIOA Pin 9 to GPIO mode
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, GPIO_PIN_SET);                               //set it high
#endif
	}
	else
	{
#if defined(PLATFORM_MD380)
		GPIOD->MODER = (GPIOD->MODER & ~GPIO_MODER_MODER8_Msk) | GPIO_MODER_MODER8_0;     // Set the GPIOD Pin 8 to GPIO mode
		HAL_GPIO_WritePin(GPIOD, GPIO_PIN_8, GPIO_PIN_RESET);                             //set it Low
#else
		GPIOA->MODER = (GPIOA->MODER & ~GPIO_MODER_MODER9_Msk) | GPIO_MODER_MODER9_0;     // Set the GPIOA Pin 9 to GPIO mode
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, GPIO_PIN_RESET);                             //set it Low
#endif
	}
}
#endif



void convertCommasToDelimiters(char* line)
{
    int len = strlen(line);
    for (int i = 0; i < len ; i++)
    {
        if (line[i] == ',' || line[i] == '*')
        {
            line[i] = 0;
        }
    }
}

int getNmeaInt(char* str)
{
    if (strlen(str) > 0)
    {
        return atoi(str);
    }
    else
    {
        return -1;
    }
}

char * populateSatelliteData(char *NMEA, gpsSatellitesData_t* sat)
{
    char* pos = NMEA;

    sat->Number = getNmeaInt(pos);
    pos += strlen(pos) + 1;

    sat->El     = getNmeaInt(pos);
    pos += strlen(pos) + 1;

    sat->Az     = getNmeaInt(pos);
    pos += strlen(pos) + 1;

    sat->RSSI   = getNmeaInt(pos);
    pos += strlen(pos) + 1;

    return pos;
}

int processGSV(char* line, gpsSatellitesData_t satsArr[])
{
    int msgNum;
    int numSats;
    int totalSats;
    int satsIndexOffset;
    char* pos = &line[7];// skip message header

    convertCommasToDelimiters(line);

    //int numMsg = atoi(pos);
    pos += strlen(pos) + 1;
    msgNum = atoi(pos) - 1;
    pos += strlen(pos) + 1;
    totalSats = atoi(pos);
    numSats = totalSats - (msgNum * 4);
    pos += strlen(pos) + 1;

    satsIndexOffset = msgNum * 4;

    if (numSats > 4)
    {
        numSats = 4;
    }

    for (int n = 0; n < numSats; n++)
    {
        pos = populateSatelliteData(pos, &satsArr[n + satsIndexOffset]);
    }

    return totalSats;
}

void gpsTick(void)
{
	char param[6][20];
	char line[20];
	char statusLetter[20];
	char *p;

	if ((menuSystemGetCurrentMenuNumber() != UI_TX_SCREEN) &&
		(nonVolatileSettings.gps >= GPS_MODE_OFF) &&
		((ticksGetMillis()%500) == 0) &&
		(HAL_DMA_GetState(&hdma_usart1_rx) != HAL_DMA_STATE_BUSY))
	{
		gpsDataInputStartStop(true);
	}

	if (gpsLineReady)
	{
		if (nonVolatileSettings.gps == GPS_NOT_DETECTED)
		{
			nonVolatileSettings.gps = GPS_MODE_OFF;
			gpsOff();
			return;
		}

#ifdef USE_DUMMY_GPS_DATA
		strcpy(gpsLine,DUMMY_GPS_DATA[dummyGpsDataIndex % 16]);
		dummyGpsDataIndex++;
#endif

		if (strcmp(gpsLine,gpsLastLine) ==0)
		{
			return;
		}
		strcpy(gpsLastLine,gpsLine);

		gpsData.MessageCount++;

		if (nonVolatileSettings.gps == GPS_MODE_ON_NMEA)
		{
			USB_DEBUG_printf("%s\r\n",gpsLine);// Note. NMEA protocol requires CR LF
		}

		if (strstr(&gpsLine[3], "GGA") != NULL)// message that contains accuracy (HDOP) and altitude
		{

			getParam(gpsLine, line , 9, 20);// get accuracy (HDOP)
			p = strstr(line,".");
			if (p != 0)
			{
				*p = 0;
			}
			gpsData.AccuracyInCm = (atoi(line) * 100) + atoi(p+1);
			gpsData.HasHDOP = true;

			getParam(gpsLine, line , 10, 20);// get height
			char *p = strstr(line,".");
			if (p != 0)
			{
				*p = 0;
			}
			gpsData.HeightInM = atoi(line);

		}

		if (strstr(&gpsLine[3], "RMC") != NULL)			//is this the LAT Long and Time Message?
		{
			// check if it has the date and time.
			getParam(gpsLine, param[0] , 2, 20);			//get parameter 2 which is GMT Time as hhmmss.sss
			getParam(gpsLine, param[5] , 10, 20);	    	//get parameter 10 which is Date as ddmmyy
			if (param[0][0] != 0 && param[5][0] != 0)
			{
				gpsData.Time = gpsTimeConvert(param[0], param[5]);
				gpsData.HasTime = true;
			}

			// Check if it also has the position fix
			getParam(gpsLine, statusLetter , 3, 20);
			if (statusLetter[0] != 'A')
			{
				if (gpsData.HasFix)
				{
					gpsData.HasFix = false;
				}

				return;
			}

			getParam(gpsLine, param[1] , 4, 20);			//get parameter 4 which is Latitude a ddmm.mmmm
			getParam(gpsLine, param[2] , 5, 20);			//get parameter 5 which is N/S
			getParam(gpsLine, param[3] , 6, 20);			//get parameter 6 which is Longitude a dddmm.mmmm
			getParam(gpsLine, param[4] , 7, 20);			//get parameter 7 which is E/W


			if (strlen(param[1]) == 0)
			{
				strcpy(param[1], "0000.00000");
			}

			gpsData.Latitude = gpsLatLongConvert(param[1]);

			if (strstr(param[2], "S") != NULL)
			{
				gpsData.Latitude = gpsData.Latitude | 0x80000000;
			}

			if (strlen(param[3]) == 0)
			{
				strcpy(param[3], "00000.00000");
			}

			gpsData.Longitude = gpsLatLongConvert(param[3]);

			if (strstr(param[4], "W") != NULL)
			{
				gpsData.Longitude = gpsData.Longitude | 0x80000000;
			}


			if ((menuSystemGetCurrentMenuNumber() != UI_TX_SCREEN) &&
				(nonVolatileSettings.locationLat != gpsData.Latitude ||  nonVolatileSettings.locationLon != gpsData.Longitude))
			{
				nonVolatileSettings.locationLat = gpsData.Latitude;
				nonVolatileSettings.locationLon = gpsData.Longitude;
			}

			getParam(gpsLine, line , 8, 20);
			p = strstr(line,".");
			if (p != 0)
			{
				*p = 0;
				gpsData.SpeedKts = atoi(line);
			}

			getParam(gpsLine, line , 9, 20);
			p = strstr(line,".");
			if (p != 0)
			{
				*p = 0;
				gpsData.Direction = atoi(line);
			}

			gpsData.HasTime = true;

			if (gpsData.HasFix == false)
			{
				int menuNumber = menuSystemGetCurrentMenuNumber();
				if  (menuNumber == UI_VFO_MODE || menuNumber == UI_CHANNEL_MODE)
				{
					displayPrintCore(DISPLAY_SIZE_X - 50, DISPLAY_Y_POS_HEADER, currentLanguage->gps, FONT_SIZE_1_BOLD, TEXT_ALIGN_LEFT, false);
					displayRenderRows(0,2);
				}
				gpsData.HasFix = true;
			}
		}
		else
		{
			if (strstr(gpsLine, "$GPGSV") != NULL)
			{
				gpsData.SatsInViewGP = processGSV(gpsLine,gpsData.GPSatellites);
			}
			else
			{
				if (strstr(gpsLine, "$BDGSV") != NULL)
				{
					gpsData.SatsInViewBD = processGSV(gpsLine,gpsData.BDSatellites);
				}
			}
		}

		gpsLineReady = false;
	}
}
