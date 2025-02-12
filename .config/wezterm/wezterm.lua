local wezterm = require("wezterm")

-- Create the config object
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- Font Configuration
config.font_size = 16.0
-- config.font = wezterm.font_with_fallback({
-- 	"FiraCode Nerd Font",
-- 	"Symbols Nerd Font",
-- 	"JetBrainsMono Nerd Font",
-- })
--
-- Appearance Configuration
config.color_scheme = "Catppuccin Mocha"
config.hide_tab_bar_if_only_one_tab = true

-- Window Configuration
config.initial_rows = 45
config.initial_cols = 130
config.window_padding = {
	left = 18,
	right = 18,
	top = 10,
	bottom = 10,
}

-- Background Image Configuration
local dimmer = { brightness = 0.2 }

config.window_background_opacity = 0.7 -- Set overall window transparency
config.macos_window_background_blur = 8 -- Blur the background on MacOS
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/dotfiles/.config/wezterm/images/ibm_watsonx_bg.jpg",
		},
		hsb = dimmer,
		opacity = 0.5,
		attachment = "Fixed", -- Make the background image fixed
		horizontal_align = "Right",
	},
}

-- Plugins
-- Rather simple presentation mode toggle for WezTerm.
-- Usage: Activate with CTRL + ALT + P for presentation mode, or CTRL + ALT + SHIFT + P for fullscreen presentation.
wezterm.plugin.require("https://gitlab.com/xarvex/presentation.wez").apply_to_config(config)

-- statusbar.apply_to_config(config, {
-- 	cells = {
-- 		weather = {
-- 			enabled = true,
-- 			format = "Weather: %s",
-- 			update_interval = 600, -- Update every 10 minutes
-- 			command = 'curl -s "wttr.in/Taipei?format=3"',
-- 		},
-- 	},
-- })
--
-- Return the config object
return config
