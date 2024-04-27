local wezterm = require("wezterm")
local keys = require("key")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 14.0
config.line_height = 1.2

config.window_decorations = "RESIZE"
config.initial_rows = 45
config.initial_cols = 200

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 22

config.keys = keys
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.colors = require("color")
config.window_background_opacity = 0.92
config.macos_window_background_blur = 30

local function tab_title(tab_info)
	local title = tab_info.tab_title

	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title
end

wezterm.on("update-right-status", function(window, _)
	window:set_right_status(window:active_workspace() .. " ")
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, cf, hover, max_width)
	local title = tab_title(tab)

	title = wezterm.truncate_left(title, max_width)
	local i = tab.tab_index + 1

	title = string.format(" %d %s ", i, title)

	local background = "rgb(22, 24, 26 / 30%)"
	local foreground = "white"

	if tab.is_active then
		background = "#16181a"
		foreground = "white"
	end

	return {
		{ Background = { Color = "black" } },
		{ Foreground = { Color = "black" } },
		{ Text = "" },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = "black" } },
		{ Foreground = { Color = "black" } },
		{ Text = "" },
}
end)

return config
