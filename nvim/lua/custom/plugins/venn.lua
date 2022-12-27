local Hydra = require('hydra')

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})


local hint = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

Hydra({
   name = 'Draw Diagram',
   hint = hint,
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         border = 'rounded'
      },
      on_enter = function()
         vim.o.virtualedit = 'all'
      end,
   },
   mode = 'n',
   body = '<leader>d',
   heads = {
      { 'H', '<C-v>h:VBox<CR>' },
      { 'J', '<C-v>j:VBox<CR>' },
      { 'K', '<C-v>k:VBox<CR>' },
      { 'L', '<C-v>l:VBox<CR>' },
      { 'f', ':VBox<CR>', { mode = 'v' }},
      { '<Esc>', nil, { exit = true } },
   }
})
