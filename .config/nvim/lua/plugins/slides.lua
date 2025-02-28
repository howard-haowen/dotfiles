-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  {
    -- https://github.com/aspeddro/slides.nvim
    "aspeddro/slides.nvim",
    config = function()
      require("slides").setup {
        bin = "slides", -- Path to the binary, needs to be installed and available in $PATH
        fullscreen = true, -- Open in fullscreen
      }
    end,
    keys = {
      {
        "<leader>s",
        "<cmd>Slides<cr>",
        mode = "n", -- Normal mode
        desc = "Present file with slides", -- Optional description for the mapping
      },
    },
  },
}
