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

#ifndef _OPENGD77_GPS_H_
#define _OPENGD77_GPS_H_


#define GPS_LINE_LENGTH         80U
#define GPS_DMA_BUFFER_SIZE     64U

typedef struct
{
    uint16_t	Number;
    int16_t		El;
    int16_t 	Az;
    int8_t		RSSI;
} gpsSatellitesData_t;

typedef struct
{
	bool HasTime;
	bool HasFix;
	bool HasHDOP;// Accuracy
	uint64_t Latitude;
	uint64_t Longitude;
	time_t_custom Time;
	uint16_t SatsInViewGP;
	uint16_t SatsInViewBD;
	gpsSatellitesData_t GPSatellites[32];
	gpsSatellitesData_t BDSatellites[32];
	char NmeaLine[GPS_LINE_LENGTH];
	uint16_t AccuracyInCm;
	int16_t HeightInM;// Its possible to be below sea level in some places in the world
	uint16_t Direction;
	uint16_t SpeedKts;
	uint8_t FixType;// None or 2D or 3D
	uint32_t MessageCount;
	bool uartDmaNeedsRestart;
} gpsData_t;

extern gpsData_t gpsData;


void gpsTick(void);
void gpsOff(void);
void gpsOn(void);
#if defined(PLATFORM_MD9600)
void gpsAndMicPower(bool on);
#elif defined(PLATFORM_MD380) || defined(PLATFORM_MDUV380) 
void gpsPower(bool on);
#endif
void gpsDataInputStartStop(bool enable);


#endif /* _OPENGD77_GPS_H_ */
