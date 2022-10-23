local opt = vim.opt
opt.relativenumber = true
opt.foldmethod = "manual"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.symbols_outline = {
  position = 'left',
}
