local awful = require "awful"
local wibox = require "wibox"
local gears = require "gears"

local apps = require "main.apps"
--local screenshot = require "lib.screenshot"

--screenshotMenu = {
--	{ "Screenshot Now", function() screenshot.now() end},
--	{ "Screenshot Later", function() screenshot.later() end}
--}

awesomemenu = {
	{ "Manual", apps.terminal .. " -e man awesome" },
	{ "Config", apps.terminal .. " -e nvim .config/awesome/." },
	{ "Restart", awesome.restart },
	{ "Quit", function() awesome.quit() end },	
}

powermenu = {
	{ "Hibernate", "systemctl suspend" },
	{ "Reboot", "reboot" },
	{ "Poweroff", "poweroff" },
}

mainmenu = awful.menu {
	items = {
		{ "Awesome", awesomemenu },
		{ "------------" }, 
		{ "Terminal", apps.terminal },
		{ "Browser", apps.browser },
		{ "File Manager", apps.fileManager },
		{ "------------" },
		{ "Power Menu", powermenu},
	}
}
