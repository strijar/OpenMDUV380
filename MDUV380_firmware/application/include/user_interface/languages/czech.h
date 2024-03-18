/* -*- coding: binary; -*- */
/*
 * Copyright (C) 2019-2023 Roger Clark, VK3KYY / G4KYF
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
/*
 * Translators: OK2HAD, OK2MOP
 *
 *
 * Rev: 4.3
 */
#ifndef USER_INTERFACE_LANGUAGES_CZECH_H_
#define USER_INTERFACE_LANGUAGES_CZECH_H_
/********************************************************************
 *
 * VERY IMPORTANT.
 * This file should not be saved with UTF-8 encoding
 * Use Notepad++ on Windows with ANSI encoding
 * or emacs on Linux with windows-1252-unix encoding
 *
 ********************************************************************/
#if defined(PLATFORM_GD77) || defined(PLATFORM_GD77S) || defined(PLATFORM_DM1801) || defined(PLATFORM_DM1801A) || defined(PLATFORM_RD5R)
__attribute__((section(".upper_text")))
#endif
const stringsTable_t czechLanguage =
{
.magicNumber                            = { LANGUAGE_TAG_MAGIC_NUMBER, LANGUAGE_TAG_VERSION },
.LANGUAGE_NAME 			= "e�tina", // MaxLen: 16
.menu					= "Menu", // MaxLen: 16
.credits				= "P�isp�vatel�", // MaxLen: 16
.zone					= "Z�na", // MaxLen: 16
.rssi					= "S�la sign�lu", // MaxLen: 16
.battery				= "Baterie", // MaxLen: 16
.contacts				= "Kontakty", // MaxLen: 16
.last_heard				= "Posledn� vol.", // MaxLen: 16
.firmware_info			= "Info o Firmware", // MaxLen: 16
.options				= "Nastaven�", // MaxLen: 16
.display_options		= "Nastaven� disp.", // MaxLen: 16
.sound_options				= "Nastaven� zvuku", // MaxLen: 16
.channel_details		= "Detail kan�lu", // MaxLen: 16
.language				= "Jazyk", // MaxLen: 16
.new_contact			= "Nov� kontakt", // MaxLen: 16
.dmr_contacts				= "DMR kontakt", // MaxLen: 16
.contact_details		= "Detail kontaktu", // MaxLen: 16
.hotspot_mode			= "Hotspot", // MaxLen: 16
.built					= "Sestaven�", // MaxLen: 16
.zones					= "Z�ny", // MaxLen: 16
.keypad					= "Kl�vesy", // MaxLen: 12 (with .ptt)
.ptt					= "PTT", // MaxLen: 12 (with .keypad)
.locked					= "Uzam�eny", // MaxLen: 15
.press_sk2_plus_star	= "Stla� SK2 + *", // MaxLen: 16
.to_unlock				= "Odemknout", // MaxLen: 16
.unlocked				= "Odemknuto", // MaxLen: 15
.power_off				= "Vyp�nan�...", // MaxLen: 16
.error					= "CHYBA", // MaxLen: 8
.rx_only				= "Jenom RX", // MaxLen: 16
.out_of_band			= "MIMO P�SMO", // MaxLen: 16
.timeout				= ". Limit", // MaxLen: 8
.tg_entry				= "Zadat skupinu", // MaxLen: 15
.pc_entry				= "Zadat soukr.", // MaxLen: 15
.user_dmr_id			= "U�iv. DMR ID", // MaxLen: 15
.contact 				= "Kontakty", // MaxLen: 15
.accept_call			= "P�ijmout hovor?", // MaxLen: 16
.private_call			= "Soukrom� hovor", /* was "Seznam kontakt�" */ // MaxLen: 16
.squelch				= "Squelch",  // MaxLen: 8
.quick_menu 			= "Rychl� menu", // MaxLen: 16
.filter					= "Filtr", // MaxLen: 7 (with ':' + settings: "None", "CC", "CC,TS", "CC,TS,TG")
.all_channels			= "V�echny Kan�ly", // MaxLen: 16
.gotoChannel			= "Na kan�l",  // MaxLen: 11 (" 1024")
.scan					= "Sken", // MaxLen: 16
.channelToVfo			= "Kan�l-->VFO", // MaxLen: 16
.vfoToChannel			= "VFO-->Kan�l", // MaxLen: 16
.vfoToNewChannel		= "VFO-->Nov� k.", // MaxLen: 16
.group					= "Skupina/TG", // MaxLen: 16 (with .type)
.private				= "Soukrom�", // MaxLen: 16 (with .type)
.all					= "V�echno", // MaxLen: 16 (with .type)
.type					= "Typ", // MaxLen: 16 (with .type)
.timeSlot				= "Timeslot", // MaxLen: 16 (plus ':' and  .none, '1' or '2')
.none					= "Nen�", // MaxLen: 16 (with .timeSlot, "Rx CTCSS:" and ""Tx CTCSS:")
.contact_saved			= "Kontakt ulo�en", // MaxLen: 16
.duplicate				= "Duplicitn�", /*"Duplik�t", */ // MaxLen: 16
.tg						= "TG", // MaxLen: 8
.pc						= "PC", // MaxLen: 8
.ts						= "TS", // MaxLen: 8
.mode					= "M�d",  // MaxLen: 12
.colour_code			= "Bar. k�d/CC",/* less common: "Barevn� k�d"*/ // MaxLen: 16 (with ':' * .n_a)
.n_a					= "N/A", // MaxLen: 16 (with ':' * .colour_code)
.bandwidth				= "�. P�sma", // MaxLen: 16 (with ':' + .n_a, "25kHz" or "12.5kHz")
.stepFreq				= "Krok", // MaxLen: 7 (with ':' + xx.xxkHz fitted)
.tot					= "TOT", // MaxLen: 16 (with ':' + .off or 15..3825)
.off					= "Vyp", // MaxLen: 16 (with ':' + .timeout_beep, .band_limits)
.zone_skip				= "P�esko�VZ�n�", // MaxLen: 16 (with ':' + .yes or .no)
.all_skip				= "V�dy p�esko�", // MaxLen: 16 (with ':' + .yes or .no)
.yes					= "Ano", // MaxLen: 16 (with ':' + .zone_skip, .all_skip)
.no						= "Ne", // MaxLen: 16 (with ':' + .zone_skip, .all_skip)
.tg_list				= "Seznam TG", // MaxLen: 16 (with ':' and codeplug group name)
.on						= "Zap", // MaxLen: 16 (with ':' + .band_limits)
.timeout_beep			= "P�p�n�DoL", // MaxLen: 16 (with ':' + .n_a or 5..20 + 's')
.list_full				= "Seznam je pln�",
.dmr_cc_scan			= "CC Sken", // MaxLen: 12 (with ':' + settings: .on or .off)
.band_limits			= "Omezit p�smo", // MaxLen: 16 (with ':' + .on or .off)
.beep_volume			= "Hl. kl�ves", // MaxLen: 16 (with ':' + -24..6 + 'dB')
.dmr_mic_gain			= "Zisk m. DMR", // MaxLen: 16 (with ':' + -33..12 + 'dB')
.fm_mic_gain			= "Zisk m. FM", // MaxLen: 16 (with ':' + 0..31)
.key_long				= "Dr�et Kl.", // MaxLen: 11 (with ':' + x.xs fitted)
.key_repeat				= "Opakuj Kl.", // MaxLen: 11 (with ':' + x.xs fitted)
.dmr_filter_timeout		= "as filtru", // MaxLen: 16 (with ':' + 1..90 + 's')
.brightness				= "Jas", // MaxLen: 16 (with ':' + 0..100 + '%')
.brightness_off			= "Min. jas", // MaxLen: 16 (with ':' + 0..100 + '%')
.contrast				= "Kontrast", // MaxLen: 16 (with ':' + 12..30)
.screen_invert			= "Invertuj", // MaxLen: 16
.screen_normal			= "Norm�ln�", // MaxLen: 16
.backlight_timeout		= "Podsv�cen�", // MaxLen: 16 (with ':' + .no to 30s)
.scan_delay				= "Pauza sken", // MaxLen: 16 (with ':' + 1..30 + 's')
.yes___in_uppercase					= "ANO", // MaxLen: 8 (choice above green/red buttons)
.no___in_uppercase						= "NE", // MaxLen: 8 (choice above green/red buttons)
.DISMISS				= "ODM�TNI", // MaxLen: 8 (choice above green/red buttons)
.scan_mode				= "SkenM�d", // MaxLen: 16 (with ':' + .hold or .pause)
.hold					= "Podr�", // MaxLen: 16 (with ':' + .scan_mode)
.pause					= "Pauza", // MaxLen: 16 (with ':' + .scan_mode)
.list_empty				= "Pr�zdn� seznam", // MaxLen: 16
.delete_contact_qm		= "Smazat kontakt?", // MaxLen: 16
.contact_deleted		= "Kontakt smaz�n", // MaxLen: 16
.contact_used			= "Pou��t kontakt", // MaxLen: 16
.in_tg_list			= "v seznamu TG", // MaxLen: 16
.select_tx				= "Vybrat TX", // MaxLen: 16
.edit_contact			= "Upravit kontakt", // MaxLen: 16
.delete_contact			= "Smazat Kontakt", // MaxLen: 16
.group_call				= "Skupinov� hovor", // MaxLen: 16
.all_call				= "V�ichni", // MaxLen: 16
.tone_scan				= "CTCSS Sken",// MaxLen: 16
.low_battery			= "SLAB� BATERIE!",//// MaxLen: 16
.Auto					= "Auto", // MaxLen 16 (with .mode + ':')
.manual					= "Manualn�",  // MaxLen 16 (with .mode + ':')
.ptt_toggle				= "Z�mek PTT", // MaxLen 16 (with ':' + .on or .off)
.private_call_handling		= "Povol soukr.", // MaxLen 16 (with ':' + .on ot .off)
.stop					= "Ukon�i", // Maxlen 16 (with ':' + .scan_mode)
.one_line				= "1 ��dek", // MaxLen 16 (with ':' + .contact)
.two_lines				= "2 ��dky", // MaxLen 16 (with ':' + .contact)
.new_channel			= "Nov� Kan�l", // MaxLen: 16, leave room for a space and four channel digits after
.priority_order				= "Po�ad�", // MaxLen 16 (with ':' + 'Cc/DB/TA')
.dmr_beep				= "DMR p�p.", // MaxLen 16 (with ':' + .star/.stop/.both/.none)
.start					= "Za��tek", // MaxLen 16 (with ':' + .dmr_beep)
.both					= "Za�./K.", // MaxLen 16 (with ':' + .dmr_beep)
.vox_threshold                          = "VOX Pr�h", // MaxLen 16 (with ':' + .off or 1..30)
.vox_tail                               = "VOX Dozvuk", // MaxLen 16 (with ':' + .n_a or '0.0s')
.audio_prompt				= "Zvuky",// Maxlen 16 (with ':' + .silent, .beep or .voice_prompt_level_1)
.silent                                 = "Tich�", // Maxlen 16 (with : + audio_prompt)
.rx_beep				= "RX p�p.", // MaxLen 16 (with ':' + .carrier/.talker/.both/.none)
.beep					= "P�p�n�", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_1					= "Hlas", // Maxlen 16 (with : + audio_prompt, satellite "mode")
.transmitTalkerAliasTS1	= "TA TX TS1", // Maxlen 16 (with : + .off .text APRS .both)
.squelch_VHF			= "VHF Squelch",// Maxlen 16 (with : + XX%)
.squelch_220			= "220 Squelch",// Maxlen 16 (with : + XX%)
.squelch_UHF			= "UHF Squelch", // Maxlen 16 (with : + XX%)
.display_screen_invert = "Obraz" , // Maxlen 16 (with : + .screen_normal or .screen_invert)
.openGD77 				= "OpenGD77",// Do not translate
.talkaround 				= "Talkaround", // Maxlen 16 (with ':' + .on , .off or .n_a)
.APRS 					= "APRS", // Maxlen 16 (with : + .transmitTalkerAliasTS1 or transmitTalkerAliasTS2)
.no_keys 				= "Bez Kl�v.", // Maxlen 16 (with : + audio_prompt)
.gitCommit				= "Git commit",
.voice_prompt_level_2	= "Hlas �2", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_3	= "Hlas �3", // Maxlen 16 (with : + audio_prompt)
.dmr_filter				= "DMR Filtr",// MaxLen: 12 (with ':' + settings: "TG" or "Ct" or "TGL")
.talker					= "Talker",
.dmr_ts_filter			= "TS Filtr", // MaxLen: 12 (with ':' + settings: .on or .off)
.dtmf_contact_list			= "FM DTMF kontakt", // Maxlen: 16
.channel_power				= "V�konKan�l", //Displayed as "Ch Power:" + .from_master or "Ch Power:"+ power text e.g. "Power:500mW" . Max total length 16
.from_master				= "Ru�n�",// Displayed if per-channel power is not enabled  the .channel_power
.set_quickkey				= "Nastav zkratku", // MaxLen: 16
.dual_watch				= "Dual Watch", // MaxLen: 16
.info					= "Info", // MaxLen: 16 (with ':' + .off or.ts or .pwr or .both)
.pwr					= "V�kon",
.user_power				= "U�.V�kon",
.temperature				= "Teplota", // MaxLen: 16 (with ':' + .celcius or .fahrenheit)
.celcius				= "�C",
.seconds				= "sekund",
.radio_info				= "Informace o TRX",
.temperature_calibration		= "K. teploty",
.pin_code				= "K�d PIN",
.please_confirm				= "Pros�m potvr�", // MaxLen: 15
.vfo_freq_bind_mode			= "Prov�zat f.",
.overwrite_qm				= "P�epsat?", //Maxlen: 14 chars
.eco_level				= "Eko �rove�",
.buttons				= "Tla��tka",
.leds					= "LEDky",
.scan_dwell_time			= "ekat p�i sk.",
.battery_calibration			= "K. baterie",
.low					= "N�zk�",
.high					= "Vysok�",
.dmr_id					= "DMR ID",
.scan_on_boot				= "Sken po zap.",
.dtmf_entry				= "Zad�n� DTMF",
.name					= "N�zev",
.carrier				= "Nosn�",
.zone_empty 				= "Nic v Z�n�", // Maxlen: 12 chars.
.time					= "as",
.uptime					= "Od zapnut�",
.hours					= "Hodin",
.minutes				= "Minut",
.satellite				= "Dru�ice",
.alarm_time				= "as Alarmu",
.location				= "Poloha",
.date					= "Datum",
.timeZone				= "as. z�na",
.suspend				= "Uspat",
.pass					= "Pr�chod", // For satellite screen
.elevation				= "El",
.azimuth				= "Az",
.inHHMMSS				= "v",
.predicting				= "P�edpov�d�m",
.maximum				= "Max",
.satellite_short		= "Sat",
.local					= "M�stn�",
.UTC					= "UTC",
.symbols				= "SJVZ", // symbols: N,S,E,W
.not_set				= "NENASTAVENO",
.general_options		= "Obecn� nastav.",
.radio_options			= "Nastaven� TRX",
.auto_night				= "No�n� autom.", // MaxLen: 16 (with .on or .off)
.dmr_rx_agc				= "DMR RX AGC",
.speaker_click_suppress			= "Potla�Cvak�n�",
.gps					= "GPS",
.end_only				= "Jen konec",
.dmr_crc				= "DMR crc",
.eco					= "Eko",
.safe_power_on				= "Bezpe�n�Zap", // MaxLen: 16 (with ':' + .on or .off)
.auto_power_off				= "Auto Vypnut�", // MaxLen: 16 (with ':' + 30/60/90/120/180 or .no)
.apo_with_rf				= "APO p�i RF", // MaxLen: 16 (with ':' + .yes or .no or .n_a)
.brightness_night				= "No�n� jas", // MaxLen: 16 (with : + 0..100 + %)
.freq_set_VHF                  = "Korekce VHF",
.gps_acquiring			= "Z�sk�v�m",
.altitude				= "n.v.",
.calibration            = "Kalibrace r�dia",
.freq_set_UHF           = "Korekce UHF",
.cal_frequency          = "KalFrek.",
.cal_pwr                = "KalV�kon",
.pwr_set                = "Korekce v�k.",
.factory_reset          = "Tov�rn� kal.",
.rx_tune				= "Lad�n� RX",
.transmitTalkerAliasTS2	= "TA TX TS2", // Maxlen 16 (with : + .ta_text, 'APRS' , .both or .off)
.ta_text				= "Text",
.daytime_theme_day			= "Denn� vzhled", // MaxLen: 16
.daytime_theme_night			= "No�n� vzhled", // MaxLen: 16
.theme_chooser				= "V�b�r vzhledu", // Maxlen: 16
.theme_options				= "Volby vzhledu",
.theme_fg_default			= "V�choz� text", // MaxLen: 16 (+ colour rect)
.theme_bg				= "Pozad�", // MaxLen: 16 (+ colour rect)
.theme_fg_decoration			= "Dekorace", // MaxLen: 16 (+ colour rect)
.theme_fg_text_input			= "Vstup textu", // MaxLen: 16 (+ colour rect)
.theme_fg_splashscreen			= "Pop�ed� �v. o.", // MaxLen: 16 (+ colour rect)
.theme_bg_splashscreen			= "Pozad� �v. o.", // MaxLen: 16 (+ colour rect)
.theme_fg_notification			= "Text. notif.", // MaxLen: 16 (+ colour rect)
.theme_fg_warning_notification		= "Upozorn�n�", // MaxLen: 16 (+ colour rect)
.theme_fg_error_notification		= "Chybov� notif.", // MaxLen: 16 (+ colour rect)
.theme_bg_notification                  = "Pozad� notif.", // MaxLen: 16 (+ colour rect)
.theme_fg_menu_name			= "N�zev menu", // MaxLen: 16 (+ colour rect)
.theme_bg_menu_name			= "Pozad� n�zvu m", // MaxLen: 16 (+ colour rect)
.theme_fg_menu_item			= "Polo�ka menu", // MaxLen: 16 (+ colour rect)
.theme_fg_menu_item_selected		= "Zv�razn�n� p.", // MaxLen: 16 (+ colour rect)
.theme_fg_options_value			= "Hodnota volby", // MaxLen: 16 (+ colour rect)
.theme_fg_header_text			= "Text z�hlav�", // MaxLen: 16 (+ colour rect)
.theme_bg_header_text			= "Pozad� z�hl.", // MaxLen: 16 (+ colour rect)
.theme_fg_rssi_bar			= "RSSI p�s", // MaxLen: 16 (+ colour rect)
.theme_fg_rssi_bar_s9p			= "RSSI p�s S9+", // Maxlen: 16 (+colour rect)
.theme_fg_channel_name			= "N�zev kan�lu", // MaxLen: 16 (+ colour rect)
.theme_fg_channel_contact		= "Kontakt", // MaxLen: 16 (+ colour rect)
.theme_fg_channel_contact_info		= "Info o kontaktu", // MaxLen: 16 (+ colour rect)
.theme_fg_zone_name			= "N�zev z�ny", // MaxLen: 16 (+ colour rect)
.theme_fg_rx_freq			= "Frekvence RX", // MaxLen: 16 (+ colour rect)
.theme_fg_tx_freq			= "Frekvence TX", // MaxLen: 16 (+ colour rect)
.theme_fg_css_sql_values		= "Hodnoty CSS/SQL", // MaxLen: 16 (+ colour rect)
.theme_fg_tx_counter			= "Odpo�et lim. TX", // MaxLen: 16 (+ colour rect)
.theme_fg_polar_drawing			= "Pol�rn� graf", // MaxLen: 16 (+ colour rect)
.theme_fg_satellite_colour		= "Te�ka Sat.", // MaxLen: 16 (+ colour rect)
.theme_fg_gps_number			= "�slo GPS s.", // MaxLen: 16 (+ colour rect)
.theme_fg_gps_colour			= "Te�ka GPS s.", // MaxLen: 16 (+ colour rect)
.theme_fg_bd_colour			= "Te�ka BeiDou s.", // MaxLen: 16 (+ colour rect)
.theme_colour_picker_red		= "erven� (R)", // MaxLen 16 (with ':' + 3 digits value)
.theme_colour_picker_green		= "Zelen� (G)", // MaxLen 16 (with ':' + 3 digits value)
.theme_colour_picker_blue		= "Modr� (B)", // MaxLen 16 (with ':' + 3 digits value)
.volume					= "Hlasit.", // MaxLen: 8
.distance_sort				= "T�. vzd�l.", // MaxLen 16 (with ':' + .on or .off)
.show_distance				= "Uka� vzd�l.", // MaxLen 16 (with ':' + .on or .off)
.aprs_options				= "Nastaven� APRS", // MaxLen 16
.aprs_smart				= "Chytr�", // MaxLen 16 (with ':' + .mode)
.aprs_channel				= "Kan�l", // MaxLen 16 (with ':' + .location)
.aprs_decay				= "Sn�en� fr.", // MaxLen 16 (with ':' + .on or .off)
.aprs_compress				= "Komprimuj z.", // MaxLen 16 (with ':' + .on or .off)
.aprs_interval				= "Interval", // MaxLen 16 (with ':' + 0.2..60 + 'min')
.aprs_message_interval			= "Interval zpr.", // MaxLen 16 (with ':' + 3..30)
.aprs_slow_rate				= "N�zk� fr.", // MaxLen 16 (with ':' + 1..100 + 'min')
.aprs_fast_rate				= "Vysok� f.", // MaxLen 16 (with ':' + 10..180 + 's')
.aprs_low_speed				= "N�zk� r.", // MaxLen 16 (with ':' + 2..30 + 'km/h')
.aprs_high_speed			= "Vysok� r.", // MaxLen 16 (with ':' + 2..90 + 'km/h')
.aprs_turn_angle			= "�hel zat.", // MaxLen 16 (with ':' + 5..90 + '<degree>')
.aprs_turn_slope			= "Sklon zat", // MaxLen 16 (with ':' + 1..255 + '<degree>/v')
.aprs_turn_time				= "Doba zat.", // MaxLen 16 (with ':' + 5..180 + 's')
.auto_lock				= "Auto lock", // MaxLen 16 (with ':' + .off or 0.5..15 (.5 step) + 'min')
};
/********************************************************************
 *
 * VERY IMPORTANT.
 * This file should not be saved with UTF-8 encoding
 * Use Notepad++ on Windows with ANSI encoding
 * or emacs on Linux with windows-1252-unix encoding
 *
 ********************************************************************/
#endif /* USER_INTERFACE_LANGUAGES_CZECH_H  */
