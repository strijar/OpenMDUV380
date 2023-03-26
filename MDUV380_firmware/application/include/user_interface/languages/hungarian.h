/* -*- coding: binary; -*- */
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
const stringsTable_t hungarianLanguage=
{
.LANGUAGE_NAME				= "Magyar",
.menu					= "Menü",
.credits				= "Fejlesztõk",
.zone					= "Zóna választás",
.rssi					= "RF jelszint",
.battery				= "Akkumlátor",
.contacts				= "Kapcsolatok",
.last_heard				= "Utolsó hallott",
.firmware_info				= "Firmware-rõl",
.options				= "Beállítások",
.display_options			= "Kijelzõ beáll.",
.sound_options				= "Hangok beáll.",
.channel_details			= "Csatorna beáll.",
.language				= "Nyelvezet",
.new_contact				= "Új kapcsolat",
.dmr_contacts				= "DMR kapcsolatok",
.contact_details			= "Kapcsolat",
.hotspot_mode				= "Hotspot",
.built					= "Összeállítva",
.zones					= "Zónák lista",
.keypad					= "Billenytû",
.ptt					= "PTT",
.locked					= "lezárva",
.press_blue_plus_star			= "Bal alsó gomb+*",
.to_unlock				= "feloldás",
.unlocked				= "Feloldva",
.power_off				= "KIKAPCSOLÁS",
.error					= "HIBA !",
.rx_only				= "Csak vétel!",
.out_of_band				= "SÁVON KÍVÜL",
.timeout				= "TX VÉGE",
.tg_entry				= "Belépés TG",
.pc_entry				= "Belépés ID",
.user_dmr_id				= "Saját DMR ID",
.contact				= "Kapcsolat",
.accept_call				= "Fogadja a hívást?",
.private_call				= "Privát hívás",
.squelch				= "Zajzár",
.quick_menu				= "Gyorsmenü",
.filter					= "Szûrõ",
.all_channels				= "Összes csat.",
.gotoChannel				= "Ugrás csatorna",
.scan					= "Jel keresés",
.channelToVfo				= "Csatorna -> VFO",
.vfoToChannel				= "VFO -> Csatorna",
.vfoToNewChannel			= "VFO -> Új csat.",
.group					= "csoport",
.private				= "Magán",
.all					= "Mind",
.type					= "Típus",
.timeSlot				= "TS idõrés",
.none					= "Nincs",
.contact_saved				= "Kapcsolat mentve",
.duplicate				= "Van már",
.tg					= "TG",
.pc					= "ID",
.ts					= "TS",
.mode					= "Mód",
.colour_code				= "CC színk.",
.n_a					= "Nincs",
.bandwidth				= "Sávszél.",
.stepFreq				= "Lépés",
.tot					= "TOT adásidõ",
.off					= "Ki",
.zone_skip				= "Zón.kihagy",
.all_skip				= "Mindig kihagy",
.yes					= "Igen",
.no					= "Nem",
.rx_group				= "RX csop",
.on					= "Be",
.timeout_beep				= "TOT jelzés",
.list_full				= "Teljes lista",
.dmr_cc_scan				= "CC keresés",
.band_limits				= "Sáv limit",
.beep_volume				= "Bip szint",
.dmr_mic_gain				= "DMR mikr.",
.fm_mic_gain				= "FM mikr.",
.key_long				= "Hossz.bill.",
.key_repeat				= "Bill. ism.",
.dmr_filter_timeout			= "Szûrõ késl.",
.brightness				= "Fényerõ",
.brightness_off				= "Min.fényerõ",
.contrast				= "Kontraszt",
.colour_invert				= "Inverz",
.colour_normal				= "Normál",
.backlight_timeout			= "Kijelzõ idõ",
.scan_delay				= "Keres.késl.",
.yes___in_uppercase			= "IGEN",
.no___in_uppercase			= "NEM",
.DISMISS				= "ELUTASÍT",
.scan_mode				= "Keres.mód",
.hold					= "Tart",
.pause					= "Szünet",
.empty_list				= "Üres lista",
.delete_contact_qm			= "Törli kapcs.ot?",
.contact_deleted			= "Kapcs. törölve",
.contact_used				= "Használt kapcs.",
.in_rx_group				= "Lista TG/ID",
.select_tx				= "Választ TX",
.edit_contact				= "Kapcsolat szerk.",
.delete_contact				= "Kapcs. törlés",
.group_call				= "Csoport hívás",
.all_call				= "Összes hívás",
.tone_scan				= "TONE ker.",
.low_battery				= "AKKU LEMERÜLT",
.Auto					= "Auto",
.manual					= "Kézi",
.ptt_toggle				= "Maradó PTT",
.private_call_handling			= "PC lehet.",
.stop					= "Stop",
.one_line				= "1 sor",
.two_lines				= "2 sor",
.new_channel				= "Új csatorna",
.priority_order				= "Prior.",
.dmr_beep				= "DMR adás",
.start					= "Start",
.both					= "Mind",
.vox_threshold				= "VOX küszöb",
.vox_tail				= "VOX tartás",
.audio_prompt				= "Segéd",
.silent					= "Nincs",
.rx_beep				= "RX beep", // MaxLen 16 (with ':' + .carrier/.talker/.both/.none)
.beep					= "Bip",
.voice_prompt_level_1			= "Hang",
.transmitTalkerAliasTS1			= "TA továbbít 1",
.squelch_VHF				= "Zajzár VHF",
.squelch_220				= "Zajzár 220",
.squelch_UHF				= "Zajzár UHF",
.display_background_colour 		= "Pixelek" ,
.openGD77 				= "OpenGD77",
.openGD77S 				= "OpenGD77S",
.openDM1801 				= "OpenDM1801",
.openRD5R 				= "OpenRD5R",
.gitCommit				= "Git commit",
.voice_prompt_level_2			= "Hang 2",
.voice_prompt_level_3			= "Hang 3",
.dmr_filter				= "DMR szûrõ",
.talker					= "Talker",
.dmr_ts_filter				= "TS szûrõ",
.dtmf_contact_list			= "DTMF kapcsolatok",
.channel_power				= "Csat.telj",
.from_master				= "Master",
.set_quickkey				= "Gyorsgomb beáll.",
.dual_watch				= "Dual Watch",
.info					= "Inform.",
.pwr					= "Telj.",
.user_power				= "+W- telj.",
.temperature				= "Hõmérséklet",
.celcius				= "°C",
.seconds				= "mp-ek",
.radio_info				= "Rádió infó",
.temperature_calibration		= "Hõm.kal.",
.pin_code				= "PinKód",
.please_confirm				= "Megerõsítés",
.vfo_freq_bind_mode			= "Frekv.másolás",
.overwrite_qm				= "Felülírja?",
.eco_level				= "Takarékosság",
.buttons				= "Gombok",
.leds					= "LED",
.scan_dwell_time			= "Ker.vár.idõ",
.battery_calibration			= "Akku kal.",
.low					= "Alacsony",
.high					= "Magas",
.dmr_id					= "ID DMR",
.scan_on_boot				= "Ker.ind.kor",
.dtmf_entry				= "DTMF küldés",
.name					= "Név",
.carrier				= "Carrier",
.openDM1801A 				= "OpenDM1801A",
.time					= "Id£, mód",
.uptime					= "Üzemidõ",
.hours					= "Órák",
.minutes				= "Percek",
.satellite				= "Mûhold",
.alarm_time				= "Riasztás idõ",
.location				= "Elhelyezkedés",
.date					= "Dátum",
.timeZone				= "Idõzóna",
.suspend				= "Felfüggeszt",
.pass					= "Pass",
.elevation				= "El",
.azimuth				= "Az",
.inHHMMSS				= "in",
.predicting				= "Elõrejelzés",
.maximum				= "Max",
.satellite_short			= "Köv. SAT",
.local					= "Helyi",
.UTC					= "UTC",
.symbols				= "ÉDKN", 		// symbols: N,S,E,W
.not_set				= "NINCS BEÁLLÍTVA",
.general_options			= "Általános",
.radio_options				= "Rádió beáll.",
.openMD9600				= "OpenMD9600",
.dmr_rx_agc				= "DMR Rx AGC",
.speaker_click_suppress			= "Katt.elnyom",
.gps					= "GPS",
.end_only				= "Végén",
.dmr_crc				= "DMR crc",
.eco					= "Takarékos",
.safe_power_on				= "Bizt.BEkapcs.", // MaxLen: 16 (with ':' + .on or .off)
.auto_power_off				= "AUto LEkapcs", // MaxLen: 16 (with ':' + 30/60/90/120/180 or .no)
.apo_with_rf				= "AULE RF-el", // MaxLen: 16 (with ':' + .yes or .no or .n_a)
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
#endif /* USER_INTERFACE_LANGUAGES_HUNGARIAN_H_ */
