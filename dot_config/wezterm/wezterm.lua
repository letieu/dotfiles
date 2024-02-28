local wezterm = require 'wezterm'
local keys = require 'key'
local hyperlink_rules = require 'hyperlink_rules'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 14.0
config.line_height = 1.2

config.window_decorations = 'RESIZE'
config.initial_rows = 43
config.initial_cols = 190
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = 'Google (light) (terminal.sexy)'

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.9
}

config.window_frame = {
  font_size = 12.0,
  active_titlebar_bg = '#E8EAED',
  inactive_titlebar_bg = '#f1f3f4'
}

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = '#4285F4',
      fg_color = '#ffffff',
      intensity = 'Normal',
    },

    inactive_tab = {
      bg_color = '#E8EAED',
      fg_color = '#5F6368',
    },

    new_tab = {
      bg_color = '#E8EAED',
      fg_color = '#5F6368',
    },
  },
}

config.keys = keys
config.hyperlink_rules = hyperlink_rules

return config
