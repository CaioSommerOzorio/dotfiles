-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- remember cursor
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- enable universal clipboard
vim.o.clipboard = 'unnamedplus'

require("lazy").setup({
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
        require("mini.pairs").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "lua",
      "python",
      "vim",
      "vimdoc",
      "rust",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if lang then
        pcall(vim.treesitter.start, args.buf, lang)
      end
      end,
    })
    end,
  },
  {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    "kylechui/nvim-surround",
    version = "^4.0.0", 
    event = "VeryLazy",
     config = function()
       require("nvim-surround").setup({})
     end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>p",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[P]rettiner",
      },
    },
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt" }
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({})
    end,
  },
})

vim.g.mapleader = " "

-- telescope keybinds
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- colorscheme
vim.cmd.colorscheme("gentoo")

-- get rid of highlighting after found
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })

-- interactive make messages
vim.keymap.set("n", "<leader>m", function()
  vim.cmd("make")
  vim.cmd("copen")
end, { desc = "Make and open quickfix" })

-- show trailing whitespaces
vim.opt.list = true
vim.opt.listchars = {
  trail = '-',
}

-- navigating buffers
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tab space is 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- tab space is 2 for rust as well
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- autocomplete
vim.opt.autocomplete = true
vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }

vim.keymap.set("i", "<M-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<M-Tab>"
end, { expr = true, desc = "Next completion item" })

vim.keymap.set("i", "<M-S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<M-S-Tab>"
end, { expr = true, desc = "Previous completion item" })

local function close_pum_and(key)
  return function()
    return vim.fn.pumvisible() == 1 and ("<C-e>" .. key) or key
  end
end

vim.keymap.set("i", "<CR>", close_pum_and("<CR>"), { expr = true })
vim.keymap.set("i", "<Tab>", close_pum_and("<Tab>"), { expr = true })

vim.keymap.set("i", "<Up>", close_pum_and("<Up>"), { expr = true })
vim.keymap.set("i", "<Down>", close_pum_and("<Down>"), { expr = true })
vim.keymap.set("i", "<Left>", close_pum_and("<Left>"), { expr = true })
vim.keymap.set("i", "<Right>", close_pum_and("<Right>"), { expr = true })
