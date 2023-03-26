/*
 * Copyright (C) 2019      Kai Ludwig, DG4KLU
 * Copyright (C) 2019-2023 Roger Clark, VK3KYY / G4KYF
 *                         Colin, G4EML
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

#include "hardware/AT1846S.h"
#include "hardware/radioHardwareInterface.h"

typedef struct
{
	bool cached[2];
	uint8_t lowByte[2];
	uint8_t highByte[2];
} RegCache_t;

static RegCache_t registerCache[127];// all values will be initialised to false,0,0 because its a global
static int currentRegisterBank = 0;

//Modified to replicate the values used on the MDUV380 G4EML

static const uint8_t AT1846InitSettings[][AT1846_BYTES_PER_COMMAND] = {
		{0x30, 0x00, 0x04}, // Poweron 1846s
		{0x04, 0x0F, 0xD0}, // Clock mode 25.6MHz/26MHz
		{0x0A, 0x7C, 0x20}, // Default Value
		{0x13, 0xA1, 0x00}, // Unknown Register
		{0x1F, 0x10, 0x01}, // gpio6 = sq out, GPIO1=CSS_OUT
		{0x31, 0x00, 0x31}, // UNDOCUMENTED - use recommended value
		{0x33, 0x44, 0xA5}, // agc number
		{0x34, 0x2B, 0x89}, // Rx digital gain (recommend value)
		{0x41, 0x41, 0x22}, // Digital voice gain, (bits 6:0) however default value is supposed to be 0x4006 hence some bits are being set outside the documented range
		{0x42, 0x10, 0x52}, // RDA1846 lists this as Vox Shut threshold
		{0x43, 0x01, 0x00}, // FM deviation
		{0x44, 0x07, 0xFF}, // Rx and tx gain controls
		{0x3A, 0x00, 0xC3}, // SQL Config
		{0x59, 0x0B, 0x90}, // Deviation settings
		{0x47, 0x7F, 0x2F}, // UNDOCUMENTED - UV82 and GD77 use the same values
		{0x4F, 0x2C, 0x62}, // Undocumented
		{0x53, 0x00, 0x94}, // UNDOCUMENTED - use recommended value
		{0x54, 0x2A, 0x3C}, // UNDOCUMENTED - use recommended value
		{0x55, 0x00, 0x81}, // UNDOCUMENTED - use recommended value
		{0x56, 0x0B, 0x02}, // SQ detection time (SQ setting)
		{0x57, 0x1C, 0x00}, // bypass rssi_lpfilter
		{0x58, 0x9C, 0xDD}, // Filters custom setting
		{0x5A, 0x06, 0xDB}, // Unknown
		{0x63, 0x16, 0xAD}, // Pre_emphasis bypass threshold (recommended value)
		{0x0F, 0x8A, 0x24}, // Unknown
		{0x05, 0x87, 0x63}, // Unknown

/*these settings are for the DTMF. Probably not needed on the UV380 as we use the HRC6000 for DTMF
		{0x67, 0x06, 0x28}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x68, 0x05, 0xE5}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x69, 0x05, 0x55}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x6A, 0x04, 0xB8}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x6B, 0x02, 0xFE}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x6C, 0x01, 0xDD}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x6D, 0x00, 0xB1}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x6E, 0x0F, 0x82}, // Set DTMF Tone (Probably not needed on the UV380)
		{0x6F, 0x01, 0x7A}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
		{0x70, 0x00, 0x4C}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
		{0x71, 0x0F, 0x1D}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
		{0x72, 0x0D, 0x91}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
		{0x73, 0x0A, 0x3E}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
		{0x74, 0x09, 0x0F}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
		{0x75, 0x08, 0x33}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
		{0x76, 0x08, 0x06}, // Set DTMF 2nd Harmonic (Probably not needed on the UV380)
*/
		{0x30, 0x40, 0xA4}, // Setup to calibrate

};



static const uint8_t AT1846PostinitSettings[][AT1846_BYTES_PER_COMMAND] = {
		{0x15, 0x11, 0x00} // IF tuning bits (12:9)
		};


