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

#ifndef _OPENGD77_HX8353E_H_
#define _OPENGD77_HX8353E_H_

#include <stdbool.h>
#include <math.h>
#include <FreeRTOS.h>
#include <task.h>


typedef enum
{
	FONT_SIZE_1 = 0,
	FONT_SIZE_1_BOLD,
	FONT_SIZE_2,
	FONT_SIZE_3,
	FONT_SIZE_4
} ucFont_t;

typedef enum
{
	TEXT_ALIGN_LEFT = 0,
	TEXT_ALIGN_CENTER,
	TEXT_ALIGN_RIGHT
} ucTextAlign_t;

typedef enum
{
	CHOICE_OK = 0,
#if defined(PLATFORM_MD9600)
	CHOICE_ENT,
#endif
	CHOICE_YESNO,
	CHOICE_DISMISS,
	CHOICES_OKARROWS,// QuickKeys
	CHOICES_NUM
} ucChoice_t;


#define HX8583_CMD_NOP          0x00 // No Operation
#define HX8583_CMD_SWRESET      0x01 // Software reset
#define HX8583_CMD_RDDIDIF      0x04 // Read Display ID Info
#define HX8583_CMD_RDDST        0x09 // Read Display Status
#define HX8583_CMD_RDDPM        0x0a // Read Display Power
#define HX8583_CMD_RDD_MADCTL   0x0b // Read Display
#define HX8583_CMD_RDD_COLMOD   0x0c // Read Display Pixel
#define HX8583_CMD_RDDDIM       0x0d // Read Display Image
#define HX8583_CMD_RDDSM        0x0e // Read Display Signal
#define HX8583_CMD_RDDSDR       0x0f // Read display self-diagnostic resut
#define HX8583_CMD_SLPIN        0x10 // Sleep in & booster off
#define HX8583_CMD_SLPOUT       0x11 // Sleep out & booster on
#define HX8583_CMD_PTLON        0x12 // Partial mode on
#define HX8583_CMD_NORON        0x13 // Partial off (Normal)
#define HX8583_CMD_INVOFF       0x20 // Display inversion off
#define HX8583_CMD_INVON        0x21 // Display inversion on
#define HX8583_CMD_GAMSET       0x26 // Gamma curve select
#define HX8583_CMD_DISPOFF      0x28 // Display off
#define HX8583_CMD_DISPON       0x29 // Display on
#define HX8583_CMD_CASET        0x2a // Column address set
#define HX8583_CMD_PASET        0x2b // Row address set
#define HX8583_CMD_RAMWR        0x2c // Memory write
#define HX8583_CMD_RGBSET       0x2d // LUT parameter (16-to-18 color mapping)
#define HX8583_CMD_RAMRD        0x2e // Memory read
#define HX8583_CMD_PTLAR        0x30 // Partial start/end address set
#define HX8583_CMD_VSCRDEF      0x31 // Vertical Scrolling Direction
#define HX8583_CMD_TEOFF        0x34 // Tearing effect line off
#define HX8583_CMD_TEON         0x35 // Tearing effect mode set & on
#define HX8583_CMD_MADCTL       0x36 // Memory data access control
#define HX8583_CMD_VSCRSADD     0x37 // Vertical scrolling start address
#define HX8583_CMD_IDMOFF       0x38 // Idle mode off
#define HX8583_CMD_IDMON        0x39 // Idle mode on
#define HX8583_CMD_COLMOD       0x3a // Interface pixel format
#define HX8583_CMD_RDID1        0xda // Read ID1
#define HX8583_CMD_RDID2        0xdb // Read ID2
#define HX8583_CMD_RDID3        0xdc // Read ID3

#define HX8583_CMD_SETOSC       0xb0 // Set internal oscillator
#define HX8583_CMD_SETPWCTR     0xb1 // Set power control
#define HX8583_CMD_SETDISPLAY   0xb2 // Set display control
#define HX8583_CMD_SETCYC       0xb4 // Set display cycle
#define HX8583_CMD_SETBGP       0xb5 // Set BGP voltage
#define HX8583_CMD_SETVCOM      0xb6 // Set VCOM voltage
#define HX8583_CMD_SETEXTC      0xb9 // Enter extension command
#define HX8583_CMD_SETOTP       0xbb // Set OTP
#define HX8583_CMD_SETSTBA      0xc0 // Set Source option
#define HX8583_CMD_SETID        0xc3 // Set ID
#define HX8583_CMD_SETPANEL     0xcc // Set Panel characteristics
#define HX8583_CMD_GETHID       0xd0 // Read Himax internal ID
#define HX8583_CMD_SETGAMMA     0xe0 // Set Gamma
#define HX8583_CMD_SET_SPI_RDEN 0xfe // Set SPI Read address (and enable)
#define HX8583_CMD_GET_SPI_RDEN 0xff // Get FE A[7:0] parameter

