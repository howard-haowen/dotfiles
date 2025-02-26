-- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
if true then return {} end

---@type LazySpec
return {
  -- Add CodeCompanion.nvim plugin
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup {
        strategies = {
          chat = { adapter = "ollama" },
          inline = { adapter = "ollama" },
          agent = { adapter = "ollama" },
        },
        server = {
          url = "127.0.0.1:11434",
          model = "gemma2:9b",
        },
      }
    end,
  },
}
