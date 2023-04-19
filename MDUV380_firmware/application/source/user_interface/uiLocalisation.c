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
#include "user_interface/uiLocalisation.h"

#include "user_interface/languages/english.h"
#if defined(LANGUAGE_BUILD_JAPANESE)
#include "user_interface/languages/japanese.h"
#elif !defined(LANGUAGE_ENGLISH_ONLY)
#include "user_interface/languages/french.h"
#include "user_interface/languages/german.h"
#include "user_interface/languages/portuguese.h"
#include "user_interface/languages/catalan.h"
#include "user_interface/languages/spanish.h"
#include "user_interface/languages/italian.h"
#include "user_interface/languages/danish.h"
#include "user_interface/languages/finnish.h"
#include "user_interface/languages/polish.h"
#include "user_interface/languages/turkish.h"
#include "user_interface/languages/czech.h"
#include "user_interface/languages/dutch.h"
#include "user_interface/languages/slovenian.h"
#include "user_interface/languages/portugues_brazil.h"
#include "user_interface/languages/swedish.h"
#include "user_interface/languages/hungarian.h"
#include "user_interface/languages/croatian.h"
#endif

/*
 * Note.
 *
 * Do not re-order the list of languages, unless you also change the MagicNumber in the settings
 * Because otherwise the radio will load a different language than the one the user previously saved when the radio was turned off
 * Add new languages at the end of the list
 *
 */
const stringsTable_t languages[NUM_LANGUAGES]= { 	englishLanguage,        // englishLanguageName
#if defined(LANGUAGE_BUILD_JAPANESE)
													japaneseLanguage,       // japaneseLanguageName
#elif !defined(LANGUAGE_ENGLISH_ONLY)
													catalanLanguage,        // catalanLanguageName
													danishLanguage,         // danishLanguageName
													frenchLanguage,         // frenchLanguageName
													germanLanguage,         // deutschGermanLanguageName
													italianLanguage,        // italianLanguageName
													portuguesLanguage,      // portuguesLanguageName
													spanishLanguage,        // spanishLanguageName
													finnishLanguage,        // suomiFinnishLanguageName
													polishLanguage,         // polishLanguageName
													turkishLanguage,        // turkishLanguageName
													czechLanguage,          // czechLanguageName
													dutchLanguage,          // nederlandsDutchLanguageName
													slovenianLanguage,      // slovenianLanguageName
													portuguesBrazilLanguage,// portuguesBrazilLanguageName
													swedishLanguage,        // swedishLanguageName
													hungarianLanguage,      // hungarianLanguageName
													croatianLanguage,       // croatianLanguageName
#endif
													};
const stringsTable_t *currentLanguage;

// used in menuLanguage
// needs to be sorted alphabetically, based on the text that is displayed for each language name. With English as the first / default language
const int LANGUAGE_DISPLAY_ORDER[NUM_LANGUAGES] = {	englishLanguageName,
#if defined(LANGUAGE_BUILD_JAPANESE)
													japaneseLanguageName,
#elif !defined(LANGUAGE_ENGLISH_ONLY)
													catalanLanguageName,
													croatianLanguageName,
													czechLanguageName,
													danishLanguageName,
													deutschGermanLanguageName,
													frenchLanguageName,
													hungarianLanguageName,
													italianLanguageName,
													nederlandsDutchLanguageName,
													polishLanguageName,
													portuguesLanguageName,
													portuguesBrazilLanguageName,
													slovenianLanguageName,
													spanishLanguageName,
													suomiFinnishLanguageName,
													swedishLanguageName,
													turkishLanguageName
#endif
													};


char LanguageGetSymbol(LanguageSymbol_t s)
{
	return currentLanguage->symbols[s];
}
