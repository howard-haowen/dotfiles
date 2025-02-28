-- ╭─────────────────────────────────────────────────────────╮
-- │ WARN: REMOVE THE NEXT LINE TO ACTIVATE THIS FILE        │
-- ╰─────────────────────────────────────────────────────────╯
-- if true then return {} end

---@type LazySpec
return {
  "yuratomo/w3m.vim",
  event = "VeryLazy",
  keys = {
    -- Run W3m with yanked text
    {
      "<Leader>fy",
      mode = { "n" }, -- Normal mode mapping
      function()
        -- Get the text from the unnamed register
        local yanked_text = vim.fn.getreg '"'

        -- Trim leading/trailing whitespace (optional)
        yanked_text = yanked_text:match "^%s*(.-)%s*$"

        -- Run :W3b with the yanked text
        vim.cmd("W3m " .. vim.fn.escape(yanked_text, " "))
      end,
      desc = "Run W3m with yanked text",
    },
    -- Run W3m with URL under cursor
    {
      "<Leader>W",
      mode = { "n" }, -- Normal mode mapping
      function()
        -- Use the `expand` function to retrieve the URL under the cursor
        local url = vim.fn.expand "<cWORD>"

        -- Trim leading/trailing whitespace (optional)
        url = url:match "^%s*(.-)%s*$"

        -- Run :W3m with the extracted URL
        vim.cmd("W3m " .. vim.fn.escape(url, " "))
      end,
      desc = "Run W3m with URL under cursor",
    },
  },
}

-- ╭─────────────────────────────────────────────────────────╮
-- │ Usage on Neovim                                         │
-- ╰─────────────────────────────────────────────────────────╯
-- :W3m search-engine-name keyword
-- [search-engine-name]
-- alc              : space alc
-- android          : Android SDK
-- as3              : ActionScript 3.0
-- go               : Go language
-- google           : Google
-- java             : JDK6
-- man              : man
-- msdn             : MSDN
-- perl             : PERL
-- php              : PHP
-- python           : Python
-- rfc              : RFC
-- ruby             : Ruby
-- wikipedia        : Wikipedia
-- yahoo            : Yahoo
-- yahoodict        : Yahoo dictionary
-- local            : Local HTML file
