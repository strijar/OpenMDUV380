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
#include "user_interface/menuSystem.h"
#include "user_interface/uiLocalisation.h"
#include "user_interface/uiUtilities.h"
#include "user_interface/colors.h"
#include "functions/settings.h"
#include "functions/ticks.h"

menuDataGlobal_t menuDataGlobal =
{
		.currentItemIndex 		= 0, // each menu can re-use this var to hold the position in their display list. To save wasted memory if they each had their own variable
		.startIndex 			= 0, // as above
		.numItems 				= 0, // as above
		.lightTimer 			= -1,
		.currentMenuList		= NULL,

		.controlData =
		{
				.stackPosition 	= 0,
				.stack 			=
				{
						MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY, MENU_EMPTY
				}
		},

		/*
		 * ---------------------- IMPORTANT ----------------------------
		 *
		 * The menuFunctions array and the menusData array.....
		 *
		 * MUST match the enum MENU_SCREENS in menuSystem.h
		 *
		 * ---------------------- IMPORTANT ----------------------------
		 */
		.data 					=
		{
				NULL,
				NULL,
				NULL,// zone
				NULL,// RadioInfos
				NULL,// RSSI
				NULL,// LastHeard
				NULL,// Options
				NULL,// General options
				NULL,// Radio options
				NULL,// Display options
				NULL,// Sound options
				NULL,// SatelliteScreen
				NULL,// GPS
				NULL,// Contact List
				NULL,// DTMF Contact List
				NULL,// Contact Quick List (SK2+#)
				NULL,// Contact List Quick Menu
				NULL,// Contact Details
				NULL,// Language
				NULL,// Quick menu - Channel
				NULL,// Quick menu - VFO
				NULL,// Calibration
				NULL,// Channel Details
				// *** Add new menus to be accessed using quickkey (ID: 0..31) above this line ***
				NULL,// MessageBox
				NULL,// hotspot mode
				NULL,// CPS
				NULL,// Numerical entry
				NULL,// Tx
				NULL,// splash
				NULL,// power off
				NULL,// vfo mode
				NULL,// channel mode
				NULL,// Firmwareinfo
				NULL,// Lock screen
				NULL,// Private Call
				NULL,// New Contact

		}
};

int menuSystemGetCurrentMenuNumber(void)
{
}

int menuSystemGetPreviousMenuNumber(void)
{
	return MENU_ANY;
}

int menuSystemGetPreviouslyPushedMenuNumber(void)
{
	return MENU_EMPTY;
}

int menuSystemGetRootMenuNumber(void)
{
}

