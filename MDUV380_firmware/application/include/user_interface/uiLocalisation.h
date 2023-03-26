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
#ifndef _OPENGD77_UILOCALISATION_H_
#define _OPENGD77_UILOCALISATION_H_


#if defined(LANGUAGE_BUILD_JAPANESE)
#define NUM_LANGUAGES 2
#else
#define NUM_LANGUAGES 18
#endif

#define LANGUAGE_TEXTS_LENGTH 17

typedef struct
{
/*
 * IMPORTANT
 *
 * The first set of strings are used for menu names
 *
 * DO NOT RE-ORGANISE THIS LIST as the items are accessed using pointer arithmetic
 * from menuSystem. c mainMenuItems[]
 *
 */
   const char *LANGUAGE_NAME;// Menu number 0
   const char *menu;// Menu number  1
   const char *credits;// Menu number  2
   const char *zone;// Menu number 3
   const char *rssi;// Menu number  4
   const char *battery;// Menu number  5
   const char *contacts;// Menu number  6
   const char *last_heard;// Menu number  7
   const char *firmware_info;// Menu number  8
   const char *options;// Menu number  9
   const char *display_options;// Menu number  10
   const char *sound_options;// Menu number  11
   const char *channel_details;// Menu number  12
   const char *language;// Menu number  13
   const char *new_contact;// Menu number  14
   const char *dmr_contacts;// Menu number  15
   const char *contact_details;// Menu number 16
   const char *hotspot_mode;// Menu number 17


  /*
   * DO NOT RE-ORGANISE THIS LIST as the items are accessed using pointer arithmetic
   * for the voice prompts
   */

   const char *built;//
   const char *zones;//
   const char *keypad;//
   const char *ptt;//
   const char *locked;//
   const char *press_blue_plus_star;//
   const char *to_unlock;//
   const char *unlocked;//
   const char *power_off; //
   const char *error;//
   const char *rx_only;//
   const char *out_of_band;//
   const char *timeout;//
   const char *tg_entry;//
   const char *pc_entry;//
   const char *user_dmr_id;//
   const char *contact;//
   const char *accept_call;//  "Accept call?"
   const char *private_call;// "Private call"
   const char *squelch;// "Squelch"
   const char *quick_menu;//"Quick Menu"
   const char *filter;//"Filter:%s"
   const char *all_channels;//"All Channels"
   const char *gotoChannel;//"Goto %d"
   const char *scan;// "Scan"
   const char *channelToVfo;// "Channel --> VFO",
   const char *vfoToChannel;// "VFO --> Channel",
   const char *vfoToNewChannel;// "VFO --> New Chan",
   const char *group;//"Group",
   const char *private;//"Private",
   const char *all;//"All",
   const char *type;//"Type:"
   const char *timeSlot;//"Timeslot"
   const char *none;//"none"
   const char *contact_saved;// "Contact saved",
   const char *duplicate;//"Duplicate"
   const char *tg;//"TG"
   const char *pc;//"PC"
   const char *ts;//"TS"
   const char *mode;//"Mode"
   const char *colour_code;//"Color Code"
   const char *n_a;//"N/A"
   const char *bandwidth;
   const char *stepFreq;
   const char *tot;
   const char *off;
   const char *zone_skip;
   const char *all_skip;
   const char *yes;
   const char *no;
   const char *rx_group;
   const char *on;
   const char *timeout_beep;
   const char *list_full;
   const char *dmr_cc_scan;
   const char *band_limits;
   const char *beep_volume;
   const char *dmr_mic_gain;
   const char *fm_mic_gain;
   const char *key_long;
   const char *key_repeat;
   const char *dmr_filter_timeout;
   const char *brightness;
   const char *brightness_off;
   const char *contrast;
   const char *colour_invert;// for display background
   const char *colour_normal;// for display background
   const char *backlight_timeout;
   const char *scan_delay;
   const char *yes___in_uppercase;
   const char *no___in_uppercase;
   const char *DISMISS;
   const char *scan_mode;
   const char *hold;
   const char *pause;
   const char *empty_list;
   const char *delete_contact_qm;
   const char *contact_deleted;
   const char *contact_used;
   const char *in_rx_group;
   const char *select_tx;
   const char *edit_contact;
   const char *delete_contact;
   const char *group_call;
   const char *all_call;
   const char *tone_scan;
   const char *low_battery;
   const char *Auto;
   const char *manual;
   const char *ptt_toggle;
   const char *private_call_handling;
   const char *stop;
   const char *one_line;
   const char *two_lines;
   const char *new_channel;
   const char *priority_order;
   const char *dmr_beep;
   const char *start;
   const char *both;
   const char *vox_threshold;
   const char *vox_tail;
   const char *audio_prompt;
   const char *silent;
   const char *rx_beep;
   const char *beep;
   const char *voice_prompt_level_1;
   const char *transmitTalkerAliasTS1;
   const char *squelch_VHF;
   const char *squelch_220;
   const char *squelch_UHF;
   const char *display_background_colour;
   const char *openGD77;
   const char *openGD77S;
   const char *openDM1801;
   const char *openRD5R;
   const char *gitCommit;
   const char *voice_prompt_level_2;
   const char *voice_prompt_level_3;
   const char *dmr_filter;
   const char *talker;
   const char *dmr_ts_filter;
   const char *dtmf_contact_list;// Menu number 18
   const char *channel_power;// "Ch Power" for the Channel details screen
   const char *from_master;// "Master" for the power or squelch setting on the Channel details screen
   const char *set_quickkey;
   const char *dual_watch;
   const char *info;
   const char *pwr;
   const char *user_power;
   const char *temperature;
   const char *celcius;
   const char *seconds;
   const char *radio_info;
   const char *temperature_calibration;
   const char *pin_code;
   const char *please_confirm;
   const char *vfo_freq_bind_mode;
   const char *overwrite_qm;
   const char *eco_level;// Economy / Power saving level
   const char *buttons;
   const char *leds;
   const char *scan_dwell_time;
   const char *battery_calibration;
   const char *low;
   const char *high;
   const char *dmr_id;
   const char *scan_on_boot;
   const char *dtmf_entry;
   const char *name;
   const char *carrier;
   const char *openDM1801A;
   const char *time;
   const char *uptime;
   const char *hours;
   const char *minutes;
   const char *satellite;
   const char *alarm_time;
   const char *location;
   const char *date;
   const char *timeZone;
   const char *suspend;
   const char *pass;
   const char *elevation;
   const char *azimuth;
   const char *inHHMMSS;
   const char *predicting;
   const char *maximum;
   const char *satellite_short;
   const char *local;// For timezone
   const char *UTC;// For timezone
   const char *symbols; // NSEW
   const char *not_set;// Used when Location etc has not been set.
   const char *general_options;
   const char *radio_options;
   const char *openMD9600;              // MD-9600 ONLY
   const char *dmr_rx_agc;
   const char *speaker_click_suppress;  // MD-9600 ONLY
   const char *gps;                     // MD-9600 and MD-UV380 and MD-380
   const char *end_only;
   const char *dmr_crc;
   const char *eco;
   const char *safe_power_on;
   const char *auto_power_off;
   const char *apo_with_rf;
   const char *openMDUV380;              // MD-UV380 ONLY
   const char *openMD380;              // MD-380 ONLY
   const char *gps_acquiring;
   const char *altitude;
   const char *calibration;            //Calibration Menu (204)
   const char *freq_set;
   const char *cal_frequency;
   const char *cal_pwr;
   const char *pwr_set;
   const char *factory_reset;
   const char *rx_tune;               //MD-9600 only
   const char *transmitTalkerAliasTS2;
   const char *ta_text;// "Text"
} stringsTable_t;

extern const stringsTable_t languages[];
extern const stringsTable_t *currentLanguage;

enum languageNamesOrder
{
	englishLanguageName = 0,
#if defined(LANGUAGE_BUILD_JAPANESE)
	japaneseLanguageName,
#else
	catalanLanguageName,
	danishLanguageName,
	frenchLanguageName,
	deutschGermanLanguageName,
	italianLanguageName,
	portuguesLanguageName,
	spanishLanguageName,
	suomiFinnishLanguageName,
	polishLanguageName,
	turkishLanguageName,
	czechLanguageName,
	nederlandsDutchLanguageName,
	slovenianLanguageName,
	portuguesBrazilLanguageName,
	swedishLanguageName,
	hungarianLanguageName,
	croatianLanguageName
#endif
};

extern const int LANGUAGE_DISPLAY_ORDER[];

typedef enum
{
	SYMBOLS_NORTH = 0,
	SYMBOLS_SOUTH,
	SYMBOLS_EAST,
	SYMBOLS_WEST
} LanguageSymbol_t;


char LanguageGetSymbol(LanguageSymbol_t s);

#endif
