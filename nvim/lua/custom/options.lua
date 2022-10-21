local opt = vim.opt
opt.relativenumber = true
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.api.nvim_set_hl(0, "@comment.lua", { fg = "#5c6370", italic = true })
-- vim.api.nvim_set_hl(0, "@field.lua", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@function.call.lua", { italic = true })
-- vim.api.nvim_set_hl(0, "@function.builtin.lua", { bold = true })
-- vim.api.nvim_set_hl(0, "@punctuation.bracket.lua", { fg = "#d19a66" })
-- vim.api.nvim_set_hl(0, "@parameter.lua", { fg = "#abb2bf", italic = true })
-- vim.api.nvim_set_hl(0, "@operator.lua", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@method.lua", { bold = true, fg = "#61afef" })
-- vim.api.nvim_set_hl(0, "@keyword.operator.lua", { fg = "#abb2bf" })
-- vim.api.nvim_set_hl(0, "@keyword.lua", { fg = "#c678dd", italic = true })
