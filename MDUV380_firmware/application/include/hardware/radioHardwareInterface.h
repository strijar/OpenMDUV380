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

#ifndef _RADIO_HARDWARE_INTERFACE_H_
#define _RADIO_HARDWARE_INTERFACE_H_
#include "main.h"

typedef int32_t status_t;

void radioPowerOn(void);
void radioPowerOff(bool invalidateFrequency);
void radioInit(void);
void radioPostinit(void);
void radioSetBandwidth(bool Is25K);
void radioSetCalibration(void);
void radioSetIF(int band, bool wide);
void radioSetMode(int mode);
void radioSetFrequency(uint32_t freq, bool Tx);
void radioSetTx(uint8_t band);
void radioSetRx(uint8_t band);
void radioReadVoxAndMicStrength(void);
void radioReadRSSIAndNoiseForBand(uint8_t band);
void SynthTransfer(bool VHF, uint8_t add, uint16_t reg);
void IFTransfer(bool VHF, uint16_t data1);

void radioRxCSSOn(uint16_t tone);
void radioRxCSSOff(void);
void radioRxDCSOn(uint16_t code, bool inverted);
void radioTxCSSOff(void);
void radioTxCSSOn(uint16_t tone);
void radioTxDCSOn(uint16_t code);
bool radioCheckCSS(void);
void radioSetTone1(int tonefreq);
void radioSetTone2(int tonefreq);
void radioSetMicGain(uint8_t gain_tx);
void radioSetMicGainFM(uint8_t gain);
void radioAudioAmp(bool on);
void radioSetAudioPath(bool fromFM);
void radioFastTx(bool tx);

uint32_t dcsGetBitPatternFromCode(uint16_t dcs);

#endif
