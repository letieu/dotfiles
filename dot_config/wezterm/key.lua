local wezterm = require("wezterm")

local function is_vim(pane)
	local process_info = pane:get_foreground_process_info()
	local process_name = process_info and process_info.name

	return process_name == "nvim" or process_name == "vim"
end

local function find_vim_pane(tab)
	for _, pane in ipairs(tab:panes()) do
		if is_vim(pane) then
			return pane
		end
	end
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

return {

	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),

	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),

	-- split panes
	{
		key = "-",
		mods = "META",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "META",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Rename tab
	{
		key = "r",
		mods = "CMD",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- Toggle zoom for neovim
	{
		key = ";",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local tab = window:active_tab()

			-- Open pane below if current pane is vim
			if is_vim(pane) then
				if (#tab:panes()) == 1 then
					-- Open pane below if when there is only one pane and it is vim
					pane:split({ direction = "Bottom" })
				else
					-- Send `CTRL-; to vim`, navigate to bottom pane from vim
					window:perform_action({
						SendKey = { key = ";", mods = "CTRL" },
					}, pane)
				end
				return
			end

			-- Zoom to vim pane if it exists
			local vim_pane = find_vim_pane(tab)
			if vim_pane then
				vim_pane:activate()
				tab:set_zoomed(true)
			end
		end),
	},

	-- Workspaces manager
	{
		key = "W",
		mods = "CMD|SHIFT",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
}
