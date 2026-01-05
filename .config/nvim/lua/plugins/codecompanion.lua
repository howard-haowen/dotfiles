-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE            │
-- ╰─────────────────────────────────────────────────────────╯
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
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "ollama",
              env = {
                url = "127.0.0.1:11434",
                api_key = "xxx",
              },
              headers = {
                ["Content-Type"] = "application/json",
                -- ["Authorization"] = "Bearer ${api_key}",
              },
              parameters = {
                sync = true,
              },
              schema = {
                model = {
                  default = "qwen3:latest",
                },
                -- num_ctx = {
                --   default = 16384,
                -- },
                -- num_predict = {
                --   default = -1,
                -- },
              },
            })
          end,
        },
      }
    end,
    keys = {
      -- Normal mode mapping
      {
        "<Leader>la",
        "<cmd>CodeCompanionActions<cr>",
        mode = "n",
        desc = "CodeCompanion Actions",
      },
      {
        "<Leader>lc",
        "<cmd>CodeCompanionChat Toggle<cr>",
        mode = "n",
        desc = "CodeCompanion Chat",
      },
    },
  },
}
