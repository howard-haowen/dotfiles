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
      {
        "<Leader>uo",
        "<cmd>AerialToggle<cr>",
        mode = "n",
        desc = "Toggle Aerial for code outline",
      },
    },
  },
}
