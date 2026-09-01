return {
  "lervag/vimtex",
  lazy = false,

  init = function()
    -- Viewer
    vim.g.vimtex_view_method = "zathura"

    -- Compiler (THIS is what makes it feel like Overleaf)
    vim.g.vimtex_compiler_method = "latexmk"

    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1, -- 🔥 auto recompile like Overleaf
      executable = "latexmk",
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
      },
    }

    -- smoother UX
    vim.g.vimtex_quickfix_mode = 0
  end,
}
