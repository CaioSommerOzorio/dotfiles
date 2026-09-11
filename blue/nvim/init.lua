-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("set number")
vim.cmd("set shiftwidth=2")
vim.cmd("set smartindent")
vim.cmd("set tabstop=2")
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format file with Prettier" })

vim.keymap.set("n", "<leader>p", function()
  vim.fn.setreg("+", vim.fn.getcwd())
  print("CWD copied to clipboard")
end, { desc = "Copy current working directory" })

local function substitute_stay(command)
  local view = vim.fn.winsaveview()
  vim.api.nvim_command(command)
  vim.fn.winrestview(view)
end

-- Example mapping: <leader>s to run a global replace without moving
vim.keymap.set("n", "<leader>s", function()
  local search = vim.fn.input("Search: ")
  local replace = vim.fn.input("Replace: ")
  substitute_stay(string.format("%%s/%s/%s/g", search, replace))
end)

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"

vim.g.vimtex_compiler_latexmk = {
  build_dir = "",
  callback = 1,
  continuous = 1,
  executable = "latexmk",
  options = {
    "-pdf",
    "-interaction=nonstopmode",
    "-synctex=1",
  },
}

vim.g.vimtex_indent_on_ampersands = 0
-- Highlight std::string, std::vector, etc. as Types
vim.api.nvim_set_hl(0, "@lsp.type.class.cpp", { link = "Type" })
vim.api.nvim_set_hl(0, "@lsp.type.struct.cpp", { link = "Type" })

-- start

require("cmp").setup({ completion = { autocomplete = false } })

--cmp.setup({
--  -- Do NOT wrap mappings in cmp.mapping.preset.insert()
--  mapping = {
--    -- Explicitly define the completion keys you actually want
--    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--    ["<C-f>"] = cmp.mapping.scroll_docs(4),
--    ["<C-Space>"] = cmp.mapping.complete(),
--    ["<C-e>"] = cmp.mapping.abort(),
--    ["<CR>"] = cmp.mapping.confirm({ select = true }),
--
--    -- Use Ctrl+n and Ctrl+p for menu navigation instead of arrows
--    ["<C-n>"] = cmp.mapping.select_next_item(),
--    ["<C-p>"] = cmp.mapping.select_prev_item(),
--
--    -- Use Tab and Shift+Tab for navigation (optional fallback)
--    ["<Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--    ["<S-Tab>"] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--  },
--  -- rest of your cmp configuration...
--})

-- end

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" }) -- for non-current windows

return {
  "MunifTanjim/prettier.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    local prettier = require("prettier")

    prettier.setup({
      bin = "prettier", -- Or 'prettierd' if you have it installed
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
    })
  end,
}
