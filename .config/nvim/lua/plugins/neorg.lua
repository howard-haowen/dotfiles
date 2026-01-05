-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  "nvim-neorg/neorg",
  version = "^9",
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.keybinds"] = {},
        ["core.completion"] = {
          config = {
            engine = (astrocore.is_available "nvim-cmp" and "nvim-cmp")
              or (astrocore.is_available "coq_nvim" and "coq_nvim")
              or (astrocore.is_available "nvim-compe" and "nvim-compe"),
          },
        },
        ["core.journal"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/projects/notes",
              gtd = "~/projects/notes/gtd",
            },
            default_workspace = "notes",
          },
        },
        ["core.ui"] = {},
        -- ["core.presenter"] = {
        --   config = {
        --   -- pick exactly one of the following strings:
        --   zen_mode = "zen-mode",  -- for folke/zen-mode.nvim
        --   -- zen_mode = "truezen",   -- for Pocco81/true-zen.nvim
        -- },
      },
    })
  end,
  specs = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        if opts.ensure_installed ~= "all" then
          opts.ensure_installed =
            require("astrocore").list_insert_unique(opts.ensure_installed, { "norg", "norg_meta" })
        end
      end,
    },
  },
}