const uint8_t AT1846FM12P5kHzSettings[][AT1846_BYTES_PER_COMMAND] = {
		{0x3A, 0x44, 0xCB}, // 12.5 kHz settings
		{0x15, 0x11, 0x00}, // IF tuning bits (12:9)
		{0x32, 0x44, 0x95}, // agc target power
		{0x3A, 0x00, 0xC3}, // modu_det_sel (SQ setting)
		{0x59, 0x0B, 0x90}, // Deviation settings
		{0x3F, 0x29, 0xD1}, // Rssi3_th (SQ setting)
		{0x3C, 0x1B, 0x34}, // Pk_det_th (SQ setting)
		{0x48, 0x19, 0xB1}, // noise1_th (SQ setting)
		{0x60, 0x0F, 0x17}, // noise2_th (SQ setting)
		{0x62, 0x14, 0x25}, // modu_det_th (SQ setting)
		{0x65, 0x24, 0x94}, // setting th_sif for SQ rssi detect
		{0x66, 0xEB, 0x2E}, // rssi_comp  and afc range
		{0x7F, 0x00, 0x01}, // Goto page 1 registers
		{0x06, 0x00, 0x14}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x07, 0x02, 0x0C}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x08, 0x02, 0x14}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x09, 0x03, 0x0C}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x0A, 0x03, 0x14}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x0B, 0x03, 0x24}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x0C, 0x03, 0x44}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x0D, 0x13, 0x44}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x0E, 0x1B, 0x44}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x0F, 0x3F, 0x44}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x12, 0xE0, 0xEB}, // AGC Table (recommended value for 12.5kHz bandwidth operation)
		{0x7F, 0x00, 0x00}, // Go back to page 0 registers
		};

const uint8_t AT1846FM25kHzSettings[][AT1846_BYTES_PER_COMMAND] = {
		{0x3A, 0x40, 0xCB}, // 25 kHz settings
		{0x15, 0x1F, 0x00}, // IF tuning bits (12:9)
		{0x32, 0x75, 0x64}, // agc target power
		{0x3A, 0x00, 0xC3}, // modu_det_sel (SQ setting)
		{0x59, 0x0B, 0xA0}, // Deviation settings
		{0x3F, 0x29, 0xD1}, // Rssi3_th (SQ setting)
		{0x3C, 0x1B, 0x34}, // Pk_det_th (SQ setting)
		{0x48, 0x1E, 0x38}, // noise1_th (SQ setting)
		{0x60, 0x0F, 0x17}, // noise2_th (SQ setting)
		{0x62, 0x37, 0x67}, // modu_det_th (SQ setting)
		{0x65, 0x24, 0x8A}, // setting th_sif for SQ rssi detect
		{0x66, 0xFF, 0x2E}, // rssi_comp  and afc range
		{0x7F, 0x00, 0x01}, // Goto page 1 registers
		{0x06, 0x00, 0x24}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x07, 0x02, 0x14}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x08, 0x02, 0x24}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x09, 0x03, 0x14}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x0A, 0x03, 0x24}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x0B, 0x03, 0x44}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x0C, 0x03, 0x84}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x0D, 0x13, 0x84}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x0E, 0x1B, 0x84}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x0F, 0x3F, 0x84}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x12, 0xE0, 0xEB}, // AGC Table (recommended value for 25kHz bandwidth operation)
		{0x7F, 0x00, 0x00}, // Go back to page 0 registers
		};

const uint8_t AT1846FMSettings[][AT1846_BYTES_PER_COMMAND] = {
		{0x33, 0x44, 0xA5}, // agc number (recommended value)
		{0x41, 0x44, 0x31}, // Digital voice gain, (bits 6:0) however default value is supposed to be 0x4006 hence some bits are being set outside the documented range
		{0x42, 0x10, 0xF0}, // RDA1846 lists this as Vox Shut threshold
		{0x43, 0x00, 0xA9}, // FM deviation
		{0x58, 0xBC, 0x85}, // Enable some filters for FM e.g. High and Low Pass Filters. G4EML...De-emphasis turned off as this is done by the HRC6000 on the MDUV380.
		{0x44, 0x06, 0xCC}, // set internal volume to 80% .
		{0x3A, 0x00, 0xC3}, // modu_det_sel (SQ setting)
		{0x40, 0x00, 0x30}  // UNDOCUMENTED. THIS IS THE MAGIC REGISTER WHICH ALLOWS LOW FREQ AUDIO BY SETTING THE LS BIT. So it should be cleared to receive FM
		};

//Modified to reflect the values used by the UV380 G4EML

