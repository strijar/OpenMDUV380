/*
 * Copyright (C) 2019-2022 Roger Clark, VK3KYY / G4KYF
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

#ifndef _OPENGD77_SPI_FLASH_H_
#define _OPENGD77_SPI_FLASH_H_

#include <stdbool.h>
#include <FreeRTOS.h>
#include <task.h>


extern uint8_t SPI_Flash_sectorbuffer[4096];
extern uint32_t flashChipPartNumber;

// Public functions
bool SPI_Flash_init(void);
bool SPI_Flash_read(uint32_t addrress,uint8_t *buf,int size);
bool SPI_Flash_write(uint32_t addr, uint8_t *dataBuf, int size);
bool SPI_Flash_writePage(uint32_t address,uint8_t *dataBuf);// page is 256 bytes
bool SPI_Flash_eraseSector(uint32_t address);// sector is 16 pages  = 4k bytes
int SPI_Flash_readManufacturer(void);// Not necessarily Winbond !
uint32_t SPI_Flash_readPartID(void);// Should be 4014 for 1M or 4017 for 8M
int SPI_Flash_readStatusRegister(void);// May come in handy
int SPI_Flash_readSecurityRegisters(int startBlock,uint8_t *dataBuf,int size);     //Used to read the calibration Data. Must read in blocks of 256 bytes. Blocks 0,1 or 2
int SPI_Flash_readSingleSecurityRegister(int addr);								  //used to read a single security register. Used for Display Type

#endif /* _OPENGD77_SPI_FLASH_H_ */
