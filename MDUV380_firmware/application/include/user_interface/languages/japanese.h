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
 * Translators: JE4SMQ
 *
 *
 * Rev:
 */
#ifndef USER_INTERFACE_LANGUAGES_JAPANESE_H_
#define USER_INTERFACE_LANGUAGES_JAPANESE_H_
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
const stringsTable_t japaneseLanguage =
{
.magicNumber                            = { LANGUAGE_TAG_MAGIC_NUMBER, LANGUAGE_TAG_VERSION },
.LANGUAGE_NAME 				= "��ݺ�", // MaxLen: 16
.menu					= "�ƭ-", // MaxLen: 16
.credits				= "���¼�", // MaxLen: 16
.zone					= "��-�", // MaxLen: 16
.rssi					= "RSSI", // MaxLen: 16
.battery				= "����", // MaxLen: 16
.contacts				= "�����", // MaxLen: 16
.last_heard				= "�ޭ��۸�", // MaxLen: 16
.firmware_info				= "̧-ѳ���ޮ�γ", // MaxLen: 16
.options				= "��߼��", // MaxLen: 16
.display_options			= "ˮ��� ��߼��", // MaxLen: 16
.sound_options				= "�ݾ�  ��߼��", // MaxLen: 16
.channel_details			= "����� Ųֳ", // MaxLen: 16
.language				= "Language", // MaxLen: 16
.new_contact				= "New �����", // MaxLen: 16
.dmr_contacts				= "DMR �����", // MaxLen: 16
.contact_details			= "�����Ųֳ", // MaxLen: 16
.hotspot_mode				= "ίĽ�߯�", // MaxLen: 16
.built					= "Built", // MaxLen: 16
.zones					= "��-�", // MaxLen: 16
.keypad					= "�-�߯��", // MaxLen: 12 (with .ptt)
.ptt					= "PTT", // MaxLen: 12 (with .keypad)
.locked					= "ۯ�", // MaxLen: 15
.press_sk2_plus_star			= "SK2 + *", // MaxLen: 16
.to_unlock				= "ۯ����ޮ", // MaxLen: 16
.unlocked				= "ۯ����ޮ���", // MaxLen: 15
.power_off				= "��ݹ�� Off...", // MaxLen: 16
.error					= "��-", // MaxLen: 8
.rx_only				= "���ݷݼ", // MaxLen: 14
.out_of_band				= "�������", // MaxLen: 14
.timeout				= "��ѱ��", // MaxLen: 8
.tg_entry				= "TG ƭ�خ�", // MaxLen: 15
.pc_entry				= "PC ƭ�خ�", // MaxLen: 15
.user_dmr_id				= "�-��- DMR ID", // MaxLen: 15
.contact 				= "�����", // MaxLen: 15
.accept_call				= "Return call to", // MaxLen: 16
.private_call				= "��ײ��-ĺ-�", // MaxLen: 16
.squelch				= "����", // MaxLen: 8
.quick_menu 				= "�����ƭ-", // MaxLen: 16
.filter					= "̨��-", // MaxLen: 7 (with ':' + settings: .none, "CC", "CC,TS", "CC,TS,TG")
.all_channels				= "��������", // MaxLen: 16
.gotoChannel				= "����ٲ�޳",  // MaxLen: 11 (" 1024")
.scan					= "����", // MaxLen: 16
.channelToVfo				= "����� --> VFO", // MaxLen: 16
.vfoToChannel				= "VFO --> �����", // MaxLen: 16
.vfoToNewChannel			= "VFO --> New�����", // MaxLen: 16
.group					= "���-��", // MaxLen: 16 (with .type)
.private				= "��ײ��-�", // MaxLen: 16 (with .type)
.all					= "�-�", // MaxLen: 16 (with .type)
.type					= "����", // MaxLen: 16 (with .type)
.timeSlot				= "��ѽۯ�", // MaxLen: 16 (plus ':' and  .none, '1' or '2')
.none					= "ż", // MaxLen: 16 (with .timeSlot, "Rx CTCSS:" and ""Tx CTCSS:", .filter/.mode/.dmr_beep)
.contact_saved				= "����� ο�ݽ�", // MaxLen: 16
.duplicate				= "�ޭ�̸", // MaxLen: 16
.tg					= "TG",  // MaxLen: 8
.pc					= "PC", // MaxLen: 8
.ts					= "TS", // MaxLen: 8
.mode					= "�-��",  // MaxLen: 12
.colour_code				= "��-�-��", // MaxLen: 16 (with ':' * .n_a)
.n_a					= "N/A",// MaxLen: 16 (with ':' * .colour_code)
.bandwidth				= "��������", // MaxLen: 16 (with ':' + .n_a, "25kHz" or "12.5kHz")
.stepFreq				= "�ï��", // MaxLen: 7 (with ':' + xx.xxkHz fitted)
.tot					= "TOT", // MaxLen: 16 (with ':' + .off or 15..3825)
.off					= "��", // MaxLen: 16 (with ':' + .timeout_beep, .band_limits)
.zone_skip				= "��-� �����", // MaxLen: 16 (with ':' + .yes or .no)
.all_skip				= "�-� �����", // MaxLen: 16 (with ':' + .yes or .no)
.yes					= "ʲ", // MaxLen: 16 (with ':' + .zone_skip, .all_skip or .factory_reset)
.no					= "���", // MaxLen: 16 (with ':' + .zone_skip, .all_skip or .factory_reset)
.tg_list				= "TG Lst", // MaxLen: 16 (with ':' and codeplug group name)
.on					= "��", // MaxLen: 16 (with ':' + .band_limits)
.timeout_beep				= "��ѱ����-��", // MaxLen: 16 (with ':' + .n_a or 5..20 + 's')
.list_full				= "List full",
.dmr_cc_scan				= "CC����", // MaxLen: 12 (with ':' + settings: .on or .off)
.band_limits				= "����޾����", // MaxLen: 16 (with ':' + .on or .off)
.beep_volume				= "��-�ߵ�خ�", // MaxLen: 16 (with ':' + -24..6 + 'dB')
.dmr_mic_gain				= "DMR ϲ��޲�", // MaxLen: 16 (with ':' + -33..12 + 'dB')
.fm_mic_gain				= "FM ϲ��޲�", // MaxLen: 16 (with ':' + 0..31)
.key_long				= "�-�ݸ�", // MaxLen: 11 (with ':' + x.xs fitted)
.key_repeat				= "�-���-�", // MaxLen: 11 (with ':' + x.xs fitted)
.dmr_filter_timeout			= "̨��-TO", // MaxLen: 16 (with ':' + 1..90 + 's')
.brightness				= "��ٻ", // MaxLen: 16 (with ':' + 0..100 + '%')
.brightness_off				= "�ި�-", // MaxLen: 16 (with ':' + 0..100 + '%')
.contrast				= "���׽�", // MaxLen: 16 (with ':' + 12..30)
.screen_invert				= "����", // MaxLen: 16
.screen_normal				= "³�ޮ�", // MaxLen: 16
.backlight_timeout			= "��ѱ��", // MaxLen: 16 (with ':' + .no to 30s)
.scan_delay				= "�����ިڲ", // MaxLen: 16 (with ':' + 1..30 + 's')
.yes___in_uppercase			= "ʲ", // MaxLen: 8 (choice above green/red buttons)
.no___in_uppercase			= "���", // MaxLen: 8 (choice above green/red buttons)
.DISMISS				= "���߲", // MaxLen: 8 (choice above green/red buttons)
.scan_mode				= "�����-��", // MaxLen: 16 (with ':' + .hold, .pause or .stop)
.hold					= "�-���", // MaxLen: 16 (with ':' + .scan_mode)
.pause					= "��-��", // MaxLen: 16 (with ':' + .scan_mode)
.list_empty				= "ؽ�ż", // MaxLen: 16
.delete_contact_qm			= "�����ɻ��ޮ?", // MaxLen: 16
.contact_deleted			= "����Ļ��ޮ��", // MaxLen: 16
.contact_used				= "�����ʽ��Ʊ�", // MaxLen: 16
.in_tg_list				= "in TG list", // MaxLen: 16
.select_tx				= "���ݾ���", // MaxLen: 16
.edit_contact				= "����� �����", // MaxLen: 16
.delete_contact				= "����� ���ޮ", // MaxLen: 16
.group_call				= "���-�ߺ-�", // MaxLen: 16
.all_call				= "�-ٺ-�", // MaxLen: 16
.tone_scan				= "�-ݽ���", // MaxLen: 16
.low_battery				= "����-��� !!!", // MaxLen: 16
.Auto					= "�-�", // MaxLen 16 (with .mode + ':')
.manual					= "�ƭ��",  // MaxLen 16 (with .mode + ':')
.ptt_toggle				= "PTT ĸ��", // MaxLen 16 (with ':' + .on or .off)
.private_call_handling			= "PC��¹", // MaxLen 16 (with ':' + .on or .off)
.stop					= "�į��", // Maxlen 16 (with ':' + .scan_mode/.dmr_beep)
.one_line				= "1 �ޮ�", // MaxLen 16 (with ':' + .contact)
.two_lines				= "2 �ޮ�", // MaxLen 16 (with ':' + .contact)
.new_channel				= "New �����", // MaxLen: 16, leave room for a space and four channel digits after
.priority_order				= "DB�ޭ�", // MaxLen 16 (with ':' + 'Cc/DB/TA')
.dmr_beep				= "DMR ��-��", // MaxLen 16 (with ':' + .star/.stop/.both/.none)
.start					= "��-�", // MaxLen 16 (with ':' + .dmr_beep)
.both					= "خ�γ", // MaxLen 16 (with ':' + .dmr_beep)
.vox_threshold                          = "VOX �گ�����", // MaxLen 16 (with ':' + .off or 1..30)
.vox_tail                               = "VOX �-�", // MaxLen 16 (with ':' + .n_a or '0.0s')
.audio_prompt				= "�ݾ���Ų",// Maxlen 16 (with ':' + .silent, .beep or .voice_prompt_level_1)
.silent                                 = "ż", // Maxlen 16 (with : + audio_prompt)
.rx_beep				= "RX beep", // MaxLen 16 (with ':' + .carrier/.talker/.both/.none)
.beep					= "��-��", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_1			= "�ݾ�", // Maxlen 16 (with : + audio_prompt, satellite "mode")
.transmitTalkerAliasTS1			= "TA���� TS1", // Maxlen 16 (with : + .on or .off)
.squelch_VHF				= "VHF ����",// Maxlen 16 (with : + XX%)
.squelch_220				= "220 ����",// Maxlen 16 (with : + XX%)
.squelch_UHF				= "UHF ����", // Maxlen 16 (with : + XX%)
.display_screen_invert 		= "�ޯ���-", // Maxlen 16 (with : + .screen_normal or .screen_invert)
.openGD77 				= "OpenGD77",// Do not translate
.talkaround 				= "Talkaround", // Maxlen 16 (with ':' + .on , .off or .n_a)
.APRS 					= "APRS", // Maxlen 16 (with : + .transmitTalkerAliasTS1 or transmitTalkerAliasTS2)
.no_keys 				= "No Keys", // Maxlen 16 (with : + audio_prompt)
.gitCommit				= "Git commit",
.voice_prompt_level_2			= "�ݾ� L2", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_3			= "�ݾ� L3", // Maxlen 16 (with : + audio_prompt)
.dmr_filter				= "DMR ̨��-",// MaxLen: 12 (with ':' + settings: "TG" or "Ct" or "TGL")
.talker					= "Talker",
.dmr_ts_filter				= "TS ̨��-", // MaxLen: 12 (with ':' + settings: .on or .off)
.dtmf_contact_list			= "DTMF �����ؽ�", // Maxlen: 16
.channel_power				= "Ch Pwr", //Displayed as "Ch Power:" + .from_master or "Ch Power:"+ power text e.g. "Power:500mW" . Max total length 16
.from_master				= "Ͻ�-",// Displayed if per-channel power is not enabled  the .channel_power
.set_quickkey				= "�����- ���", // MaxLen: 16
.dual_watch				= "�ޭ��ܯ�", // MaxLen: 16
.info					= "�ޮ�γ", // MaxLen: 16 (with ':' + .off or .ts or .pwr or .both)
.pwr					= "Pwr",
.user_power				= "�-��-Pwr",
.temperature				= "����", // MaxLen: 16 (with ':' + .celcius or .fahrenheit)
.celcius				= "�C",
.seconds				= "�ޮ�",
.radio_info				= "Ѿݷ �ޮ�γ",
.temperature_calibration		= "���������",
.pin_code				= "�ݼ����ݺ޳",
.please_confirm				= "���ݼø�޻�", // MaxLen: 15
.vfo_freq_bind_mode			= "TRF���޳",
.overwrite_qm				= "����OK?", //Maxlen: 14 chars
.eco_level				= "������",
.buttons				= "����",
.leds					= "LEDs",
.scan_dwell_time			= "����ò��޶�",
.battery_calibration			= "��ݱ������",
.low					= "���",
.high					= "�Բ",
.dmr_id					= "DMR ID",
.scan_on_boot				= "��޳�޽���",
.dtmf_entry				= "DTMF ���ذ",
.name					= "�ϴ",
.carrier				= "Carrier",
.zone_empty 				= "Zone empty", // Maxlen: 12 chars.
.time					= "�޶�",
.uptime					= "Uptime",
.hours					= "�޶�",
.minutes				= "��",
.satellite				= "����",
.alarm_time				= "�װѼ޶�",
.location				= "۹����",
.date					= "˽޹",
.timeZone				= "��ѿް�",
.suspend				= "�������",
.pass					= "�߽", // For satellite screen
.elevation				= "El",
.azimuth				= "Az",
.inHHMMSS				= "in",
.predicting				= "ֿ�",
.maximum				= "Max",
.satellite_short		= "Sat",
.local					= "۰��",
.UTC					= "UTC",
.symbols				= "NSEW", // symbols: N,S,E,W
.not_set				= "��ļŲ",
.general_options		= "�������߼��",
.radio_options			= "Ѿݵ�߼��",
.auto_night				= "Auto night", // MaxLen: 16 (with .on or .off)
.dmr_rx_agc				= "DMR Rx AGC",
.speaker_click_suppress			= "Click Suppr.",
.gps					= "GPS",
.end_only				= "End only",
.dmr_crc				= "DMR crc",
.eco					= "Eco",
.safe_power_on				= "Safe Pwr-On", // MaxLen: 16 (with ':' + .on or .off)
.auto_power_off				= "Auto Pwr-Off", // MaxLen: 16 (with ':' + 30/60/90/120/180 or .no)
.apo_with_rf				= "APO with RF", // MaxLen: 16 (with ':' + .yes or .no or .n_a)
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
#endif /* USER_INTERFACE_LANGUAGES_JAPANESE_H_ */
