local overrides = require "custom.plugins.overrides"

return {
  ["ThePrimeagen/harpoon"] = {
    config = function()
      require "custom.plugins.harpoon"
    end,
  },

  ['tamton-aquib/duck.nvim'] = {},

  ['gorbit99/codewindow.nvim'] = {
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },

  ['ahmedkhalf/project.nvim'] = {
    config = function ()
      require("project_nvim").setup {}
    end
  },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

   -- overrde plugin configs
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["NvChad/ui"] = {
    override_options = overrides.ui,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- remove plugins
  ["NvChad/nvterm"] = false;

   -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
}
