-- n, v, i, t = mode names

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.disabled = {}

M.general = {}

M.harpoon = {
  n = {
    ["<leader>h"] = { "<cmd> lua require('harpoon.ui').toggle_quick_menu() <CR>", "harpoon menu" },
    ["<leader>a"] = { "<cmd> lua require('harpoon.mark').add_file() <CR>", "add to hardpoon" },
    ["<leader>1"] = { "<cmd> lua require('harpoon.ui').nav_file(1) <CR>", "harpoon 1" },
    ["<leader>2"] = { "<cmd> lua require('harpoon.ui').nav_file(2) <CR>", "harpoon 2" },
    ["<leader>3"] = { "<cmd> lua require('harpoon.ui').nav_file(3) <CR>", "harpoon 3" },
    ["<leader>4"] = { "<cmd> lua require('harpoon.ui').nav_file(4) <CR>", "harpoon 4" },
    ["<leader>."] = { "<cmd> lua require('harpoon.ui').nav_next(4) <CR>", "harpoon 4" },
    ["<leader>,"] = { "<cmd> lua require('harpoon.ui').nav_prev(4) <CR>", "harpoon 4" },
  }
}

M.duck = {
  n = {
    ["<leader>dd"] = { "<cmd> lua require('duck').hatch() <CR>", "duck" },
    ["<leader>dk"] = { "<cmd> lua require('duck').cook() <CR>", "duck" },
  }
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current_context",
    },
  },
}

return M
