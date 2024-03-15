local wezterm = require 'wezterm';
local server_id_file = "/tmp/nvim-focuslost"

local function extract_filename(uri)
  local start, match_end = uri:find("$EDITOR:");
  if start == 1 then
    -- skip past the colon
    return uri:sub(match_end + 1)
  end

  -- `file://hostname/path/to/file`
  local start, match_end = uri:find("file:");
  if start == 1 then
    -- skip "file://", -> `hostname/path/to/file`
    local host_and_path = uri:sub(match_end + 3)
    local start, match_end = host_and_path:find("/")
    if start then
      -- -> `/path/to/file`
      return host_and_path:sub(match_end)
    end
  end

  return nil
end

local function get_nvim_server_id()
  local server_id = io.open(server_id_file):read("*a")
  server_id = server_id:sub(1, -2)

  return server_id
end

local function get_pwd(pane)
  local pwd = pane:get_current_working_dir()
  pwd = pwd:gsub("^file://[^/]+", "")
  return pwd
end

local function extract_line_and_name(uri)
  local name = extract_filename(uri)

  if name then
    local line = 1
    -- check if name has a line number (e.g. `file:.../file.txt:123 or file:.../file.txt:123:456`)
    local start, match_end = name:find(":[0-9]+")
    if start then
      -- line number is 123
      line = name:sub(start + 1, match_end)
      -- remove the line number from the filename
      name = name:sub(1, start - 1)
    end

    return line, name
  end

  return nil, nil
end

local function open_in_nvim(full_path, line)
  local server_id = get_nvim_server_id()

  local nvim_command = string.format("<C-\\><C-N>:e %s<CR>:normal %dG<CR>", full_path, line)
  wezterm.run_child_process({ "/Users/soinmedia/nvim-macos/bin/nvim", "--server", server_id, "--remote-send",
    nvim_command })
end

-- Listen for the "open-uri" escape sequence and open the URI in
wezterm.on("open-uri", function(window, pane, uri)
  local line, name = extract_line_and_name(uri)

  if name then
    local full_path = ''
    if name:find("^/") then
      full_path = name
    else
      local pwd = get_pwd(pane)
      full_path = pwd .. "/" .. name
    end

    open_in_nvim(full_path, line)

    -- focus the pane above // TODO: Only for nvim on the top pane, need another way to focus the nvim pane
    window:perform_action({ ActivatePaneDirection = "Up" }, pane)

    -- prevent the default action from opening in a browser
    return false
  end

  -- if email
  if uri:find("mailto:") == 1 then
    return false -- disable opening email
  end
end)

return {
  -- These are the default rules, but you currently need to repeat
  -- them here when you define your own rules, as your rules override
  -- the defaults

  -- URL with a protocol
  {
    regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
    format = "$0",
  },

  {
    regex = "\\b\\w+://localhost\\S*\\b",
    format = "$0",
  },

  -- implicit mailto link
  {
    regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
    format = "mailto:$0",
  },

  -- new in nightly builds; automatically highly file:// URIs.
  {
    regex = "\\bfile://\\S*\\b",
    format = "$0"
  },

  -- Now add a new item at the bottom to match things that are
  -- probably filenames
  {
    regex = "[/.A-Za-z0-9_-]+\\.[A-Za-z0-9]+(:\\d+)*(?=\\s*|$)",
    format = "$EDITOR:$0"
  },
}
