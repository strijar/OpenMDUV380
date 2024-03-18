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
 * Translators: FEBE
 *2021.10.03
 *
 *
 */
#ifndef USER_INTERFACE_LANGUAGES_HUNGARIAN_H_
#define USER_INTERFACE_LANGUAGES_HUNGARIAN_H_
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
const stringsTable_t hungarianLanguage=
{
.magicNumber                            = { LANGUAGE_TAG_MAGIC_NUMBER, LANGUAGE_TAG_VERSION },
.LANGUAGE_NAME				= "Magyar",
.menu					= "Men�",
.credits				= "Fejleszt�k",
.zone					= "Z�na v�laszt�s",
.rssi					= "RF jelszint",
.battery				= "Akkuml�tor",
.contacts				= "Kapcsolatok",
.last_heard				= "Utols� hallott",
.firmware_info				= "Firmware-r�l",
.options				= "Be�ll�t�sok",
.display_options			= "Kijelz� be�ll.",
.sound_options				= "Hangok be�ll.",
.channel_details			= "Csatorna be�ll.",
.language				= "Nyelvezet",
.new_contact				= "�j kapcsolat",
.dmr_contacts				= "DMR kapcsolatok",
.contact_details			= "Kapcsolat",
.hotspot_mode				= "Hotspot",
.built					= "�ssze�ll�tva",
.zones					= "Z�n�k lista",
.keypad					= "Billenyt�",
.ptt					= "PTT",
.locked					= "lez�rva",
.press_sk2_plus_star			= "SK2 als� gomb+*",
.to_unlock				= "felold�s",
.unlocked				= "Feloldva",
.power_off				= "KIKAPCSOL�S",
.error					= "HIBA !",
.rx_only				= "Csak v�tel!",
.out_of_band				= "S�VON K�V�L",
.timeout				= "TX V�GE",
.tg_entry				= "Bel�p�s TG",
.pc_entry				= "Bel�p�s ID",
.user_dmr_id				= "Saj�t DMR ID",
.contact				= "Kapcsolat",
.accept_call				= "Fogadja h�v�st?",
.private_call				= "Priv�t h�v�s",
.squelch				= "Zajz�r",
.quick_menu				= "Gyorsmen�",
.filter					= "Sz�r�",
.all_channels				= "�sszes csat.",
.gotoChannel				= "Ugr�s csatorna",
.scan					= "Jel keres�s",
.channelToVfo				= "Csatorna -> VFO",
.vfoToChannel				= "VFO -> Csatorna",
.vfoToNewChannel			= "VFO -> �j csat.",
.group					= "csoport",
.private				= "Mag�n",
.all					= "Mind",
.type					= "T�pus",
.timeSlot				= "TS id�r�s",
.none					= "Nincs",
.contact_saved				= "Kapcsolat mentve",
.duplicate				= "Van m�r",
.tg					= "TG",
.pc					= "ID",
.ts					= "TS",
.mode					= "M�d",
.colour_code				= "CC sz�nk.",
.n_a					= "Nincs",
.bandwidth				= "S�vsz�l.",
.stepFreq				= "L�p�s",
.tot					= "TOT ad�sid�",
.off					= "Ki",
.zone_skip				= "Z�n.kihagy",
.all_skip				= "Mindig kihagy",
.yes					= "Igen",
.no					= "Nem",
.tg_list				= "TG Lst",
.on					= "Be",
.timeout_beep				= "TOT jelz�s",
.list_full				= "Teljes lista",
.dmr_cc_scan				= "CC keres�s",
.band_limits				= "S�v limit",
.beep_volume				= "Bip szint",
.dmr_mic_gain				= "DMR mikr.",
.fm_mic_gain				= "FM mikr.",
.key_long				= "Hossz.bill.",
.key_repeat				= "Bill. ism.",
.dmr_filter_timeout			= "Sz�r� k�sl.",
.brightness				= "F�nyer�",
.brightness_off				= "Min.f�nyer�",
.contrast				= "Kontraszt",
.screen_invert				= "Inverz",
.screen_normal				= "Norm�l",
.backlight_timeout			= "Kijelz� id�",
.scan_delay				= "Keres.k�sl.",
.yes___in_uppercase			= "IGEN",
.no___in_uppercase			= "NEM",
.DISMISS				= "ELUTAS�T",
.scan_mode				= "Keres.m�d",
.hold					= "Tart",
.pause					= "Sz�net",
.list_empty				= "�res lista",
.delete_contact_qm			= "T�rli kapcs.ot?",
.contact_deleted			= "Kapcs. t�r�lve",
.contact_used				= "Haszn�lt kapcs.",
.in_tg_list				= "TG list�ban",
.select_tx				= "V�laszt TX",
.edit_contact				= "Kapcsolat szerk.",
.delete_contact				= "Kapcs. t�rl�s",
.group_call				= "Csoport h�v�s",
.all_call				= "�sszes h�v�s",
.tone_scan				= "TONE ker.",
.low_battery				= "AKKU LEMER�LT",
.Auto					= "Auto",
.manual					= "K�zi",
.ptt_toggle				= "Marad� PTT",
.private_call_handling			= "PC lehet.",
.stop					= "Stop",
.one_line				= "1 sor",
.two_lines				= "2 sor",
.new_channel				= "�j csatorna",
.priority_order				= "Prior.",
.dmr_beep				= "DMR ad�s",
.start					= "Start",
.both					= "Mind",
.vox_threshold				= "VOX k�sz�b",
.vox_tail				= "VOX tart�s",
.audio_prompt				= "Seg�d",
.silent					= "Nincs",
.rx_beep				= "RX beep", // MaxLen 16 (with ':' + .carrier/.talker/.both/.none)
.beep					= "Bip",
.voice_prompt_level_1			= "Hang",
.transmitTalkerAliasTS1			= "TA tov�bb�t 1",
.squelch_VHF				= "Zajz�r VHF",
.squelch_220				= "Zajz�r 220",
.squelch_UHF				= "Zajz�r UHF",
.display_screen_invert 		= "Pixelek" ,
.openGD77 				= "OpenGD77",
.talkaround 				= "Talkaround", // Maxlen 16 (with ':' + .on , .off or .n_a)
.APRS 					= "APRS", // Maxlen 16 (with : + .transmitTalkerAliasTS1 or transmitTalkerAliasTS2)
.no_keys 				= "No Keys", // Maxlen 16 (with : + audio_prompt)
.gitCommit				= "Git commit",
.voice_prompt_level_2			= "Hang 2",
.voice_prompt_level_3			= "Hang 3",
.dmr_filter				= "DMR sz�r�",
.talker					= "Talker",
.dmr_ts_filter				= "TS sz�r�",
.dtmf_contact_list			= "DTMF kapcsolatok",
.channel_power				= "Csat.telj",
.from_master				= "Master",
.set_quickkey				= "Gyorsgomb be�ll.",
.dual_watch				= "Dual Watch",
.info					= "Inform.",
.pwr					= "Telj.",
.user_power				= "+W- telj.",
.temperature				= "H�m�rs�klet",
.celcius				= "�C",
.seconds				= "mp-ek",
.radio_info				= "R�di� inf�",
.temperature_calibration		= "H�m.kal.",
.pin_code				= "PinK�d",
.please_confirm				= "Meger�s�t�s",
.vfo_freq_bind_mode			= "Frekv.m�sol�s",
.overwrite_qm				= "Fel�l�rja?",
.eco_level				= "Takar�koss�g",
.buttons				= "Gombok",
.leds					= "LED",
.scan_dwell_time			= "Ker.v�r.id�",
.battery_calibration			= "Akku kal.",
.low					= "Alacsony",
.high					= "Magas",
.dmr_id					= "ID DMR",
.scan_on_boot				= "Ker.ind.kor",
.dtmf_entry				= "DTMF k�ld�s",
.name					= "N�v",
.carrier				= "Carrier",
.zone_empty 				= "Zone empty", // Maxlen: 12 chars.
.time					= "Id�, m�d",
.uptime					= "�zemid�",
.hours					= "�r�k",
.minutes				= "Percek",
.satellite				= "M�hold",
.alarm_time				= "Riaszt�s id�",
.location				= "Elhelyezked�s",
.date					= "D�tum",
.timeZone				= "Id�z�na",
.suspend				= "Felf�ggeszt",
.pass					= "Pass",
.elevation				= "El",
.azimuth				= "Az",
.inHHMMSS				= "in",
.predicting				= "El�rejelz�s",
.maximum				= "Max",
.satellite_short			= "K�v. SAT",
.local					= "Helyi",
.UTC					= "UTC",
.symbols				= "�DKN", 		// symbols: N,S,E,W
.not_set				= "NINCS BE�LL�TVA",
.general_options			= "�ltal�nos",
.radio_options				= "R�di� be�ll.",
.auto_night				= "Auto night", // MaxLen: 16 (with .on or .off)
.dmr_rx_agc				= "DMR Rx AGC",
.speaker_click_suppress			= "Katt.elnyom",
.gps					= "GPS",
.end_only				= "V�g�n",
.dmr_crc				= "DMR crc",
.eco					= "Takar�kos",
.safe_power_on				= "Bizt.BEkapcs.", // MaxLen: 16 (with ':' + .on or .off)
.auto_power_off				= "AUto LEkapcs", // MaxLen: 16 (with ':' + 30/60/90/120/180 or .no)
.apo_with_rf				= "AULE RF-el", // MaxLen: 16 (with ':' + .yes or .no or .n_a)
.brightness_night				= "Nite bright", // MaxLen: 16 (with : + 0..100 + %)
.freq_set_VHF			= "Freq VHF",
.gps_acquiring			= "Acquiring",
.altitude				= "Alt",
.calibration            = "Calibration",
.freq_set_UHF                = "Freq UHF",
.cal_frequency          = "Freq",
.cal_pwr                = "Power level",
.pwr_set                = "Power Adjust",
.factory_reset          = "Factory Reset",
.rx_tune				= "Rx Tuning",
.transmitTalkerAliasTS2	= "TA Tx TS2", // Maxlen 16 (with : + .ta_text, 'APRS' , .both or .off)
.ta_text				= "Text",
.daytime_theme_day			= "Day theme", // MaxLen: 16
.daytime_theme_night			= "Night theme", // MaxLen: 16
.theme_chooser				= "Theme chooser", // Maxlen: 16
.theme_options				= "Theme options",
.theme_fg_default			= "Text Default", // MaxLen: 16 (+ colour rect)
.theme_bg				= "Background", // MaxLen: 16 (+ colour rect)
.theme_fg_decoration			= "Decoration", // MaxLen: 16 (+ colour rect)
.theme_fg_text_input			= "Text input", // MaxLen: 16 (+ colour rect)
.theme_fg_splashscreen			= "Foregr. boot", // MaxLen: 16 (+ colour rect)
.theme_bg_splashscreen			= "Backgr. boot", // MaxLen: 16 (+ colour rect)
.theme_fg_notification			= "Text notif.", // MaxLen: 16 (+ colour rect)
.theme_fg_warning_notification		= "Warning notif.", // MaxLen: 16 (+ colour rect)
.theme_fg_error_notification		= "Error notif", // MaxLen: 16 (+ colour rect)
.theme_bg_notification                  = "Backgr. notif", // MaxLen: 16 (+ colour rect)
.theme_fg_menu_name			= "Menu name", // MaxLen: 16 (+ colour rect)
.theme_bg_menu_name			= "Menu name bkg", // MaxLen: 16 (+ colour rect)
.theme_fg_menu_item			= "Menu item", // MaxLen: 16 (+ colour rect)
.theme_fg_menu_item_selected		= "Menu highlight", // MaxLen: 16 (+ colour rect)
.theme_fg_options_value			= "Option value", // MaxLen: 16 (+ colour rect)
.theme_fg_header_text			= "Header text", // MaxLen: 16 (+ colour rect)
.theme_bg_header_text			= "Header text bkg", // MaxLen: 16 (+ colour rect)
.theme_fg_rssi_bar			= "RSSI bar", // MaxLen: 16 (+ colour rect)
.theme_fg_rssi_bar_s9p			= "RSSI bar S9+", // Maxlen: 16 (+colour rect)
.theme_fg_channel_name			= "Channel name", // MaxLen: 16 (+ colour rect)
.theme_fg_channel_contact		= "Contact", // MaxLen: 16 (+ colour rect)
.theme_fg_channel_contact_info		= "Contact info", // MaxLen: 16 (+ colour rect)
.theme_fg_zone_name			= "Zone name", // MaxLen: 16 (+ colour rect)
.theme_fg_rx_freq			= "RX freq", // MaxLen: 16 (+ colour rect)
.theme_fg_tx_freq			= "TX freq", // MaxLen: 16 (+ colour rect)
.theme_fg_css_sql_values		= "CSS/SQL values", // MaxLen: 16 (+ colour rect)
.theme_fg_tx_counter			= "TX counter", // MaxLen: 16 (+ colour rect)
.theme_fg_polar_drawing			= "Polar", // MaxLen: 16 (+ colour rect)
.theme_fg_satellite_colour		= "Sat. spot", // MaxLen: 16 (+ colour rect)
.theme_fg_gps_number			= "GPS number", // MaxLen: 16 (+ colour rect)
.theme_fg_gps_colour			= "GPS spot", // MaxLen: 16 (+ colour rect)
.theme_fg_bd_colour			= "BeiDou spot", // MaxLen: 16 (+ colour rect)
.theme_colour_picker_red		= "Red", // MaxLen 16 (with ':' + 3 digits value)
.theme_colour_picker_green		= "Green", // MaxLen 16 (with ':' + 3 digits value)
.theme_colour_picker_blue		= "Blue", // MaxLen 16 (with ':' + 3 digits value)
.volume					= "Volume", // MaxLen: 8
.distance_sort				= "Dist sort", // MaxLen 16 (with ':' + .on or .off)
.show_distance				= "Show dist", // MaxLen 16 (with ':' + .on or .off)
.aprs_options				= "APRS options", // MaxLen 16
.aprs_smart				= "Smart", // MaxLen 16 (with ':' + .mode)
.aprs_channel				= "Channel", // MaxLen 16 (with ':' + .location)
.aprs_decay				= "Decay", // MaxLen 16 (with ':' + .on or .off)
.aprs_compress				= "Compress", // MaxLen 16 (with ':' + .on or .off)
.aprs_interval				= "Interval", // MaxLen 16 (with ':' + 0.2..60 + 'min')
.aprs_message_interval			= "Msg Interval", // MaxLen 16 (with ':' + 3..30)
.aprs_slow_rate				= "Slow Rate", // MaxLen 16 (with ':' + 1..100 + 'min')
.aprs_fast_rate				= "Fast Rate", // MaxLen 16 (with ':' + 10..180 + 's')
.aprs_low_speed				= "Low Speed", // MaxLen 16 (with ':' + 2..30 + 'km/h')
.aprs_high_speed			= "Hi Speed", // MaxLen 16 (with ':' + 2..90 + 'km/h')
.aprs_turn_angle			= "T. Angle", // MaxLen 16 (with ':' + 5..90 + '<degree>')
.aprs_turn_slope			= "T. Slope", // MaxLen 16 (with ':' + 1..255 + '<degree>/v')
.aprs_turn_time				= "T. Time", // MaxLen 16 (with ':' + 5..180 + 's')
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
#endif /* USER_INTERFACE_LANGUAGES_HUNGARIAN_H_ */
