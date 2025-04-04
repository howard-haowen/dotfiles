-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end
---@type LazySpec
return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
      -- Telekasten setup
      require("telekasten").setup {
        -- Put the name of your notes directory here
        home = vim.fn.expand "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/work",
      }
      -- Key mappings
      -- Launch panel if nothing is typed after <leader>z
      vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>", { desc = "Launch Telekasten panel" })

      -- Most used functions
      vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", { desc = "Show backlinks" })
      vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", { desc = "Show calendar" })
      vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", { desc = "Go to today's note" })
      vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_friends<CR>", { desc = "Find friends" })
      vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", { desc = "Create a new note" })
      vim.keymap.set("n", "<leader>zo", "<cmd>Telekasten find_notes<CR>", { desc = "Find notes" })
      -- Requires nvim-telescope/telescope-media-files.nvim
      vim.keymap.set("n", "<Leader>zp", "<cmd>Telekasten preview_img<CR>", { desc = "Preview image under cursor" })
      vim.keymap.set("n", "<leader>zs", "<cmd>Telekasten search_notes<CR>", { desc = "Search notes" })
      vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten show_tags<CR>", { desc = "Show tags" })
      vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", { desc = "Follow note link" })
      vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", { desc = "Insert image link" })

      -- Call insert link automatically when we start typing a link
      vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
    end,
  },
}
