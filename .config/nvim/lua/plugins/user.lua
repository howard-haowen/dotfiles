-- if true then return {} end  WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  -- For community plugins, add them in nvim/lua/community.lua

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "   ▄█    █▄       ▄████████  ▄██████▄   ▄█     █▄     ▄████████ ███▄▄▄▄   ",
        "  ███    ███     ███    ███ ███    ███ ███     ███   ███    ███ ███▀▀▀██▄ ",
        "  ███    ███     ███    ███ ███    ███ ███     ███   ███    █▀  ███   ███ ",
        " ▄███▄▄▄▄███▄▄   ███    ███ ███    ███ ███     ███  ▄███▄▄▄     ███   ███ ",
        "▀▀███▀▀▀▀███▀  ▀███████████ ███    ███ ███     ███ ▀▀███▀▀▀     ███   ███ ",
        "  ███    ███     ███    ███ ███    ███ ███     ███   ███    █▄  ███   ███ ",
        "  ███    ███     ███    ███ ███    ███ ███ ▄█▄ ███   ███    ███ ███   ███ ",
        "  ███    █▀      ███    █▀   ▀██████▀   ▀███▀███▀    ██████████  ▀█   █▀  ",
        "                                                                          ",
      }
      return opts
    end,
  },

  -- customize neo-tree options
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false, -- Show hidden files (dotfiles) by default
          hide_gitignored = true, -- Optional: Hide files ignored by Git
        },
      }
      return opts
    end,
  },
}