const uint8_t AT1846DMRSettings[][AT1846_BYTES_PER_COMMAND] = {
		{0x40, 0x00, 0x31}, // UNDOCUMENTED. THIS IS THE MAGIC REGISTER WHICH ALLOWS LOW FREQ AUDIO BY SETTING THE LS BIT
		{0x15, 0x11, 0x00}, // IF tuning bits (12:9)
		{0x32, 0x44, 0x95}, // agc target power
		{0x3A, 0x00, 0xC3}, // modu_det_sel (SQ setting). Tx No mic input, as the DMR signal directly modulates the master reference oscillator
		{0x3C, 0x1B, 0x34}, // Pk_det_th (SQ setting)
		{0x3F, 0x29, 0xD1}, // Rssi3_th (SQ setting)
		{0x41, 0x41, 0x22}, // Digital voice gain, (bits 6:0) however default value is supposed to be 0x4006 hence some bits are being set outside the documented range
		{0x42, 0x10, 0x52}, // RDA1846 lists this as Vox Shut threshold
		{0x43, 0x01, 0x00}, // FM deviation
		{0x48, 0x19, 0xB1}, // noise1_th (SQ setting)
		{0x58, 0x9C, 0xDD}, // Disable all filters in DMR mode
		{0x44, 0x07, 0xFF}, // set internal volume to 100% (doesn't seem to decode correctly at lower levels on this radio)
		};

#define AT1846S_I2C_MASTER_SLAVE_ADDR_7BIT (0x5CU)

void AT1846sInit(void)
{
	// --- start of AT1846_init()
	radioWriteReg2byte(0x30, 0x00, 0x01); // Soft reset
	osDelay(50);

	I2C_AT1846S_send_Settings(AT1846InitSettings, sizeof(AT1846InitSettings) / AT1846_BYTES_PER_COMMAND);
	osDelay(50);

	radioWriteReg2byte(0x30, 0x40, 0xA6); // chip_cal_en Enable calibration
	osDelay(100);

	radioWriteReg2byte(0x30, 0x40, 0x06); // chip_cal_en Disable calibration
	osDelay(10);
	// Calibration end
	// --- end of AT1846_init()

	I2C_AT1846S_send_Settings(AT1846FM12P5kHzSettings, sizeof(AT1846FM12P5kHzSettings) / AT1846_BYTES_PER_COMMAND);// initially set the bandwidth for 12.5 kHz


	osDelay(200);
}

void AT1846sPostInit(void)
{
	I2C_AT1846S_send_Settings(AT1846PostinitSettings, sizeof(AT1846PostinitSettings) / AT1846_BYTES_PER_COMMAND);
}

void AT1846sSetMode(int mode)
{
	if (mode == RADIO_MODE_ANALOG)
	{
		I2C_AT1846S_send_Settings(AT1846FMSettings, sizeof(AT1846FMSettings) / AT1846_BYTES_PER_COMMAND);
	}
	else
	{
		I2C_AT1846S_send_Settings(AT1846DMRSettings, sizeof(AT1846DMRSettings) / AT1846_BYTES_PER_COMMAND);
	}
}

void AT1846sSetBandWidth(bool Is25K)
{
	if (Is25K)
	{
		// 25 kHz settings
		I2C_AT1846S_send_Settings(AT1846FM25kHzSettings, sizeof(AT1846FM25kHzSettings) / AT1846_BYTES_PER_COMMAND);
		radioSetClearReg2byteWithMask(0x30, 0xCF, 0x9F, 0x30, 0x00); // Set the 25Khz Bits and turn off the Rx and Tx
	}
	else
	{
		// 12.5 kHz settings
		I2C_AT1846S_send_Settings(AT1846FM12P5kHzSettings, sizeof(AT1846FM12P5kHzSettings) / AT1846_BYTES_PER_COMMAND);
		radioSetClearReg2byteWithMask(0x30, 0xCF, 0x9F, 0x20, 0x00); // Clear the 25Khz Bit and turn off the Rx and Tx
	}

	radioSetClearReg2byteWithMask(0x30, 0xFF, 0x9F, 0x00, 0x20); // Turn the Rx On
}

bool radioWriteReg2byte(uint8_t reg, uint8_t val1, uint8_t val2)
{
    if (reg == 0x7f)
    {
    	currentRegisterBank = val2;
    }
    else
    {
    	if ((registerCache[reg].cached[currentRegisterBank]) && (registerCache[reg].highByte[currentRegisterBank] == val1) &&  (registerCache[reg].lowByte[currentRegisterBank] == val2))
    	{
    		return true;
    	}
    }

	uint8_t data[] = { reg, val1, val2 };


	if (HAL_I2C_Master_Transmit(&hi2c3, AT1846S_I2C_MASTER_SLAVE_ADDR_7BIT, data, 3,HAL_MAX_DELAY) != HAL_OK)
	{
		return false;
	}

	return true;

}

