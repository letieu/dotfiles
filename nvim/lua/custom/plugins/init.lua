local overrides = require "custom.plugins.overrides"

return {
  ["ThePrimeagen/harpoon"] = {
    config = function()
      require "custom.plugins.harpoon"
    end,
  },

  ['tamton-aquib/duck.nvim'] = {},

  ['kevinhwang91/promise-async'] = {},

  ['kevinhwang91/nvim-ufo'] = {
    after = "promise-async",
    config = function ()
      require("custom.plugins.nvim-ufo")
    end
  },

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


  ['simrat39/symbols-outline.nvim'] = {
    config = function()
      require "custom.plugins.symbols-outline"
    end,
  },

  ['zbirenbaum/copilot.lua'] = {
    config = function ()
      require "custom.plugins.copilot"
    end
  },

  ['sindrets/diffview.nvim'] = {
    config = function ()
      require "custom.plugins.diffview"
    end
  },

  ['kylechui/nvim-surround'] = {
    config = function()
        require("nvim-surround").setup()
    end
  },

  ['ThePrimeagen/refactoring.nvim'] = {
    config = function ()
      require "custom.plugins.refactoring"
    end
  },

  ['narutoxy/silicon.lua'] = {
    config = function ()
      require "custom.plugins.silicon"
    end
  },

  ['iamcco/markdown-preview.nvim'] = {
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
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

   -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
}
