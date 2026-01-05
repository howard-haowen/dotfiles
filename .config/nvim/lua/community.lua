-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  { import = "astrocommunity.ai.opencode-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.motion.hop-nvim" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.completion.avante-nvim" },
  -- { import = "astrocommunity.editing-support.true-zen-nvim" },
}
