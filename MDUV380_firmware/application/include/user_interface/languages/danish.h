/* -*- coding: windows-1252-unix; -*- */
/*
 * Copyright (C) 2019-2022 Roger Clark, VK3KYY / G4KYF
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
 * Translators: OZ1MAX
 *
 *
 * Rev: 2
 */
#ifndef USER_INTERFACE_LANGUAGES_DANISH_H_
#define USER_INTERFACE_LANGUAGES_DANISH_H_
/********************************************************************
 *
 * VERY IMPORTANT.
 * This file should not be saved with UTF-8 encoding
 * Use Notepad++ on Windows with ANSI encoding
 * or emacs on Linux with windows-1252-unix encoding
 *
 ********************************************************************/
const stringsTable_t danishLanguage =
{
.LANGUAGE_NAME 			= "Dansk",
.menu					= "Menu",
.credits				= "Credits",
.zone					= "Zone",
.rssi					= "RSSI",
.battery				= "Batteri",
.contacts				= "Kontakter",
.last_heard				= "Sidst Hørt",
.firmware_info			= "Firmware info",
.options				= "Valg",
.display_options		= "Display Valg",
.sound_options				= "Sound options", // MaxLen: 16
.channel_details		= "Kanal detaljer",
.language				= "Sprog",
.new_contact			= "Ny Kontakt",
.dmr_contacts				= "DMR contacts", // MaxLen: 16
.contact_details		= "Kontakt Detaljer",
.hotspot_mode			= "Hotspot mode",
.built					= "Version",
.zones					= "Zoner",
.keypad					= "Keypad",
.ptt					= "PTT",
.locked					= "Låst",
.press_blue_plus_star	= "Tast Blå + *",
.to_unlock				= "Lås op",
.unlocked				= "Oplåst",
.power_off				= "Lukker Ned...",
.error					= "FEJL",
.rx_only				= "Kun Rx",
.out_of_band			= "Ude af FRQ",
.timeout				= "TIMEOUT",
.tg_entry				= "Indtast TG",
.pc_entry				= "Indtast PC",
.user_dmr_id			= "Bruger DMR ID",
.contact 				= "Kontakt",
.accept_call			= "Modtag kald?",
.private_call			= "Privat kald",
.squelch				= "Squelch",
.quick_menu 			= "Quick Menu",
.filter					= "Filter",
.all_channels			= "Alle kanaler",
.gotoChannel			= "Goto",
.scan					= "Scan",
.channelToVfo			= "Kanal --> VFO",
.vfoToChannel			= "VFO --> Kanal",
.vfoToNewChannel		= "VFO --> Ny Kanal", // MaxLen: 16
.group					= "Gruppe",
.private				= "Privat",
.all					= "Alle",
.type					= "Type",
.timeSlot				= "Timeslot",
.none					= "Ingen",
.contact_saved			= "Kontakt Gemt",
.duplicate				= "Duplet",
.tg						= "TG",
.pc						= "PC",
.ts						= "TS",
.mode					= "Mode",
.colour_code			= "Color Code",
.n_a					= "N/A",
.bandwidth				= "Båndbrede",
.stepFreq				= "Step",
.tot					= "TOT",
.off					= "Fra",
.zone_skip				= "Zone Skip",
.all_skip				= "Alle Skip",
.yes					= "Ja",
.no						= "Nej",
.rx_group				= "Rx Grp",
.on						= "On",
.timeout_beep			= "Timeout bip",
.list_full				= "List full",
.dmr_cc_scan			= "CC Scan", // MaxLen: 12 (with ':' + settings: .on or .off)
.band_limits			= "Åben FRQ",
.beep_volume			= "Bip vol",
.dmr_mic_gain			= "DMR mic",
.fm_mic_gain				= "FM mic", // MaxLen: 16 (with ':' + 0..31)
.key_long				= "Lang Tast",
.key_repeat				= "Tast rpt",
.dmr_filter_timeout		= "Filter tid",
.brightness				= "Lys styrke",
.brightness_off				= "Min bright",
.contrast				= "Kontrast",
.colour_invert			= "Sort",
.colour_normal			= "Normal",
.backlight_timeout		= "Timeout",
.scan_delay				= "Scan delay",
.yes___in_uppercase					= "JA",
.no___in_uppercase						= "NEJ",
.DISMISS				= "FORTRYD",
.scan_mode				= "Scan mode",
.hold					= "Hold",
.pause					= "Pause",
.empty_list				= "Tøm List",
.delete_contact_qm			= "Slet kontakt?",
.contact_deleted			= "kontakt slettet",
.contact_used				= "Kontakt brugt",
.in_rx_group				= "i RX gruppe",
.select_tx				= "Valg TX",
.edit_contact				= "Rediger Kontakt",
.delete_contact				= "Slet Kontakt",
.group_call				= "Grupe Kald",
.all_call				= "Alle Kald",
.tone_scan				= "Tone scan",//// MaxLen: 16
.low_battery			= "LOW BATTERY !!!",//// MaxLen: 16
.Auto					= "Auto", // MaxLen 16 (with .mode + ':') 
.manual					= "Manual",  // MaxLen 16 (with .mode + ':') 
.ptt_toggle				= "PTT toggle", // MaxLen 16 (with ':' + .on or .off)
.private_call_handling			= "Handle PC", // MaxLen 16 (with ':' + .on ot .off)
.stop					= "Stop", // Maxlen 16 (with ':' + .scan_mode)
.one_line				= "1 line", // MaxLen 16 (with ':' + .contact)
.two_lines				= "2 lines", // MaxLen 16 (with ':' + .contact)
.new_channel			= "Ny kanal", // MaxLen: 16, leave room for a space and four channel digits after
.priority_order				= "Order", // MaxLen 16 (with ':' + 'Cc/DB/TA')
.dmr_beep				= "DMR beep", // MaxLen 16 (with ':' + .star/.stop/.both/.none)
.start					= "Start", // MaxLen 16 (with ':' + .dmr_beep)
.both					= "Both", // MaxLen 16 (with ':' + .dmr_beep)
.vox_threshold                          = "VOX Thres.", // MaxLen 16 (with ':' + .off or 1..30)
.vox_tail                               = "VOX Tail", // MaxLen 16 (with ':' + .n_a or '0.0s')
.audio_prompt				= "Prompt",// Maxlen 16 (with ':' + .silent, .beep or .voice_prompt_level_1)
.silent                                 = "Silent", // Maxlen 16 (with : + audio_prompt)
.rx_beep				= "RX beep", // MaxLen 16 (with ':' + .carrier/.talker/.both/.none)
.beep					= "Beep", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_1					= "Voice", // Maxlen 16 (with : + audio_prompt)
.transmitTalkerAliasTS1	= "TA Tx 1", // Maxlen 16 (with : + .off .text APRS .both)
.squelch_VHF			= "VHF Squelch",// Maxlen 16 (with : + XX%)
.squelch_220			= "220 Squelch",// Maxlen 16 (with : + XX%)
.squelch_UHF			= "UHF Squelch", // Maxlen 16 (with : + XX%)
.display_background_colour = "Farve" , // Maxlen 16 (with : + .colour_normal or .colour_invert)
.openGD77 				= "OpenGD77",// Do not translate
.openGD77S 				= "OpenGD77S",// Do not translate
.openDM1801 			= "OpenDM1801",// Do not translate
.openRD5R 				= "OpenRD5R",// Do not translate
.gitCommit				= "Git commit",
.voice_prompt_level_2	= "Voice L2", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_3	= "Voice L3", // Maxlen 16 (with : + audio_prompt)
.dmr_filter				= "DMR Filter",// MaxLen: 12 (with ':' + settings: "TG" or "Ct" or "RxG")
.talker					= "Talker",
.dmr_ts_filter			= "TS Filter", // MaxLen: 12 (with ':' + settings: .on or .off)
.dtmf_contact_list			= "FM DTMF contacts", // Maxlen: 16
.channel_power				= "Ch Power", //Displayed as "Ch Power:" + .from_master or "Ch Power:"+ power text e.g. "Power:500mW" . Max total length 16
.from_master				= "Master",// Displayed if per-channel power is not enabled  the .channel_power
.set_quickkey				= "Set Quickkey", // MaxLen: 16
.dual_watch				= "Dual Watch", // MaxLen: 16
.info					= "Info", // MaxLen: 16 (with ':' + .off or.ts or .pwr or .both)
.pwr					= "Pwr",
.user_power				= "User Power",
.temperature				= "Temperature", // MaxLen: 16 (with ':' + .celcius or .fahrenheit)
.celcius				= "°C",
.seconds				= "seconds",
.radio_info				= "Radio infos",
.temperature_calibration		= "Temp Cal",
.pin_code				= "Pin Code",
.please_confirm				= "Please confirm", // MaxLen: 15
.vfo_freq_bind_mode			= "Freq. Bind",
.overwrite_qm				= "Overwrite ?", //Maxlen: 14 chars
.eco_level				= "Eco Level",
.buttons				= "Buttons",
.leds					= "LEDs",
.scan_dwell_time			= "Scan dwell",
.battery_calibration			= "Batt. Cal",
.low					= "Low",
.high					= "High",
.dmr_id					= "DMR ID",
.scan_on_boot				= "Scan On Boot",
.dtmf_entry				= "DTMF entry",
.name					= "Name",
.carrier				= "Carrier",
.openDM1801A 				= "OpenDM1801A", // Do not translate
.time					= "Time",
.uptime					= "Uptime",
.hours					= "Hours",
.minutes				= "Minutes",
.satellite				= "Satellite",
.alarm_time				= "Alarm time",
.location				= "Location",
.date					= "Date",
.timeZone				= "Timezone",
.suspend				= "Suspend",
.pass					= "Pass", // For satellite screen
.elevation				= "El",
.azimuth				= "Az",
.inHHMMSS				= "in",
.predicting				= "Predicting",
.maximum				= "Max",
.satellite_short		= "Sat",
.local					= "Local",
.UTC					= "UTC",
.symbols				= "NSEW", // symbols: N,S,E,W
.not_set				= "NOT SET",
.general_options		= "General options",
.radio_options			= "Radio options",
.openMD9600				= "OpenMD9600",
.dmr_rx_agc				= "DMR Rx AGC",
.speaker_click_suppress			= "Click Suppr.",
.gps					= "GPS",
.end_only				= "End only",
.dmr_crc				= "DMR crc",
.eco					= "Eco",
.safe_power_on				= "Safe Pwr-On", // MaxLen: 16 (with ':' + .on or .off)
.auto_power_off				= "Auto Pwr-Off", // MaxLen: 16 (with ':' + 30/60/90/120/180 or .no)
.apo_with_rf				= "APO with RF", // MaxLen: 16 (with ':' + .yes or .no or .n_a)
.openMDUV380			= "OpenMDUV380",
.openMD380				= "OpenMD380",
.gps_acquiring			= "Acquiring", 
.altitude				= "Alt",
.calibration            = "Radio Calibration",
.freq_set                = "Freq Adjust",
.cal_frequency          = "Cal Freq",
.cal_pwr                = "Cal Power",
.pwr_set                = "Power Adjust",
.factory_reset          = "Factory Cal",
.rx_tune				= "Rx Tuning",
.transmitTalkerAliasTS2	= "TA Tx TS2", // Maxlen 16 (with : + .ta_text, 'APRS' , .both or .off)
.ta_text				= "Text",
};
/********************************************************************
 *
 * VERY IMPORTANT.
 * This file should not be saved with UTF-8 encoding
 * Use Notepad++ on Windows with ANSI encoding
 * or emacs on Linux with windows-1252-unix encoding
 *
 ********************************************************************/
#endif /* USER_INTERFACE_LANGUAGES_DANISH_H_ */
