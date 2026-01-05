-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE            │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  -- You can keep opts empty or only for general settings; no need to set defaults for the group here.
  opts = {
    -- your configuration comes here
  },

  keys = {
    -- === declare the group so which-key shows "j - Jump with Hop" ===
    { "<leader>j", group = "Jump with Hop", mode = { "n", "x", "o" } },

    -- === your existing bindings ===
    {
      "<leader>?",
      function() require("which-key").show { global = false } end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<leader>r",
      function()
        local yanked_text = vim.fn.getreg '"'
        local output = vim.fn.systemlist(yanked_text)
        local markdown_output = { "```output" }
        vim.list_extend(markdown_output, output)
        table.insert(markdown_output, "```")
        vim.api.nvim_put(markdown_output, "l", true, true)
      end,
      desc = "Run the yanked text as command",
    },

    -- === Hop commands under <leader>j ===
    { "<leader>jp", "<cmd>HopPattern<CR>", desc = "Hop: Pattern", mode = { "n", "x", "o" } },
    { "<leader>jn", "<cmd>HopNodes<CR>", desc = "Hop: Nodes", mode = { "n", "x", "o" } },
    { "<leader>jw", "<cmd>HopWord<CR>", desc = "Hop: Word", mode = { "n", "x", "o" } },
    { "<leader>jc", "<cmd>HopChar1<CR>", desc = "Hop: Char1", mode = { "n", "x", "o" } },
    { "<leader>jC", "<cmd>HopChar2<CR>", desc = "Hop: Char2", mode = { "n", "x", "o" } },
    { "<leader>jl", "<cmd>HopLine<CR>", desc = "Hop: Line", mode = { "n", "x", "o" } },
    -- { "<leader>jL", "<cmd>HopLineStart<CR>", desc = "Hop: Line Start",  mode = { "n", "x", "o" } },
  },
}
