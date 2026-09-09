/* Source-vocoder lifecycle and legacy codec API compatibility. */

#include "dmr_codec/codec.h"
#include "functions/voicePrompts.h"
#include "vocoder/vocoder.h"

#include <string.h>

void codecInitInternalBuffers(void)
{
	(void)vocoder_init();
}

void codecInit(bool fromVoicePrompts)
{
	if ((fromVoicePrompts == false) && voicePromptsIsPlaying())
	{
		return;
	}

	codecInitInternalBuffers();
	soundInit();
}

bool codecIsAvailable(void)
{
	return true;
}

void codecEncodeInit(uint8_t *outdata_ptr)
{
	memset(outdata_ptr, 0, 27);
}

void codecEncode(uint8_t *outdata_ptr, int numbBlocks)
{
	for (int i = 0; i < numbBlocks; i++)
	{
		codecEncodeBlock(outdata_ptr);
		outdata_ptr += 9;
	}
}
