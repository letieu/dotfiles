local wezterm = require('wezterm')

local function is_vim(pane)
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

local function toogle_term()
  return {
    key = ";",
    mods = "CTRL",
    action = wezterm.action_callback(function(window, pane)
      local tab = pane:tab()
      local panes_with_info = tab:panes_with_info()

      local have_only_one = #tab:panes() == 1
      if have_only_one then
        pane:split({ direction = "Bottom" })
        return
      end

      local pane_is_zoomed = false
      for _, pane_info in ipairs(panes_with_info) do
        if pane_info.is_active then
          pane_is_zoomed = pane_info.is_zoomed
          break
        end
      end

      if pane_is_zoomed then
        tab:set_zoomed(false)
        window:perform_action({ ActivatePaneDirection = 'Down' }, pane)
      else
        window:perform_action({ ActivatePaneDirection = 'Up' }, pane)
        tab:set_zoomed(true)
      end
    end),
  }
end

local function tab(num)
  return {
    key = tostring(num),
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(num - 1)
  }
end

local keys = {
  -- move between split panes
  split_nav('move', 'h'),
  split_nav('move', 'j'),
  split_nav('move', 'k'),
  split_nav('move', 'l'),

  -- resize panes
  split_nav('resize', 'h'),
  split_nav('resize', 'j'),
  split_nav('resize', 'k'),
  split_nav('resize', 'l'),

  -- Toggle zoom for neovim
  toogle_term(),

  {
    key = "\\",
    mods = "CTRL",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.SpawnCommandInNewTab({ cwd = wezterm.home_dir })
  },
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentTab({ confirm = true })
  },
  {
    key = 'H',
    mods = 'CTRL',
    action = wezterm.action.ActivateCopyMode,
  },
}

for i = 1, 5, 1 do
  table.insert(keys, tab(i))
end

return keys
