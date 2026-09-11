return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- integrates with treesitter
      enable_moveright = true,
      enable_check_bracket_line = true,
      map_bs = true,
    })

    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    -- Make $ behave like other pairs in insert mode
    npairs.add_rules({
      Rule("$", "$", "tex"), -- only for LaTeX files
    })
  end,
}
