local awful = require "awful"
local gears = require "gears"
local ruled = require "ruled"

local apps = require "main.apps"

ruled.client.connect_signal("request::rules", function()
	ruled.client.append_rule {
		id = "global",
		rule = {},
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap+awful.placement.no_offscreen,
		},
	}

	-- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
		"Variety Images"
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true }
    }

	-- titlebars 
	ruled.client.append_rule {
		id = "titlebars",
		rule_any = { type = {"normal", "dialog"}	},
		properties = { titlebars_enabled = true		}
	}

	-- Apps Rules
	ruled.client.append_rule {
		rule_any = { 
			class = {
				"feh",
			},
			name = { 
				"Variety Images",
			},
		properties = { titlebars_enabled = false	}
		}
	}

	ruled.client.append_rule {
		rule       = { class = "Firefox"     },
        properties = { screen = 0, tag = "1" }
	}

end)
