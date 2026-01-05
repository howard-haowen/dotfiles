# AGENTS.md

## Build/Lint/Test Commands
- **Lint Lua code**: `selene .config/nvim/lua/`
- **Format Lua code**: `stylua .config/nvim/lua/`
- **No build commands**: This is a dotfiles repository managed with GNU stow.
- **No test commands**: No automated tests present.

## Code Style Guidelines
- **Language**: Primarily Lua for Neovim configurations.
- **Formatting**: Use stylua with 2-space indentation, 120 column width, Unix line endings.
- **Imports**: Use `require "module"` for Lua modules.
- **Naming**: Follow Neovim conventions; use camelCase for variables, UPPER_CASE for constants.
- **Types**: Lua is dynamically typed; no explicit type annotations.
- **Error Handling**: Use `pcall` for safe requires; handle errors gracefully.
- **Comments**: Minimal comments; use descriptive variable names.
- **Other**: No Cursor or Copilot rules found.