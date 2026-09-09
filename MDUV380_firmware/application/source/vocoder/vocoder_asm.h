/* Internal AAPCS entry points for the Cortex-M4 assembly core. */
#ifndef VOCODER_ASM_H
#define VOCODER_ASM_H

#include <stdint.h>

int32_t asm_encode_thing(
    int16_t *bit_output, int32_t configuration_index,
    const int16_t *samples, int32_t sample_count,
    uint32_t flags, int16_t enabled, int16_t parameter, void *state);
int32_t asm_decode_wav(
    int16_t *output, int32_t sample_count,
    int16_t *bit_input, int32_t configuration_index,
    uint32_t flags, int16_t second_half, void *state);

#endif
