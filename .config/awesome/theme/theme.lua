
local xresources = require "beautiful.xresources"
local rnotification = require "ruled.notification"
local dpi = xresources.apply_dpi
local gears = require "gears"
local gfs = require "gears.filesystem" 

-- Var
local themes_path = gfs.get_configuration_dir() .. "theme/"
local home = os.getenv 'HOME'

local theme = {}

----- Font -----

theme.font = "FiraCode Nerd Font 14"

-- Colors

theme.black = "#282c34"
theme.blue = "#61afef"
theme.yellow = "#d19a66"
theme.green = "#98c379"
theme.red = "#e06c75"
theme.magenta = "#c678dd"
theme.white = "#abb2bf"
theme.cyan = "#56b6c2"
--theme.transparent = "#00000000"

theme.fg = theme.white

theme.bg = theme.black
theme.bg_alt = theme.black

----- General/default Settings -----

theme.bg_normal     = theme.black
theme.bg_focus      = theme.green
theme.bg_urgent     = theme.red
theme.bg_minimize   = theme.yellow
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.white
theme.fg_focus      = theme.black
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = theme.fg_normal

theme.useless_gap         = dpi(15)
theme.border_width        = dpi(2)
theme.border_color_active 	  = theme.green
--theme.border_color_marked 	  = theme.blue
theme.border_color_normal 	  = theme.black

-- Menu

theme.menu_height = dpi(20)
theme.menu_width  = dpi(200)
theme.menu_fg_focus = theme.black
theme.menu_fg_normal = theme.white
theme.menu_bg_focus = theme.white
theme.menu_bg_normal = theme.black
theme.submenu = ">"

-- titlebar's buttons
theme.titlebar_close_button_normal = gears.color.recolor_image(themes_path .. "assets/titlebar/close_1.png", theme.white)
theme.titlebar_close_button_focus  = gears.color.recolor_image(themes_path .. "assets/titlebar/close_2.png", theme.red)

theme.titlebar_minimize_button_normal = gears.color.recolor_image(themes_path .. "assets/titlebar/minimize_1.png", theme.white)
theme.titlebar_minimize_button_focus  = gears.color.recolor_image(themes_path .. "assets/titlebar/minimize_2.png", theme.green)

theme.titlebar_maximized_button_normal_inactive = gears.color.recolor_image(themes_path .. "assets/titlebar/close_1.png", theme.white)
theme.titlebar_maximized_button_focus_inactive  = gears.color.recolor_image(themes_path .. "assets/titlebar/close_1.png", theme.yellow)
theme.titlebar_maximized_button_normal_active = gears.color.recolor_image(themes_path .. "assets/titlebar/close_1.png", theme.white)
theme.titlebar_maximized_button_focus_active  = gears.color.recolor_image(themes_path .. "assets/titlebar/close_1.png", theme.yellow)

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."layouts/fairhw.png"
theme.layout_fairv = themes_path.."layouts/fairvw.png"
theme.layout_floating  = themes_path.."layouts/floatingw.png"
theme.layout_magnifier = themes_path.."layouts/magnifierw.png"
theme.layout_max = themes_path.."layouts/maxw.png"
theme.layout_fullscreen = themes_path.."layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."layouts/tileleftw.png"
theme.layout_tile = themes_path.."layouts/tilew.png"
theme.layout_tiletop = themes_path.."layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

theme.icon_theme = nil

rnotification.connect_signal('request::rules', function()
   rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme 
