-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd.colorscheme("monochrome")

-- Recognize assembly files
vim.filetype.add({ extension = { asm = "nasm" } })

-- VimTeX config
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"
