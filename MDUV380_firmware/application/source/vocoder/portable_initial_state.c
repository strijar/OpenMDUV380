#include "portable_initial_state.h"

#include "portable_decoder_state.inc"
#include "portable_encoder_state.inc"

_Static_assert(sizeof(vocoder_decoder_initial_state) == VOCODER_DECODER_STATE_SIZE,
               "decoder state image size must match firmware");
_Static_assert(sizeof(vocoder_encoder_initial_state) == VOCODER_ENCODER_STATE_SIZE,
               "encoder state image size must match firmware");
