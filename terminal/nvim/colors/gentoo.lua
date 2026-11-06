-- Clear existing highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "gentoo"

-- Palette
local colors = {
  fg       = "#e8dddd",
  muted    = "#aa9298",
  red      = "#d47782",
  red_dark = "#a84f60",
  red_light= "#e6a0a6",
  burgundy = "#713b49",
  white    = "#f5eeee",
}

-- Main UI
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.fg, bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.burgundy, bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.burgundy })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.burgundy })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.muted })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.red_light, bold = true })

-- Syntax
vim.api.nvim_set_hl(0, "PreProc", { fg = colors.red_light })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.red })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.muted, italic = true })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.red_light, bold = true })
vim.api.nvim_set_hl(0, "Operator", { fg = colors.fg })
vim.api.nvim_set_hl(0, "String", { fg = colors.red })
vim.api.nvim_set_hl(0, "Number", { fg = colors.red_light })
vim.api.nvim_set_hl(0, "Boolean", { fg = colors.red_light })
vim.api.nvim_set_hl(0, "Function", { fg = colors.red_light })
vim.api.nvim_set_hl(0, "Special", { fg = colors.white })
vim.api.nvim_set_hl(0, "Type", { fg = colors.red })
vim.api.nvim_set_hl(0, "@type.builtin.cpp", { fg = colors.red_light })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#e07882" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#d9a16c" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#a9a4c4" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#8eaaa0" })
