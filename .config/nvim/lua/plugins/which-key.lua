-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE            │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<Leader>?",
      function() require("which-key").show { global = false } end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<Leader>r",
      function()
        -- Function to run the yanked text as a command and write the output below the yanked line in a markdown code block
        local yanked_text = vim.fn.getreg '"'
        local output = vim.fn.systemlist(yanked_text)
        local markdown_output = { "```output" }
        vim.list_extend(markdown_output, output)
        table.insert(markdown_output, "```")
        vim.api.nvim_put(markdown_output, "l", true, true)
      end,
      desc = "Run the yanked text as command",
    },
  },
}
