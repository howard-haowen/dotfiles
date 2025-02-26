-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {

  -- customize neo-tree options
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- enabled = false,
    opts = function(_, opts)
      opts.filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false, -- Show hidden files (dotfiles) by default
          hide_gitignored = true, -- Optional: Hide files ignored by Git
        },
      }
      return opts
    end,
  },
}
