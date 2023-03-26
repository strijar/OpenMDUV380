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
#include "functions/ticks.h"
#include "utils.h"


#if defined(PLATFORM_RD5R)
#define YCENTER         ((DISPLAY_SIZE_Y / 2) + 3)
#define INNERBOX_H      (FONT_SIZE_3_HEIGHT + 7)
#define YBAR            (YCENTER - ((FONT_SIZE_3_HEIGHT / 2) + 2))
#define YTEXT           (YBAR + 1)
#else
#define YCENTER         (DISPLAY_SIZE_Y / 2)
#define INNERBOX_H      (FONT_SIZE_3_HEIGHT + 6)
#define YBAR            (YCENTER - (FONT_SIZE_3_HEIGHT / 2))
#define YTEXT           (YBAR - 2)
#endif
#define XBAR            69
#define YBOX            (YCENTER - (INNERBOX_H / 2))

static uint16_t screenNotificationBufData[DISPLAY_SIZE_X * DISPLAY_SIZE_Y] __attribute__((section(".ccmram")));

typedef struct
{
	bool                   visible;
	ticksTimer_t           hideTimer;
	uiNotificationType_t   type;
	uiNotificationID_t     id;
	char                   message[16]; // 15 char + NULL
} uiNotificationData_t;

static uiNotificationData_t notificationData =
{
		.visible = false,
		.hideTimer = { 0, 0 },
		.type = NOTIFICATION_TYPE_MAX,
		.id = NOTIFICATION_ID_NONE,
		.message = { 0 }
};

void uiNotificationShow(uiNotificationType_t type, uiNotificationID_t id, uint32_t msTimeout, const char *message, bool immediateRender)
{
	bool valid = true;

	if (notificationData.visible)
	{
		notificationData.visible = false;
		displayRender();
	}

	memset(notificationData.message, 0, sizeof(notificationData.message));

	notificationData.type = type;
	notificationData.id = id;

	switch (type)
	{
		case NOTIFICATION_TYPE_SQUELCH:
			break;

		case NOTIFICATION_TYPE_POWER:
			break;

		case NOTIFICATION_TYPE_MESSAGE:
			if (message)
			{
				snprintf(&notificationData.message[0], sizeof(notificationData.message), "%s", message);
			}
			break;

		default:
			valid = false;
			break;
	}

	if (valid)
	{
		notificationData.visible = true;
		if (immediateRender)
		{
			uiNotificationRefresh();
		}
		ticksTimerStart(&notificationData.hideTimer, msTimeout);
	}
}

void uiNotificationRefresh(void)
{
	if (notificationData.visible)
	{
		// copy the primary screen content
		memcpy(screenNotificationBufData, displayGetPrimaryScreenBuffer(), sizeof(screenNotificationBufData));

		//displayOverrideScreenBuffer(screenNotificationBufData);

		// Draw whatever
		switch (notificationData.type)
		{
			case NOTIFICATION_TYPE_SQUELCH:
			{
				char buffer[SCREEN_LINE_BUFFER_SIZE];

				strncpy(buffer, currentLanguage->squelch, 9);
				buffer[8] = 0;

				int sLen = (strlen(buffer) * 8);
				displayDrawRoundRectWithDropShadow(1, YBOX, DISPLAY_SIZE_X - 4, INNERBOX_H, 3, true);
				displayPrintAt(2 + ((sLen) < XBAR - 2 ? (((XBAR - 2) - (sLen)) >> 1) : 0), YTEXT, buffer, FONT_SIZE_3);

				int bargraph = 1 + ((currentChannelData->sql - 1) * 5) / 2;
				displayDrawRect((XBAR - 2), YBAR, 55, (SQUELCH_BAR_H + 4), true);
				displayFillRect(XBAR, (YBAR + 2), bargraph, SQUELCH_BAR_H, false);
			}
			break;

			case NOTIFICATION_TYPE_POWER:
			{
				char buffer[SCREEN_LINE_BUFFER_SIZE];
				int powerLevel = trxGetPowerLevel();

				displayDrawRoundRectWithDropShadow((DISPLAY_SIZE_X / 4), YBOX, (DISPLAY_SIZE_X / 2), INNERBOX_H, 3, true);
				sprintf(buffer, "%s%s", POWER_LEVELS[powerLevel], POWER_LEVEL_UNITS[powerLevel]);
				displayPrintCentered(YTEXT, buffer, FONT_SIZE_3);
			}
			break;

			case NOTIFICATION_TYPE_MESSAGE:
				displayDrawRoundRectWithDropShadow(1, YBOX, (DISPLAY_SIZE_X - 64), INNERBOX_H, 3, true);
				displayPrintCentered(YTEXT, notificationData.message, FONT_SIZE_3);
				break;

			default:
				break;
		}

		displayRenderWithoutNotification();
		memcpy(displayGetPrimaryScreenBuffer(), screenNotificationBufData, sizeof(screenNotificationBufData));
		//displayRestorePrimaryScreenBuffer();
	}
}

bool uiNotificationHasTimedOut(void)
{
	return (notificationData.visible && ticksTimerHasExpired(&notificationData.hideTimer));
}

bool uiNotificationIsVisible(void)
{
	return notificationData.visible;
}

void uiNotificationHide(bool immediateRender)
{
	notificationData.visible = false;
	if (immediateRender)
	{
		displayRender();
	}
}

uiNotificationID_t uiNotificationGetId(void)
{
	return notificationData.id;
}
