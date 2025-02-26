-- if true then return {} end  WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  -- == Examples of Adding Plugins ==
  -- Add yazi.nvim plugin
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      -- {
      --   "<Leader>y.",
      --   mode = { "n", "v" },
      --   "<cmd>Yazi<cr>",
      --   desc = "Open Yazi at the current file",
      -- },
      -- {
      --   -- Open in the current working directory
      --   "<Leader>yw",
      --   "<cmd>Yazi cwd<cr>",
      --   desc = "Open Yazi in nvim's working directory",
      -- },
      {
        -- Toggle the last Yazi session
        "<Leader>y",
        "<cmd>Yazi toggle<cr>",
        desc = "Open Yazi",
      },
    },
  },
}
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
