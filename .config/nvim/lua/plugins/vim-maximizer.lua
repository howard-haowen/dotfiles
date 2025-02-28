-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
-- Maximize and Restore Current Window
return {
  -- https://github.com/szw/vim-maximizer
  "szw/vim-maximizer",
  event = "VeryLazy",
  keys = {
    {
      "<Leader>m",
      ":MaximizerToggle<CR>",
      mode = "n", -- Normal mode
      desc = "Toggle Maximizer", -- Optional description for the mapping
    },
  },
}
