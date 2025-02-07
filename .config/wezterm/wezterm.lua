local wezterm = require("wezterm")

-- Create the config object
local config = {}

-- Font Configuration
config.font_size = 16.0
-- config.font = wezterm.font("firacode nerd font")
-- config.font = wezterm.font_with_fallback({
-- 	"firacode nerd font",
-- 	"symbols nerd font",
-- 	"jetbrainsmono nerd font",
-- })

-- Appearance Configuration
config.color_scheme = "Dracula"
config.hide_tab_bar_if_only_one_tab = true

-- Window Configuration
config.initial_rows = 40
config.initial_cols = 140

-- Background Image Configuration
-- The art is a bit too bright and colorful to be useful as a backdrop
-- for text, so we're going to dim it down to 10% of its normal brightness
local dimmer = { brightness = 0.2 }

-- config.window_background_opacity = 0.3 -- Set overall window transparency
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/dotfiles/.config/wezterm/images/ibm_watsonx_bg.jpg",
		},
		hsb = dimmer,
		-- opacity = 0.9,
	},
}

-- Return the config object
return config
