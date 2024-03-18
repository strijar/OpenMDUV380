/*
 * Copyright (C) 2019-2023 Roger Clark, VK3KYY / G4KYF
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
#include "main.h"
#include "user_interface/uiLocalisation.h"

#include "user_interface/languages/english.h"
#if defined(LANGUAGE_BUILD_JAPANESE)
#include "user_interface/languages/japanese.h"
#endif

#if ! defined(LANGUAGE_BUILD_JAPANESE)
#if defined(PLATFORM_GD77) || defined(PLATFORM_GD77S) || defined(PLATFORM_DM1801) || defined(PLATFORM_DM1801A) || defined(PLATFORM_RD5R)
__attribute__((section(".upper_text")))
#endif
const stringsTable_t userLanguage = { .magicNumber = { LANGUAGE_TAG_MAGIC_NUMBER, { 0x00, 0x00, 0x00, 0x00 } }, .LANGUAGE_NAME = "User" }; // Don't change the version number
#endif


/*
 * Note.
 *
 * Do not re-order the list of languages, unless you also change the MagicNumber in the settings
 * Because otherwise the radio will load a different language than the one the user previously saved when the radio was turned off
 * Add new languages at the end of the list
 *
 */
const stringsTable_t languages[]=
{
		englishLanguage,        // englishLanguageName
#if defined(LANGUAGE_BUILD_JAPANESE)
		japaneseLanguage       // japaneseLanguageName
#else
		userLanguage // User language, written by the CPS
#endif
};
const stringsTable_t *currentLanguage;


uint8_t languagesGetCount(void)
{
#if ! defined(LANGUAGE_BUILD_JAPANESE)
	uint8_t magic[3][4] = { LANGUAGE_TAG_MAGIC_NUMBER, LANGUAGE_TAG_VERSION };

	return ((memcmp(languages[1].magicNumber, magic, sizeof(magic)) == 0) ? 2 : 1);
#else
	return 2;
#endif
}

char currentLanguageGetSymbol(LanguageSymbol_t s)
{
	return currentLanguage->symbols[s];
}
