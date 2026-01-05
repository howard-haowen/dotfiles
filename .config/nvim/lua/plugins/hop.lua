-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  {
    "smoka7/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("hop").setup() -- use defaults
    end,
  },
}
