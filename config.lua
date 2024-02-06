_CONFIG = 
{
	locale = "en", -- /shared/locale
	locations = 
	{
		vector4(331.3210, -1638.5854, 97.4959, 253.3075),
		vector4(341.7399, -1630.4156, 97.4961, 164.0849),
	},
	marker = 
    {
        enabled = true,
        scale = vector3(2.0, 2.0, 1.0),
        type = 1, -- https://docs.fivem.net/docs/game-references/markers/
        color = vector4(0,255,125,125),
        rotation = vector3(0, 0, 0),
        bobUpAndDown = false,
        faceCamera = false,
        rotate = false
    },
    ped = 
    {
        enabled = true,
        model = "s_m_y_dockwork_01", -- https://wiki.rage.mp/index.php?title=Peds
        scenario = "WORLD_HUMAN_CLIPBOARD", -- https://wiki.rage.mp/index.php?title=Scenarios
    },
    blip =
    {
        enabled = true,
        label = "Lifeinvader",
        sprite = 59, -- https://wiki.rage.mp/index.php?title=Blips
        color = 3, -- https://wiki.rage.mp/index.php?title=Blips
        asShortRange = true, -- true = only shows blip when player is close to it
        scale = 0.9
    },
	Advertisement = -- Configuration for advertisement text
	{
		badWordFilter = true, -- See badWords.json - A list of English and German bad words 
							  -- Credits: https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words
							  -- Feel free to add/remove bad words to your liking. Our filter detects leet speech and character replacements.

		minLength = 10, -- Advertisements must be 10 characters long at minimum
		maxLength = 300, -- Advertisements cannot exceed 300 characters
		displayTimeSeconds = 15, -- Display advertisement for 15 seconds.
		price = 
		{
			perCharacter = true, -- Set price per character. The longer the advertisement, the more it is going to cost!
			amount = 25, -- If perCharacter is set to false, this will be the fixed price for an advertisement.
						 -- Otherwise this is the price per character of the ad message.
		},

		latestLimit = 25, -- Display up to latest 25 advertisements
		cooldownMinutes = 30 -- 30 Minutes cooldown after every advertisement, or until server restart. Whichever is closer.
	},
}

if (not IsDuplicityVersion()) then
    -- Notify event. Can be replaced.
    ---@param message string Message to be displayed for the notify.
    ---@param type string Notify type. Either success or errror.
    RegisterNetEvent("5d-lifeinvader:notify", function(message, type)
        ESX.ShowNotification(message)
    end)

    -- Help Notification. Can be repalced.
    ---@param message string Message to be displayed for the help notify. Is called every frame. Can be modified to be displayed only once (see comments).
    local isOpen = false
    RegisterNetEvent("5d-lifeinvader:helpNotify:show", function(message)
        if(not isOpen) then
            isOpen = true
            exports["5d-helpnotify"]:showHelpNotification(message)
        end 
    end)

    RegisterNetEvent("5d-lifeinvader:helpNotify:hide", function()
        if(isOpen) then
            isOpen = false
			exports["5d-helpnotify"]:closeHelpNotification()
        end 
    end)
end

_LOCALE = {} -- dont touch

