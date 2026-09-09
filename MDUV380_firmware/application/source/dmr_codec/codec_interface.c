/* DMR audio adapter for the source vocoder. */

#include "dmr_codec/codec.h"
#include "functions/voicePrompts.h"
#include "vocoder/vocoder.h"

#include <stdint.h>
#include <string.h>

#define VOCODER_PCM_SAMPLES 160
#define SOUND_BUFFER_SAMPLES 80
#define DMR_AMBE_FRAME_BYTES 9

void codecDecode(uint8_t *indata_ptr, int numbBlocks)
{
	int16_t pcm[VOCODER_PCM_SAMPLES];

	for (int idx = 0; idx < numbBlocks; idx++)
	{
		vocoder_decode_fec(indata_ptr, pcm);
		indata_ptr += DMR_AMBE_FRAME_BYTES;

		soundSetupBuffer();
		memcpy((void *)currentWaveBuffer, pcm, SOUND_BUFFER_SAMPLES * sizeof(pcm[0]));
		soundStoreBuffer();

		soundSetupBuffer();
		memcpy((void *)currentWaveBuffer, pcm + SOUND_BUFFER_SAMPLES,
			SOUND_BUFFER_SAMPLES * sizeof(pcm[0]));
		soundStoreBuffer();
	}
}

void codecEncodeBlock(uint8_t *outdata_ptr)
{
	int16_t pcm[VOCODER_PCM_SAMPLES];

	soundRetrieveBuffer();
	memcpy(pcm, (const void *)currentWaveBuffer,
		SOUND_BUFFER_SAMPLES * sizeof(pcm[0]));

	soundRetrieveBuffer();
	memcpy(pcm + SOUND_BUFFER_SAMPLES, (const void *)currentWaveBuffer,
		SOUND_BUFFER_SAMPLES * sizeof(pcm[0]));

	memset(outdata_ptr, 0, DMR_AMBE_FRAME_BYTES);
	vocoder_encode_fec(outdata_ptr, pcm);
}
