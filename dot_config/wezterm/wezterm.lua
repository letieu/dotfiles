local wezterm = require 'wezterm'
local theme = wezterm.plugin.require('https://github.com/neapsix/wezterm').main

local config = wezterm.config_builder()

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 12.0
config.line_height = 1.2

config.window_decorations = "NONE"
config.initial_rows = 40
config.initial_cols = 150

config.hide_tab_bar_if_only_one_tab = true
config.show_close_tab_button_in_tabs = false
config.show_new_tab_button_in_tab_bar = false

-- Rounded tab corners
config.use_fancy_tab_bar = true
config.tab_max_width = 25

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- config.disable_default_key_bindings = true
config.keys = require("keys")

config.colors = theme.colors()
config.window_frame = theme.window_frame()
config.window_frame.font_size = 8

return config
