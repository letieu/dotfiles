local wezterm = require("wezterm")
local keys = require("key")
local hyperlink_rules = require("hyperlink_rules")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 14.0
config.line_height = 1.2

config.window_decorations = "RESIZE"
config.initial_rows = 45
config.initial_cols = 180

config.use_fancy_tab_bar = false

config.keys = keys
config.hyperlink_rules = hyperlink_rules
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 0,
}

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

return config
