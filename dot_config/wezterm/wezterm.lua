local wezterm = require 'wezterm'
local keys = require 'key'
local hyperlink_rules = require 'hyperlink_rules'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font_size = 14.0
config.line_height = 1.3

config.window_decorations = 'RESIZE'
config.initial_rows = 40
config.initial_cols = 180
config.hide_tab_bar_if_only_one_tab = true

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.9
}

config.use_fancy_tab_bar=false
config.keys = keys
config.hyperlink_rules = hyperlink_rules

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

return config
