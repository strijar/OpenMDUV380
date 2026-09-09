#ifndef PORTABLE_INITIAL_STATE_H
#define PORTABLE_INITIAL_STATE_H

#define VOCODER_DECODER_STATE_SIZE 0x800U
#define VOCODER_ENCODER_STATE_SIZE 0x1800U

extern const unsigned char
    vocoder_decoder_initial_state[VOCODER_DECODER_STATE_SIZE];
extern const unsigned char
    vocoder_encoder_initial_state[VOCODER_ENCODER_STATE_SIZE];

#endif
