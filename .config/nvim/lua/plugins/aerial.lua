-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  {
    "stevearc/aerial.nvim",
    event = "VeryLazy",
    keys = {
      -- Normal mode mapping
      -- The default keybinding is <Leader>lS
      -- <Leader>l is for language tools by default
      -- Change from `S` to `o` for outline
      {
        "<Leader>lo",
        "<cmd>AerialToggle<cr>",
        mode = "n",
        desc = "Toggle symbols outline",
      },
    },
  },
}
