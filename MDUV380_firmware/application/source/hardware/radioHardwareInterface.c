/*
 * Copyright (C) 2021-2022 Roger Clark, VK3KYY / G4KYF
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

#include "hardware/radioHardwareInterface.h"
#include "functions/settings.h"
#include "functions/trx.h"
#include "functions/rxPowerSaving.h"
#include "hardware/HR-C6000.h"
#include "hardware/AT1846S.h"
#if defined(USING_EXTERNAL_DEBUGGER)
#include "SeggerRTT/RTT/SEGGER_RTT.h"
#endif
#include "main.h"
#if defined(PLATFORM_MD9600)
//list of CTCSS tones supported by the HRC6000. These are used to find the index for the tone. The order is critical.
const uint16_t HRC_CTCSSTones[] =
{
		6700,  7190,  7440,  7700,  7970,  8250,  8540,
		8850,  9150,  9480,  9740,  10000, 10350, 10720,
		11090, 11480, 11880, 12300, 12730, 13180, 13650,
		14130, 14620, 15140, 15670, 16220, 16790, 17380,
		17990, 18620, 19280, 20350, 21070, 21810, 22570,
		23360, 24180, 25030, 6930,  6250,  15980, 16550,
		17130, 17730, 18350, 18990, 19660, 19950, 20650,
		22910, 25410
};
#endif
static bool audioPathFromFM = true;


// AT-1846 native values for Rx
static uint8_t fl_l;
static uint8_t fl_h;
static uint8_t fh_l;
static uint8_t fh_h;

static int txPowerLevel = -1;

static bool currentBandWidthIs25kHz = BANDWIDTH_12P5KHZ;

#define DCS_PACKED_DATA_NUM          83
#define DCS_PACKED_DATA_ENTRY_SIZE   3

// 83 * 3 bytes(20 bits packed) of DCS code (9bits) + Golay(11bits).
static const uint8_t DCS_PACKED_DATA[(DCS_PACKED_DATA_NUM * DCS_PACKED_DATA_ENTRY_SIZE)] = {
		0x63,  0x87,  0x09,  0xB7,  0x86,  0x0A,  0x5D,  0x06,  0x0B,  0x1F,  0x85,  0x0C,  0xF5,  0x05,  0x0D,  0xB6,
		0x85,  0x11,  0xFD,  0x80,  0x13,  0xCA,  0x87,  0x14,  0xF4,  0x06,  0x16,  0xD1,  0x85,  0x1A,  0x79,  0x86,
		0x1C,  0x93,  0x06,  0x1D,  0xE6,  0x82,  0x1D,  0x47,  0x07,  0x1E,  0x5E,  0x03,  0x26,  0x2B,  0x87,  0x26,
		0xC1,  0x07,  0x27,  0x7B,  0x80,  0x2A,  0xD3,  0x83,  0x2C,  0x39,  0x03,  0x2D,  0xED,  0x02,  0x2E,  0x7A,
		0x83,  0x31,  0xEC,  0x01,  0x35,  0x4D,  0x84,  0x36,  0xA7,  0x04,  0x37,  0xBC,  0x06,  0x39,  0x1D,  0x83,
		0x3A,  0x5F,  0x00,  0x3D,  0x8B,  0x01,  0x3E,  0xE9,  0x86,  0x42,  0x8E,  0x86,  0x49,  0xB0,  0x07,  0x4B,
		0x5B,  0x84,  0x51,  0xFA,  0x01,  0x52,  0x8F,  0x85,  0x52,  0x27,  0x86,  0x54,  0x77,  0x81,  0x58,  0xE8,
		0x85,  0x59,  0x3C,  0x84,  0x5A,  0x94,  0x87,  0x5C,  0xCF,  0x00,  0x63,  0x8D,  0x83,  0x64,  0xC6,  0x86,
		0x66,  0x3E,  0x82,  0x6C,  0x97,  0x82,  0x71,  0xA9,  0x03,  0x73,  0xEB,  0x80,  0x74,  0x85,  0x06,  0x7A,
		0xF0,  0x82,  0x7A,  0x58,  0x81,  0x7C,  0x76,  0x87,  0x84,  0x9C,  0x07,  0x85,  0xE9,  0x83,  0x85,  0xB9,
		0x84,  0x89,  0xC5,  0x86,  0x8C,  0x2F,  0x06,  0x8D,  0xB8,  0x87,  0x92,  0x7E,  0x02,  0x9A,  0x0B,  0x86,
		0x9A,  0xE1,  0x06,  0x9B,  0xC6,  0x83,  0xA1,  0xF8,  0x02,  0xA3,  0x1B,  0x04,  0xA7,  0xE3,  0x00,  0xAD,
		0x9E,  0x01,  0xB3,  0xC7,  0x80,  0xBA,  0xD9,  0x05,  0xC3,  0x71,  0x06,  0xC5,  0xF5,  0x00,  0xCA,  0x1F,
		0x80,  0xCB,  0x28,  0x87,  0xCC,  0xC2,  0x07,  0xCD,  0xC3,  0x04,  0xD6,  0x47,  0x02,  0xD9,  0x93,  0x03,
		0xDA,  0x2B,  0x82,  0xE1,  0xBD,  0x00,  0xE5,  0x98,  0x83,  0xE9,  0xE4,  0x81,  0xEC,  0x0E,  0x01,  0xED,
		0xDA,  0x00,  0xEE,  0x4D,  0x81,  0xF1,  0x0F,  0x02,  0xF6
};


void radioPowerOn(void)
{
	//Turn off Tx Voltages to prevent transmission.
	HAL_GPIO_WritePin(PA_EN_1_GPIO_Port,PA_EN_1_Pin, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(PA_EN_2_GPIO_Port,PA_EN_2_Pin, GPIO_PIN_RESET);

	//Turn on all receiver voltages. (thats what the TYT firmware does, both receivers are on together)

	if (trxCurrentBand[TRX_RX_FREQ_BAND] == RADIO_BAND_VHF)
	{
		HAL_GPIO_WritePin(R5_V_SW_GPIO_Port, R5_V_SW_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(R5_U_SW_GPIO_Port, R5_U_SW_Pin, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(R5_V_SW_GPIO_Port, R5_V_SW_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(R5_U_SW_GPIO_Port, R5_U_SW_Pin, GPIO_PIN_SET);
	}

	HAL_GPIO_WritePin(C6000_PWD_GPIO_Port, C6000_PWD_Pin, GPIO_PIN_RESET);// Power On the C6000

	//Turn on the Microphone power

	HAL_GPIO_WritePin(MICPWR_SW_GPIO_Port,MICPWR_SW_Pin, GPIO_PIN_SET);
}

void radioPowerOff(bool invalidateFrequency)
{
	//turn off all of the transmitter and receiver voltages
	HAL_GPIO_WritePin(PA_EN_1_GPIO_Port,PA_EN_1_Pin, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(PA_EN_2_GPIO_Port,PA_EN_2_Pin, GPIO_PIN_RESET);

	HAL_GPIO_WritePin(R5_V_SW_GPIO_Port,R5_V_SW_Pin, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(R5_U_SW_GPIO_Port,R5_U_SW_Pin, GPIO_PIN_RESET);

	HAL_GPIO_WritePin(MICPWR_SW_GPIO_Port,MICPWR_SW_Pin, GPIO_PIN_RESET);

	HAL_GPIO_WritePin(C6000_PWD_GPIO_Port, C6000_PWD_Pin, GPIO_PIN_SET);// Power Down the C6000

	// Turn off Rx in AT1846S
	if (currentBandWidthIs25kHz)
	{
		// 25 kHz settings
		radioWriteReg2byte( 0x30, 0x70, 0x06); // RX off
	}
	else
	{
		// 12.5 kHz settings
		radioWriteReg2byte( 0x30, 0x40, 0x06); // RX off
	}

	if (invalidateFrequency)
	{
		trxInvalidateCurrentFrequency();
	}
}

void radioInit(void)
{
	AT1846sInit();

}

void radioPostinit(void)
{
	AT1846sPostInit();
}

void radioSetBandwidth(bool Is25K)
{
	AT1846sSetBandWidth(Is25K);
}

void radioSetMode(int mode) // Called withing trx.c: in task critical sections
{

	if (mode == RADIO_MODE_ANALOG)
	{
		HRC6000SetFMRx();
	}
	else
	{
		HRC6000SetDMR();
	}
	AT1846sSetMode(mode);
}

void radioReadVoxAndMicStrength(void)
{

	trxTxVox = adcGetVOX();					//MDUV380 Mic is not connected to AT1846 but has dedicated ADC channel like MD9600
	trxTxMic = trxTxVox;					//MDUV380 doesn't have separate Signals so use Vox for both.

}

static void trxUpdateAT1846SCalibration(void)
{
//Nothing needed on the MDUV380
}


void radioSetFrequency(uint32_t f_in, bool Tx)
{

// G4EML.  Hack to fix the -3KHz offset on transmit on the MDUV380
// Believed to be caused by something in the AT1846S configuration.
// If we ever fix what is causing it then this hack can be removed.
	if(Tx)
	{
		f_in=f_in+300;				//add 3Khz to Tx frequency
	}
//

	if (currentChannelData->libreDMR_Power != 0x00)
	{
		txPowerLevel = currentChannelData->libreDMR_Power - 1;
	}
	else
	{
		txPowerLevel = nonVolatileSettings.txPowerLevel;
	}


	if (Tx)
	{
		trxCurrentBand[TRX_TX_FREQ_BAND] = trxGetBandFromFrequency(f_in);
	}
	else
	{
		trxCurrentBand[TRX_RX_FREQ_BAND] = trxGetBandFromFrequency(f_in);
		if (trxCurrentBand[TRX_RX_FREQ_BAND] == RADIO_BAND_VHF)
		{
			HAL_GPIO_WritePin(R5_V_SW_GPIO_Port, R5_V_SW_Pin, GPIO_PIN_SET);
			HAL_GPIO_WritePin(R5_U_SW_GPIO_Port, R5_U_SW_Pin, GPIO_PIN_RESET);
		}
		else
		{
			HAL_GPIO_WritePin(R5_V_SW_GPIO_Port, R5_V_SW_Pin, GPIO_PIN_RESET);
			HAL_GPIO_WritePin(R5_U_SW_GPIO_Port, R5_U_SW_Pin, GPIO_PIN_SET);
		}
	}

	uint32_t f = f_in * 0.16f;
	fl_l = (f & 0x000000ff) >> 0;
	fl_h = (f & 0x0000ff00) >> 8;
	fh_l = (f & 0x00ff0000) >> 16;
	fh_h = (f & 0xff000000) >> 24;

	if (currentBandWidthIs25kHz)
	{
		// 25 kHz settings
		radioWriteReg2byte( 0x30, 0x70, 0x06); // RX off
	}
	else
	{
		// 12.5 kHz settings
		radioWriteReg2byte( 0x30, 0x60, 0x06); // RX off
	}
	radioWriteReg2byte( 0x05, 0x87, 0x63); // select 'normal' frequency mode

	radioWriteReg2byte( 0x29, fh_h, fh_l);
	radioWriteReg2byte( 0x2a, fl_h, fl_l);
	radioWriteReg2byte( 0x49, 0x0C, 0x15); // setting SQ open and shut threshold

	if (currentBandWidthIs25kHz)
	{
		// 25 kHz settings
		radioWriteReg2byte( 0x30, 0x70, 0x26); // RX on
	}
	else
	{
		// 12.5 kHz settings
		radioWriteReg2byte( 0x30, 0x60, 0x26); // RX on
	}

	trxUpdateAT1846SCalibration();


	if (Tx) 						//We have just set the Tx frequency so we are about to transmit. Set the Tx Power Control DAC (Shared with VHF Receive Tuning)
	{
		dac_Out(1, txDACDrivePower);
	}
	else
	{
		dac_Out(1, 0);
	}
}

void radioSetIF(int band, bool wide)
{
	radioSetBandwidth(wide);
}


void radioSetTx(uint8_t band)
{
	//Turn off receiver voltages. (thats what the TYT firmware does, both receivers are on or off together)
	HAL_GPIO_WritePin(R5_V_SW_GPIO_Port, R5_V_SW_Pin, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(R5_U_SW_GPIO_Port, R5_U_SW_Pin, GPIO_PIN_RESET);

	//Configure HRC-6000 for transmit
	if (trxGetMode() == RADIO_MODE_ANALOG)
	{

		HRC6000SetFMTx();

		if (currentBandWidthIs25kHz)
		{
			radioWriteReg2byte( 0x30, 0x70, 0x46); // 25 kHz settings // RX on
		}
		else
		{
			radioWriteReg2byte( 0x30, 0x60, 0x46); // 12.5 kHz settings // RX on
		}

		trxSelectVoiceChannel(AT1846_VOICE_CHANNEL_MIC);// For 1750 tone burst
		//trxSelectVoiceChannel(AT1846_VOICE_CHANNEL_NONE);//  the MDUV380 does not use the AT1846S for modulation.
		trxSetMicGainFM(nonVolatileSettings.micGainFM);
	}
	else
	{
		HRC6000SetDMR();

		radioWriteReg2byte( 0x30, 0x60, 0xC6); // Digital Tx

	}

	//Turn on Tx Voltage for the current band.
	HAL_GPIO_WritePin(PA_EN_1_GPIO_Port, PA_EN_1_Pin, GPIO_PIN_SET);

	if (band == RADIO_BAND_VHF)
	{
		HAL_GPIO_WritePin(PA_SEL_SW_GPIO_Port, PA_SEL_SW_Pin, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(PA_SEL_SW_GPIO_Port, PA_SEL_SW_Pin, GPIO_PIN_SET);
	}

	//Turn on the power control circuit

	HAL_GPIO_WritePin(PA_EN_2_GPIO_Port, PA_EN_2_Pin, GPIO_PIN_SET);
	trxIsTransmitting = true;
}

//just enable or disable the RF output . doesn't change back to receive
void radioFastTx(bool tx)
{

	if(tx)
	{
		radioWriteReg2byte( 0x30, 0x60, 0xC6); // Digital Tx

		HAL_GPIO_WritePin(PA_EN_1_GPIO_Port, PA_EN_1_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(PA_EN_2_GPIO_Port, PA_EN_2_Pin, GPIO_PIN_SET);
	}
	else
	{

		//Turn off Tx Voltages to prevent transmission.

		HAL_GPIO_WritePin(PA_EN_1_GPIO_Port, PA_EN_1_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(PA_EN_2_GPIO_Port, PA_EN_2_Pin, GPIO_PIN_RESET);

		if (currentBandWidthIs25kHz)
		{
			// 25 kHz settings
			radioWriteReg2byte( 0x30, 0x70, 0x26); // RX on
		}
		else
		{
			// 12.5 kHz settings
			radioWriteReg2byte( 0x30, 0x60, 0x26); // RX on
		}
	}
}

void radioSetRx(uint8_t band)
{
	//Turn off the power control circuit
	//HAL_GPIO_WritePin(RF_APC_SW_GPIO_Port, RF_APC_SW_Pin, GPIO_PIN_RESET);

	//Turn off Tx Voltages to prevent transmission.

	HAL_GPIO_WritePin(PA_EN_1_GPIO_Port, PA_EN_1_Pin, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(PA_EN_2_GPIO_Port, PA_EN_2_Pin, GPIO_PIN_RESET);

	//Turn on receiver voltages. (thats what the TYT firmware does, both receivers are on together)


	if (trxCurrentBand[TRX_RX_FREQ_BAND] == RADIO_BAND_VHF)
	{
		HAL_GPIO_WritePin(R5_V_SW_GPIO_Port, R5_V_SW_Pin, GPIO_PIN_SET);
		HAL_GPIO_WritePin(R5_U_SW_GPIO_Port, R5_U_SW_Pin, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(R5_V_SW_GPIO_Port, R5_V_SW_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(R5_U_SW_GPIO_Port, R5_U_SW_Pin, GPIO_PIN_SET);
	}

	trxIsTransmitting = false;

	if (currentBandWidthIs25kHz)
	{
		// 25 kHz settings
		radioWriteReg2byte( 0x30, 0x70, 0x26); // RX on
	}
	else
	{
		// 12.5 kHz settings
		radioWriteReg2byte( 0x30, 0x60, 0x26); // RX on
	}

	if (trxGetMode() == RADIO_MODE_ANALOG)
	{
		HRC6000SetFMRx();
	}
	else
	{
		HRC6000SetDMR();
	}
}


void radioReadRSSIAndNoiseForBand(uint8_t band)
{
	uint8_t val1, val2;
	(void) band;// not band specific on the MDUV380

	if (rxPowerSavingIsRxOn())
	{
		if (radioReadReg2byte(0x1b, &val1, &val2))
		{
			trxRxSignal = val1;
			trxRxNoise = val2;
		}
		trxDMRSynchronisedRSSIReadPending = false;
	}
}


void radioRxCSSOff(void)
{
	//turn off the receive CTCSS detection;
	radioWriteReg2byte(0x4d, 0x00, 0x00);
}

#if defined(PLATFORM_MD9600)
static int getCSSToneIndex(uint16_t tone)
{
	//the TYT firmware uses a PWM output to directly generate the CTCSS Tone.
	//however the HR-C6000 can also generate tones so we will use that instead
	//this uses a table so we need to convert the CTCSS tone to the Table Index.
	uint8_t HRCToneIndex = 1;

	for (int i = 0; i < ARRAY_SIZE(HRC_CTCSSTones); i++)
	{
		if (HRC_CTCSSTones[i] == tone)
		{
			HRCToneIndex = i + 1;
			break;
		}
	}

	return HRCToneIndex;
}
#endif
void radioRxCSSOn(uint16_t tone)
{
	int threshold = (25000 - tone) / 1000;  // adjust threshold value to match tone frequency.
	if (tone > 24000)
	{
		threshold = 1;
	}
	radioWriteReg2byte(0x4d, (tone >> 8) & 0xff, (tone & 0xff));
	//set the detection thresholds
	radioWriteReg2byte(0x5b, (threshold & 0xFF), (threshold & 0xFF));
	//set detection to CTCSS2
	radioSetClearReg2byteWithMask(0x3a, 0xFF, 0xE0, 0x00, 0x08);
}

void radioRxDCSOn(uint16_t code, bool inverted)
{
	// Set the CTCSS1 Register to 134.4Hz (DCS data rate)
	radioWriteReg2byte(0x4a, (TRX_DCS_TONE >> 8) & 0xff, TRX_DCS_TONE & 0xff);
	// Zero the CTCSS2 Register
	radioWriteReg2byte(0x4d, 0x00, 0x00);

	// The AT1846S wants the Golay{23,12} encoding of the DCS code, rather than just the code itself.
	uint32_t encoded = dcsGetBitPatternFromCode(code);
	radioWriteReg2byte(0x4b, 0x00, (encoded >> 16) & 0xff);           // init cdcss_code
	radioWriteReg2byte(0x4c, (encoded >> 8) & 0xff, encoded & 0xff);  // init cdcss_code

	uint8_t reg4e_high = ((inverted) ? 0x05 : 0x04);
	uint8_t reg3a_low = ((inverted) ? 0x02 : 0x04);
	// The cdcss_sel bits have to be set for DCS receive to work
	radioSetClearReg2byteWithMask(0x4e, 0x38, 0x3F, reg4e_high, 0x00); // enable transmit DCS
	radioSetClearReg2byteWithMask(0x3a, 0xFF, 0xE0, 0x00, reg3a_low); // enable receive DCS
}

// Lookup for Golay pattern, then returns the full bit pattern for given DCS code
uint32_t dcsGetBitPatternFromCode(uint16_t dcs)
{
	uint16_t startPos = 0;
	uint16_t endPos = (DCS_PACKED_DATA_NUM - 1);
	uint16_t curPos;
	uint8_t *p = (uint8_t *)DCS_PACKED_DATA;

	while (startPos <= endPos)
	{
		curPos = (startPos + endPos) >> 1;

		uint32_t entry = *(uint32_t *)(p + (DCS_PACKED_DATA_ENTRY_SIZE * curPos)) & 0x00FFFFFF;
		uint16_t foundCode = (entry >> 15) & 0x1FF;

		if (foundCode < dcs)
		{
			startPos = curPos + 1;
		}
		else if (foundCode > dcs)
		{
			endPos = curPos - 1;
		}
		else
		{
			return (((entry & 0x7FF) << 12) | 0x800 | dcs);
		}
	}

	return 0x00;
}

void radioTxCSSOff(void)
{
	AT1846SSetTxCSS_DCS(0);
}

void radioTxCSSOn(uint16_t tone)
{
	AT1846SSetTxCSS_DCS(tone);
}

void radioTxDCSOn(uint16_t tone)
{
#if defined(PLATFORM_MDUV380) || defined(PLATFORM_DM1701) || defined(PLATFORM_MD2017)

	AT1846SSetTxCSS_DCS(tone);

#else

	// 		The HRC-6000 in the MD-9600 does the Golay encoding for us.
	CodeplugCSSTypes_t type = codeplugGetCSSType(tone);
	uint16_t code = convertCSSNative2BinaryCodedOctal(tone & ~CSS_TYPE_DCS_MASK);
	if(type & CSS_TYPE_DCS_INVERTED)
	{
		radioTxDCSOn(code, false);
	}
	else
	{
		radioTxDCSOn(code, true);
	}
#endif
}

bool radioCheckCSS(void)
{
	//test if CTCSS or DCS is being received and return true if it is
	uint8_t FlagsH;
	uint8_t FlagsL;
	bool retval;

	retval = radioReadReg2byte(0x1c, &FlagsH, &FlagsL);

	return (retval && ((FlagsH & 0x01) || ((FlagsL & 0x05) == 0x05)));
}

void radioSetTone1(int tonefreq)
{
	HRC6000SendTone(tonefreq);
}

void radioSetMicGainFM(uint8_t gain)
{
	HRC6000SetMicGainFM(gain);
}

void radioAudioAmp(bool on)
{
	HAL_GPIO_WritePin(AUDIO_AMP_EN_GPIO_Port, AUDIO_AMP_EN_Pin, on?GPIO_PIN_SET:GPIO_PIN_RESET);				//Turn on the audio amp.
	HAL_GPIO_WritePin(SPK_MUTE_GPIO_Port, SPK_MUTE_Pin, on?GPIO_PIN_RESET:GPIO_PIN_SET);						//Unmute the speaker
}

void radioSetAudioPath(bool fromFM)
{
	audioPathFromFM = fromFM;
	if(audioPathFromFM)
	{
	   HRC6000SetFmAudio(true);
	}
	else
	{
	   HRC6000SetFmAudio(false);
	}
}



