local M = {}

M.ui = {
  theme = "catppuccin",
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"
M.options = require "custom.options"
M.autocmd = require "custom.autocmd"

return M
