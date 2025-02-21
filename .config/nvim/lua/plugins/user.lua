-- if true then return {} end  WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  -- For community plugins, add them in nvim/lua/community.lua
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
          model = "qwen2.5-coder:latest",
        },
      }
    end,
  },
  -- Add yazi.nvim plugin
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<Leader>y",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open Yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<Leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open Yazi in nvim's working directory",
      },
      {
        -- Toggle the last Yazi session
        "<Leader>ly",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last Yazi session",
      },
    },
  },
  -- ---@type YaziConfig | {}
  -- opts = {
  --   -- if you want to open yazi instead of netrw, see below for more info
  --   open_for_directories = false,
  --   keymaps = {
  --     show_help = "<f1>",
  --   },
  -- },
  --
  --
  -- {
  --   "mikavilpas/yazi.nvim",
  --   config = function()
  --     require("yazi").setup {
  --       -- Configuration options for Yazi
  --       opener = {
  --         run = "nvim %*", -- Command to open files with Neovim
  --         block = true, -- Use block mode for better performance
  --         desc = "nvim", -- Description for the opener
  --       },
  --       -- Other configuration options...
  --     }
  --   end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "   ▄█    █▄       ▄████████  ▄██████▄   ▄█     █▄     ▄████████ ███▄▄▄▄   ",
        "  ███    ███     ███    ███ ███    ███ ███     ███   ███    ███ ███▀▀▀██▄ ",
        "  ███    ███     ███    ███ ███    ███ ███     ███   ███    █▀  ███   ███ ",
        " ▄███▄▄▄▄███▄▄   ███    ███ ███    ███ ███     ███  ▄███▄▄▄     ███   ███ ",
        "▀▀███▀▀▀▀███▀  ▀███████████ ███    ███ ███     ███ ▀▀███▀▀▀     ███   ███ ",
        "  ███    ███     ███    ███ ███    ███ ███     ███   ███    █▄  ███   ███ ",
        "  ███    ███     ███    ███ ███    ███ ███ ▄█▄ ███   ███    ███ ███   ███ ",
        "  ███    █▀      ███    █▀   ▀██████▀   ▀███▀███▀    ██████████  ▀█   █▀  ",
        "                                                                          ",
      }
      return opts
    end,
  },

  -- customize neo-tree options
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = false,
    opts = function(_, opts)
      opts.filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false, -- Show hidden files (dotfiles) by default
          hide_gitignored = true, -- Optional: Hide files ignored by Git
        },
      }
      return opts
    end,
  },
}
