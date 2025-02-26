-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  {
    "AstroNvim/astrocommunity",
    event = "VeryLazy",
    keys = {
      -- Normal mode mapping
      {
        "<Leader>cb",
        "<cmd>CBllbox<cr>",
        mode = "n",
        desc = "Create a comment box",
      },
      {
        "<Leader>cb",
        ":<C-U>'<,'>CBllbox<CR>",
        mode = "v",
        desc = "Create a comment box",
      },
    },
  },
}
