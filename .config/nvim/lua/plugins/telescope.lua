-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").setup {
        defaults = {
          mappings = {
            n = { -- Normal mode mappings
              -- Bind `q` to close the Telescope window
              -- The default is ESC
              q = require("telescope.actions").close,
            },
          },
        },
        extensions = {
          media_files = {
            -- filetypes whitelist
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
          },
        },
      }
      require("telescope").load_extension "media_files"
    end,
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
