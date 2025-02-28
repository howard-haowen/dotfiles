-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  -- https://github.com/alanfortlink/blackjack.nvim
  "alanfortlink/blackjack.nvim",
  event = "VeryLazy",
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    { "nvim-lua/plenary.nvim" },
  },
  keys = {
    {
      "<Leader>bj",
      ":BlackJackNewGame<CR>",
      mode = "n", -- Normal mode
      desc = "Play Blackjack", -- Optional description for the mapping
    },
  },
  config = function()
    require("blackjack").setup {
      card_style = "large", -- Can be "mini" or "large".
      suit_style = "black", -- Can be "black" or "white".
      -- scores_path = "/home/foo/blackjack_scores.json", -- Default location to store the scores.json file.
      keybindings = {
        ["next"] = "j",
        ["finish"] = "k",
        ["quit"] = "q",
      },
    }
  end,
}
