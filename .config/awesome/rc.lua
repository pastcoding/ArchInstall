pcall(require, "luarocks.loader")

local awful = require "awful"
local gears = require "gears"
local beautiful = require "beautiful"


require "main.error_handling"

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/theme.lua")

-- init config

require "main.layout"
require "main.rules"
require "main.bindings"
--require "main.tags"
require "main.menu"

require "awful.autofocus"
require "awful.hotkeys_popup.keys"

-- init widget
require "misc"

-- Autorun at startup
--awful.spawn.with_shell("bash ~/.config/awesome/main/autorun.sh")
awful.spawn.with_shell("~/.config/awesome/main/autorun.sh")
