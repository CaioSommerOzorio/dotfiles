return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = function(_, opts)
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")
    local npairs = require("nvim-autopairs")

    npairs.add_rules({
      Rule("$", "$", { "tex", "latex" })
        -- Don't move right or duplicate if typed twice smoothly
        :with_move(cond.none())
        -- Don't add a pair if the next character is a dollar sign
        :with_pair(cond.not_after_regex([=[%$]=])),
    })
  end,
}