bool radioReadReg2byte(uint8_t reg, uint8_t *val1, uint8_t *val2)
{
    uint8_t data[2] = {reg, 0x00};

	if (HAL_I2C_Master_Transmit(&hi2c3, AT1846S_I2C_MASTER_SLAVE_ADDR_7BIT, data, 1,HAL_MAX_DELAY) != HAL_OK)
	{
		return false;
	}

	if (HAL_I2C_Master_Receive(&hi2c3, AT1846S_I2C_MASTER_SLAVE_ADDR_7BIT, data, 2, HAL_MAX_DELAY)  != HAL_OK)
	{
		return false;
	}

    *val1 = data[0];
    *val2 = data[1];

	return true;
}


bool radioSetClearReg2byteWithMask(uint8_t reg, uint8_t mask1, uint8_t mask2, uint8_t val1, uint8_t val2)
{
    bool status;
	uint8_t tmp_val1, tmp_val2;

	if ((registerCache[reg].cached[currentRegisterBank]))
	{
		tmp_val1 = registerCache[reg].highByte[currentRegisterBank];
		tmp_val2 = registerCache[reg].lowByte[currentRegisterBank];
	}
	else
	{
		status = radioReadReg2byte(reg, &tmp_val1, &tmp_val2);
	    if (!status)
	    {
	    	return status;
	    }
	}

	tmp_val1 = val1 | (tmp_val1 & mask1);
	tmp_val2 = val2 | (tmp_val2 & mask2);
	status = radioWriteReg2byte(reg, tmp_val1, tmp_val2);

	return status;
}

void I2C_AT1846_set_register_with_mask(uint8_t reg, uint16_t mask, uint16_t value, uint8_t shift)
{
	taskENTER_CRITICAL();
	radioSetClearReg2byteWithMask(reg, (mask & 0xff00) >> 8, (mask & 0x00ff) >> 0, ((value << shift) & 0xff00) >> 8, ((value << shift) & 0x00ff) >> 0);
	taskEXIT_CRITICAL();
}

void I2C_AT1846S_send_Settings(const uint8_t settings[][AT1846_BYTES_PER_COMMAND], int numSettings)
{
	for(int i = 0; i < numSettings; i++)
	{
		radioWriteReg2byte(settings[i][0], settings[i][1], settings[i][2]);
	}
}



void AT1846SSetTxCSS_DCS(uint16_t tone)
{

	taskENTER_CRITICAL();
	CodeplugCSSTypes_t type = codeplugGetCSSType(tone);

	if (type == CSS_TYPE_NONE)
	{

		// tone value of 0xffff in the codeplug seem to be a flag that no tone has been selected
		// Zero the CTCSS1 Register
		radioWriteReg2byte(0x4a, 0x00, 0x00);
		// Zero the CTCSS2 Register
		radioWriteReg2byte(0x4d, 0x00, 0x00);
		// disable the transmit CTCSS/DCS
		radioSetClearReg2byteWithMask(0x4e, 0xF9, 0xFF, 0x00, 0x00);
	}
	else if (type == CSS_TYPE_CTCSS)
	{

		// value that is stored is 100 time the tone freq but its stored in the codeplug as freq times 10
		tone *= 10;
		// CTCSS 1
		radioWriteReg2byte(0x4a, (tone >> 8) & 0xff, (tone & 0xff));
		// Zero CTCSS 2
		radioWriteReg2byte(0x4d, 0x00, 0x00);
		// init cdcss_code
		radioWriteReg2byte(0x4b, 0x00, 0x00);
		radioWriteReg2byte(0x4c, 0x00, 0x00);
		// enable the transmit CTCSS
		radioSetClearReg2byteWithMask(0x4e, 0xF9, 0xFF, 0x06, 0x00);
	}
	else if (type & CSS_TYPE_DCS)
	{

		// Set the CTCSS1 Register to 134.4Hz (DCS data rate)
		radioWriteReg2byte(0x4a, (TRX_DCS_TONE >> 8) & 0xff, TRX_DCS_TONE & 0xff);
		// Zero the CTCSS2 Register
		radioWriteReg2byte(0x4d, 0x00, 0x00);

		// The AT1846S wants the Golay{23,12} encoding of the DCS code, rather than just the code itself.
		uint32_t encoded = dcsGetBitPatternFromCode(convertCSSNative2BinaryCodedOctal(tone & ~CSS_TYPE_DCS_MASK));
		radioWriteReg2byte(0x4b, 0x00, (encoded >> 16) & 0xff);           // init cdcss_code
		radioWriteReg2byte(0x4c, (encoded >> 8) & 0xff, encoded & 0xff);  // init cdcss_code

		uint8_t reg4e_high = ((type & CSS_TYPE_DCS_INVERTED) ? 0x05 : 0x04);
		radioSetClearReg2byteWithMask(0x4e, 0x38, 0x3F, reg4e_high, 0x00); // enable transmit DCS
	}
	taskEXIT_CRITICAL();
}
