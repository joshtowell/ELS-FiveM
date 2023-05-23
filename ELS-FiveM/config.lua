outputLoading = false
playButtonPressSounds = true
printDebugInformation = false

vehicleSyncDistance = 150
environmentLightBrightness = 0.006
lightDelay = 10 -- Time in MS
flashDelay = 15
sirenParkKillEnabled = true

panelEnabled = true
panelType = "original"
panelOffsetX = 0.0
panelOffsetY = 0.0

allowedPanelTypes = {
    "original",
    "old"
}

-- https://docs.fivem.net/game-references/controls

shared = {
    horn = 86,			-- E
}

keyboard = {
    modifyKey = 131,	-- LEFT SHIFT
    stageChange = 85,	-- Q
    guiKey = 199,		-- P
    takedown = 83,		-- =
    siren = {
        tone_one = 157,	-- 1
        tone_two = 158,	-- 2
        tone_three = 160, -- 3
    },
    pattern = {
        primary = 161,	-- 7
        secondary = 162, -- 8
        advisor = 163,	-- 9
    },
	warning = 108,		-- NUMPAD 4
	secondary = 110,	-- NUMPAD 5
	primary = 109,		-- NUMPAD 6
}

controller = {
    modifyKey = 73,
    stageChange = 80,
    takedown = 74,
    siren = {
        tone_one = 173,
        tone_two = 85,
        tone_three = 172,
    },
}