local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require("flutter-tools").setup {
  -- debugger = {
  --   enabled = true,
  --   run_via_dap = true,
  -- },
  -- outline = { auto_open = false },
  -- decorations = {
  --   statusline = { device = true, app_version = true },
  -- },
  -- widget_guides = { enabled = true, debug = true },
  -- dev_log = { enabled = false, open_cmd = "tabedit" },
  -- lsp = {
  --   color = {
  --     enabled = true,
  --     background = true,
  --     virtual_text = false,
  --   },
  --   settings = {
  --     showTodos = true,
  --     renameFilesWithClasses = "prompt",
  --   },
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- },
}
