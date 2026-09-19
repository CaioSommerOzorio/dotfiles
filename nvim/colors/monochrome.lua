-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "monochrome"

vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#a5a5a5" })
vim.api.nvim_set_hl(0, "PreProc", { fg = "#a5a5a5" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#d5d5d5", italic = true })
vim.api.nvim_string = true
vim.api.nvim_set_hl(0, "Statement", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "Function", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "Operator", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "Type", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "String", { fg = "#F6DE82" })
vim.api.nvim_set_hl(0, "Number", { fg = "#AEC6CF" })
vim.api.nvim_set_hl(0, "Boolean", { fg = "#E6E6FA" })
vim.api.nvim_set_hl(0, "Special", { fg = "#FFD580" })
