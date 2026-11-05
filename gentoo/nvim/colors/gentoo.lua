-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "gentoo"

vim.api.nvim_set_hl(0, "Normal", { fg = "#d4ced9", bg = "#24182c" })

vim.api.nvim_set_hl(0, "PreProc", { fg = "#a5a5a5" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#ffffff" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#d5d5d5", italic = true })
vim.api.nvim_set_hl(0, "Statement", { bold = true })
vim.api.nvim_set_hl(0, "Operator", { bold = true })

-- Data types
vim.api.nvim_set_hl(0, "String", { fg = "#f1f2c7" })
vim.api.nvim_set_hl(0, "Number", { fg = "#c7f2f1" })
vim.api.nvim_set_hl(0, "Boolean", { fg = "#ddc7f2" })

-- User defined
vim.api.nvim_set_hl(0, "Function", { fg = "#bab9f0" })
vim.api.nvim_set_hl(0, "Special", { fg = "#bab9f0" })
vim.api.nvim_set_hl(0, "Type", { fg = "#e1b9f0" })
vim.api.nvim_set_hl(0, "@type.builtin.cpp", { fg = "#bab9f0" })
