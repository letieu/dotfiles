vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 2 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 2
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer", "solidity_ls", "volar"}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities,
        -- other_fields = ...
    })
end
require('ufo').setup()
