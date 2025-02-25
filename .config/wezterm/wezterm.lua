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
config.window_close_confirmation = "NeverPrompt"

-- Background Image Configuration
local dimmer = { brightness = 0.2 }

config.window_background_opacity = 0.7  -- Set overall window transparency
config.macos_window_background_blur = 8 -- Blur the background on MacOS
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/dotfiles/.config/wezterm/images/ibm_watsonx_bg.jpg",
		},
		hsb = dimmer,
		opacity = 0.9,
		attachment = "Fixed", -- Make the background image fixed
		horizontal_align = "Right",
	},
}

-- Plugins
-- Presentation: Rather simple presentation mode toggle for WezTerm.
-- Usage: Activate with CTRL + ALT + P for presentation mode, or CTRL + ALT + SHIFT + P for fullscreen presentation.
wezterm.plugin.require("https://gitlab.com/xarvex/presentation.wez").apply_to_config(config)

-- Modal: Vim-like modal keybindings for your terminal! ✌️
-- wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm").apply_to_config(config)

-- Bar: A wezterm tab bar with batteries included
-- Bar's default config
local bar_config = {
	position = "bottom",
	max_width = 32,
	padding = {
		left = 1,
		right = 1,
	},
	separator = {
		space = 1,
		left_icon = wezterm.nerdfonts.fa_long_arrow_right,
		right_icon = wezterm.nerdfonts.fa_long_arrow_left,
		field_icon = wezterm.nerdfonts.indent_line,
	},
	modules = {
		tabs = {
			active_tab_fg = 4,
			inactive_tab_fg = 6,
		},
		workspace = {
			enabled = true,
			icon = wezterm.nerdfonts.cod_window,
			color = 8,
		},
		leader = {
			enabled = true,
			icon = wezterm.nerdfonts.oct_rocket,
			color = 2,
		},
		pane = {
			enabled = true,
			icon = wezterm.nerdfonts.cod_multiple_windows,
			color = 7,
		},
		username = {
			enabled = true,
			icon = wezterm.nerdfonts.fa_user,
			color = 6,
		},
		hostname = {
			enabled = false,
			icon = wezterm.nerdfonts.cod_server,
			color = 8,
		},
		clock = {
			enabled = true,
			icon = wezterm.nerdfonts.md_calendar_clock,
			color = 5,
		},
		cwd = {
			enabled = true,
			icon = wezterm.nerdfonts.oct_file_directory,
			color = 7,
		},
		spotify = {
			enabled = false,
			icon = wezterm.nerdfonts.fa_spotify,
			color = 3,
			max_width = 64,
			throttle = 15,
		},
	},
}
wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm").apply_to_config(config, bar_config)

-- Key Bindings for vim-like navigation
-- config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 } -- Set leader key to Ctrl
-- config.keys = {
-- 	{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
-- 	{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
-- 	{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
-- 	{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
-- }

-- Return the config object
return config
