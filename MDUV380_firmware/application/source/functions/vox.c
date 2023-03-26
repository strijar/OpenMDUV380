/*
 * Copyright (C) 2020-2022 Roger Clark, VK3KYY / G4KYF
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

#include "functions/vox.h"
#include "interfaces/adc.h"
#include "functions/sound.h"
#include "functions/settings.h"
#include "functions/ticks.h"
#include "utils.h"


#define PIT_COUNTS_PER_MS  1U


static const uint32_t VOX_TAIL_TIME_UNIT = (PIT_COUNTS_PER_MS * 500); // 500ms tail unit
static const uint16_t VOX_SETTLE_TIME = 4000; // Countdown before doing first real sampling;

typedef struct
{
	bool     triggered;
	uint8_t  preTrigger;
	uint8_t  threshold; // threshold is a super low value, 8 bits are enough
	uint16_t sampled;
	uint16_t averaged;
	uint16_t noiseFloor;
	ticksTimer_t nextTimeSamplingTimer;
	uint8_t  tailUnits;
	ticksTimer_t tailTimer;
	uint16_t settleCount;
} voxData_t;

static voxData_t vox;

void voxInit(void)
{
	voxReset();
	vox.threshold = 0;
	vox.noiseFloor = 0;
	vox.tailUnits = 1;
	vox.settleCount = VOX_SETTLE_TIME;
}

void voxSetParameters(uint8_t threshold, uint8_t tailHalfSecond)
{
	vox.triggered = false;
	vox.threshold = threshold;

	voxReset();
	vox.tailUnits = tailHalfSecond;
	vox.settleCount = VOX_SETTLE_TIME;
}

bool voxIsEnabled(void)
{
	return (codeplugChannelIsFlagSet(currentChannelData, CHANNEL_FLAG_VOX) && (settingsUsbMode != USB_MODE_HOTSPOT));
}

bool voxIsTriggered(void)
{
	return vox.triggered;
}

void voxReset(void)
{
	vox.triggered = false;
	vox.sampled = 0;
	vox.averaged = 0;
	ticksTimerStart(&vox.nextTimeSamplingTimer, PIT_COUNTS_PER_MS); // now + 1ms
	ticksTimerReset(&vox.tailTimer);
	vox.settleCount = VOX_SETTLE_TIME >> 1;
	vox.preTrigger = 0;
}

void voxTick(void)
{
	static uint16_t sampledNoise = 0;
	static bool noiseFloorValid = false;
	static int noiseCount = 0;

	if (voxIsEnabled())
	{
		if (ticksTimerHasExpired(&vox.nextTimeSamplingTimer))
		{
			if ((getAudioAmpStatus() & (AUDIO_AMP_MODE_RF | AUDIO_AMP_MODE_BEEP)))
			{
				voxReset();
			}
			else
			{
				uint16_t sample = adcGetVOX();

				if (vox.settleCount > 0)
				{
					vox.settleCount--;
					noiseFloorValid = false;
					return;
				}



					vox.sampled += sample;
					vox.averaged = (vox.sampled + (1 << (2 - 1))) >> 2;
					vox.sampled -= vox.averaged;

				if ((vox.averaged >= (vox.noiseFloor + vox.threshold)) & noiseFloorValid)
				{
					vox.preTrigger = SAFE_MIN((vox.preTrigger + 1), 100);

					// We need 100ms of level above the noise to trigger the VOX
					if (vox.preTrigger >= 100)
					{
						vox.triggered = true;
						ticksTimerStart(&vox.tailTimer, (vox.tailUnits * VOX_TAIL_TIME_UNIT));
					}
				}
				else
				{
					// Noise is sampled all the time, when the transceiver is silent, and not XMitting
					if (vox.triggered == false)
					{
						// Noise floor averaging
						sampledNoise += sample;
						noiseCount++;
						if(noiseCount == 1000)
						{
							vox.noiseFloor = sampledNoise/noiseCount;
							sampledNoise=0;
							noiseFloorValid = true;
							noiseCount=0;
						}
					}
				}
			}

			ticksTimerStart(&vox.nextTimeSamplingTimer, PIT_COUNTS_PER_MS); // now + 1ms
		}

		if ((vox.tailTimer.timeout != 0) && ticksTimerHasExpired(&vox.tailTimer))
		{
			vox.triggered = false;
			ticksTimerReset(&vox.tailTimer);
			vox.preTrigger = 0;
		}
	}

	if (vox.triggered && (settingsUsbMode == USB_MODE_HOTSPOT))
	{
		voxReset();
	}

}