#define LCD_FSMC_ADDR_COMMAND 0x60000000
#define LCD_FSMC_ADDR_DATA    0x60040000

#define FONT_SIZE_3_HEIGHT                       16
#define FONT_SIZE_4_HEIGHT                       32
#define DISPLAY_SIZE_Y                          128
#define DISPLAY_SIZE_X                          160
#define DISPLAY_NUMBER_OF_ROWS  (DISPLAY_SIZE_Y / 8)

#define COLOR(x) (uint16_t)(((x & 0xF80000) >> 16) | ((x & 0xFC00) >> 13) | ((x & 0x1C00) << 3) | ((x & 0xF8) << 5))

void displayBegin(bool isInverted);
void displayClearBuf(void);
void displayClearRows(int16_t startRow, int16_t endRow, bool isInverted);
void displayRenderWithoutNotification(void);
void displayRender(void);
void displayRenderRows(int16_t startRow, int16_t endRow);
void displayPrintCentered(uint16_t y, const char *text, ucFont_t fontSize);
void displayPrintAt(uint16_t x, uint16_t y, const  char *text, ucFont_t fontSize);
int displayPrintCore(int16_t x, int16_t y, const char *szMsg, ucFont_t fontSize, ucTextAlign_t alignment, bool isInverted);

int16_t displaySetPixel(int16_t x, int16_t y, bool color);

void displayDrawLine(int16_t x0, int16_t y0, int16_t x1, int16_t y1, bool color);
void displayDrawFastVLine(int16_t x, int16_t y, int16_t h, bool color);
void displayDrawFastHLine(int16_t x, int16_t y, int16_t w, bool color);

void displayDrawCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, bool color);
void displayDrawCircle(int16_t x0, int16_t y0, int16_t r, bool color);
void displayFillCircleHelper(int16_t x0, int16_t y0, int16_t r, uint8_t cornername, int16_t delta, bool color);
void displayFillCircle(int16_t x0, int16_t y0, int16_t r, bool color);

void displayDrawEllipse(int16_t x0, int16_t y0, int16_t x1, int16_t y1, bool color);

void displayDrawTriangle(int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, bool color);
void displayFillTriangle ( int16_t x0, int16_t y0, int16_t x1, int16_t y1, int16_t x2, int16_t y2, bool color);

void displayFillArc(uint16_t x, uint16_t y, uint16_t radius, uint16_t thickness, float start, float end, bool color);

void displayDrawRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, bool color);
void displayFillRoundRect(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, bool color);
void displayDrawRoundRectWithDropShadow(int16_t x, int16_t y, int16_t w, int16_t h, int16_t r, bool color);

void displayDrawRect(int16_t x, int16_t y, int16_t w, int16_t h, bool color);
void displayFillRect(int16_t x, int16_t y, int16_t width, int16_t height, bool isInverted);
void displayDrawRectWithDropShadow(int16_t x, int16_t y, int16_t w, int16_t h, bool color);

void displayDrawBitmap(int16_t x, int16_t y, uint8_t *bitmap, int16_t w, int16_t h, bool color);
void displayDrawXBitmap(int16_t x, int16_t y, const uint8_t *bitmap, int16_t w, int16_t h, bool color);

void displaySetContrast(uint8_t contrast);
void displaySetInverseVideo(bool isInverted);
uint16_t displayGetForegroundColour(void);
uint16_t displayGetBackgroundColour(void);

void displaySetDisplayPowerMode(bool wake);

void displayDrawChoice(ucChoice_t choice, bool clearRegion);

uint16_t *displayGetScreenBuffer(void);
void displayRestorePrimaryScreenBuffer(void);
uint16_t *displayGetPrimaryScreenBuffer(void);
void displayOverrideScreenBuffer(uint16_t *buffer);

void displaySetForegroundColour(uint16_t color);
void displaySetBackgroundColour(uint16_t color);
void displaySetColours(uint16_t foreground, uint16_t background);
void displayConvertGD77ImageData(uint8_t *dataBuf);

#endif /* _OPENGD77_HX8353E_H_ */
