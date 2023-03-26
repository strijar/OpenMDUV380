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
 * Translators: EA3IGM, EA5SW, EB3AM, EA3BIL
 *
 *
 * Rev: 11.  11Mar2022 EA3BIL
 */
#ifndef USER_INTERFACE_LANGUAGES_CATALAN_H_
#define USER_INTERFACE_LANGUAGES_CATALAN_H_
/********************************************************************
 *
 * VERY IMPORTANT.
 * This file should not be saved with UTF-8 encoding
 * Use Notepad++ on Windows with ANSI encoding
 * or emacs on Linux with windows-1252-unix encoding
 *
 ********************************************************************/
const stringsTable_t catalanLanguage=
{
.LANGUAGE_NAME			= "Català",
.menu					= "Menú",
.credits				= "Crèdits",
.zone					= "Zona",
.rssi					= "Senyal",
.battery				= "Batería",
.contacts				= "Contactes",
.last_heard				= "Escoltats",
.firmware_info			= "Info firmware",
.options				= "Opcions",
.display_options		= "Opcions Pantalla",
.sound_options			= "Opcions Só", // MaxLen: 16
.channel_details		= "Detalls Canal",
.language				= "Idioma",
.new_contact			= "Nou contacte",
.dmr_contacts			= "DMR contactes", // MaxLen: 16
.contact_details		= "Detall Ctte",
.hotspot_mode			= "Hotspot",
.built					= "Compilat",
.zones					= "Zones",
.keypad					= "Teclat",
.ptt					= "PTT",
.locked					= "Blocat",
.press_blue_plus_star	= "Prem Blau + (*)",
.to_unlock				= "per desblocar",
.unlocked				= "Desblocat",
.power_off				= "Apagant...",
.error					= "ERROR",
.rx_only				= "Només RX",
.out_of_band			= "FORA DE BANDA",
.timeout				= "TIMEOUT",
.tg_entry				= "Entreu TG",
.pc_entry				= "Entreu ID",
.user_dmr_id			= "ID DMR d'Usuari",
.contact				= "Contacte",
.accept_call			= "Acceptar trucada?",
.private_call			= "Trucada privada",
.squelch				= "Squelch",
.quick_menu				= "Menú Ràpid",
.filter					= "Filtre",
.all_channels			= "Llista total",
.gotoChannel			= "Anar al canal",
.scan					= "Scan",
.channelToVfo			= "Canal -> VFO",
.vfoToChannel			= "VFO -> Canal",
.vfoToNewChannel		= "VFO -> Nou Canal", // MaxLen: 16
.group					= "Grup",
.private				= "Privada",
.all					= "Tots",
.type					= "Tipus",
.timeSlot				= "TS",
.none					= "Cap",
.contact_saved			= "Contacte Desat",
.duplicate				= "Duplicat",
.tg						= "TG",
.pc						= "ID",
.ts						= "TS",
.mode					= "Mode",
.colour_code			= "Codi Color",
.n_a					= "N/D",
.bandwidth				= "Ample banda",
.stepFreq				= "Salt",
.tot					= "TOT",
.off					= "NO",
.zone_skip				= "Saltar zona",
.all_skip				= "Saltar tot",
.yes					= "Sí",
.no						= "No",
.rx_group				= "RX Grup",
.on						= "Sí",
.timeout_beep			= "Avís T.O.T.",
.list_full				= "Llista plena",
.dmr_cc_scan			= "CC Scan", // MaxLen: 12 (with ':' + settings: .on or .off)
.band_limits			= "Límit bandes",
.beep_volume			= "Volum tons",
.dmr_mic_gain			= "DMR mic",
.fm_mic_gain			= "FM mic", // MaxLen: 16 (with ':' + 0..31)
.key_long				= "Prem llarg",
.key_repeat				= "Prem rpt",
.dmr_filter_timeout		= "Filtre temps",
.brightness				= "Brillantor",
.brightness_off			= "Brillan. min",
.contrast				= "Contrast",
.colour_invert			= "Invers",
.colour_normal			= "Normal",
.backlight_timeout		= "Temps llum",
.scan_delay				= "Temps Scan",
.yes___in_uppercase		= "SÍ",
.no___in_uppercase		= "NO",
.DISMISS				= "PASSAR",
.scan_mode				= "Mode Scan",
.hold					= "Parar",
.pause					= "Pausa",
.empty_list				= "Llista buida",
.delete_contact_qm		= "Esborrar ctte?",
.contact_deleted		= "Ctte esborrat",
.contact_used			= "Ctte en ús a",
.in_rx_group			= "la Llista TG/ID",
.select_tx				= "Selec. TX",
.edit_contact			= "Editar Ctte",
.delete_contact			= "Esborrar Ctte",
.group_call				= "Cridar a Grup",
.all_call				= "Cridar a Tots",
.tone_scan				= "Scan CCTCS",//// MaxLen: 16
.low_battery			= "BATERIA BAIXA !!",//// MaxLen: 16
.Auto					= "Auto", // MaxLen 16 (with .mode + ':') 
.manual					= "Manual",  // MaxLen 16 (with .mode + ':') 
.ptt_toggle				= "Enclavar PTT", // MaxLen 16 (with ':' + .on or .off)
.private_call_handling	= "Gestió PC", // MaxLen 16 (with ':' + .on ot .off)
.stop					= "Stop", // Maxlen 16 (with ':' + .scan_mode)
.one_line				= "1 línia", // MaxLen 16 (with ':' + .contact)
.two_lines				= "2 línies", // MaxLen 16 (with ':' + .contact)
.new_channel			= "Nou canal", // MaxLen: 16, leave room for a space and four channel digits after
.priority_order			= "Prio.", // MaxLen 16 (with ':' + 'Cc/DB/TA')
.dmr_beep				= "To DMR", // MaxLen 16 (with ':' + .star/.stop/.both/.none)
.start					= "Inici", // MaxLen 16 (with ':' + .dmr_beep)
.both					= "Tots", // MaxLen 16 (with ':' + .dmr_beep)
.vox_threshold			= "Nivell VOX", // MaxLen 16 (with ':' + .off or 1..30)
.vox_tail				= "Cua VOX", // MaxLen 16 (with ':' + .n_a or '0.0s')
.audio_prompt			= "Avís",// Maxlen 16 (with ':' + .silent, .beep or .voice_prompt_level_1)
.silent					= "Silenci", // Maxlen 16 (with : + audio_prompt)
.rx_beep				= "RX beep", // MaxLen 16 (with ':' + .carrier/.talker/.both/.none)
.beep					= "Beep", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_1	= "Veu L1", // Maxlen 16 (with : + audio_prompt)
.transmitTalkerAliasTS1	= "Enviar TA 1", // Maxlen 16 (with : + .off .text APRS .both)
.squelch_VHF			= "Squelch VHF",// Maxlen 16 (with : + XX%)
.squelch_220			= "Squelch 220",// Maxlen 16 (with : + XX%)
.squelch_UHF			= "Squelch UHF", // Maxlen 16 (with : + XX%)
.display_background_colour = "Color" , // Maxlen 16 (with : + .colour_normal or .colour_invert)
.openGD77 				= "OpenGD77",// Do not translate
.openGD77S 				= "OpenGD77S",// Do not translate
.openDM1801 			= "OpenDM1801",// Do not translate
.openRD5R 				= "OpenRD5R",// Do not translate
.gitCommit				= "Git commit",
.voice_prompt_level_2	= "Veu L2", // Maxlen 16 (with : + audio_prompt)
.voice_prompt_level_3	= "Veu L3", // Maxlen 16 (with : + audio_prompt)
.dmr_filter				= "Filtre DMR",// MaxLen: 12 (with ':' + settings: "TG" or "Ct" or "RxG")
.talker					= "Talker",
.dmr_ts_filter			= "Filtre TS", // MaxLen: 12 (with ':' + settings: .on or .off)
.dtmf_contact_list		= "Contactes DTMF", // Maxlen: 16
.channel_power			= "Pot. Ch", //Displayed as "Ch Power:" + .from_master or "Ch Power:"+ power text e.g. "Power:500mW" . Max total length 16
.from_master			= "Master",// Displayed if per-channel power is not enabled  the .channel_power
.set_quickkey			= "Ajust Quickkey", // MaxLen: 16
.dual_watch				= "Dual Watch", // MaxLen: 16
.info					= "Info", // MaxLen: 16 (with ':' + .off or.ts or .pwr or .both)
.pwr					= "Pot.",
.user_power				= "Pot. usuari",
.temperature			= "Temperatura", // MaxLen: 16 (with ':' + .celcius or .fahrenheit)
.celcius				= "°C",
.seconds				= "segons",
.radio_info				= "Ràdio infos",
.temperature_calibration	= "Cal. temp.",
.pin_code				= "Codi pin",
.please_confirm			= "Confirmeu", // MaxLen: 15
.vfo_freq_bind_mode		= "Copiar Freq.",
.overwrite_qm			= "Reemplaçar?", //Maxlen: 14 chars
.eco_level				= "Nivell eco",
.buttons				= "Botons",
.leds					= "LEDs",
.scan_dwell_time		= "Temps Mostra",
.battery_calibration	= "Cal. bat.",
.low					= "Baix",
.high					= "Alt",
.dmr_id					= "ID DMR",
.scan_on_boot			= "Scan inici",
.dtmf_entry				= "Escriu DTMF",
.name					= "Nom",
.carrier				= "Carrier",
.openDM1801A 				= "OpenDM1801A", // Do not translate
.time					= "Hora",
.uptime					= "Arrenca en",
.hours					= "Hores",
.minutes				= "Minuts",
.satellite				= "Satèl.lit",
.alarm_time				= "Hora Avís",
.location				= "Ubicació",
.date					= "Data",
.timeZone				= "Ús Horari",
.suspend				= "Hibernar",
.pass					= "Pas", // For satellite screen
.elevation				= "El",
.azimuth				= "Az",
.inHHMMSS				= "en",
.predicting				= "Predicció",
.maximum				= "Màx",
.satellite_short		= "Sat",
.local					= "Local",
.UTC					= "UTC",
.symbols				= "NSEO", // symbols: N,S,E,W
.not_set				= "NO DEFINIT",
.general_options		= "Opcions Generals",
.radio_options			= "Opcions Ràdio",
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
.transmitTalkerAliasTS2	= "Enviar TA 2", // Maxlen 16 (with : + .ta_text, 'APRS' , .both or .off)
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
#endif /* USER_INTERFACE_LANGUAGES_CATALAN_H_ */
