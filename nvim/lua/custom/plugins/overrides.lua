local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "tsserver",
    "c",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.ui = {
  tabufline = {
    enabled = false,
  },
  statusline = {
      -- separator_style = "arrow", -- default/round/block/arrow
      overriden_modules = nil,

      separator_style = {
        left = "",
        right = "",
      },
   },
}

return M
