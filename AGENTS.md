# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Project Overview

This is a **personal dotfiles repository** managed with [GNU Stow](https://www.gnu.org/software/stow/), containing comprehensive configuration files for a macOS development environment. The repository uses a symlink-based approach to manage dotfiles across machines, making it easy to replicate and maintain consistent development environments.

### Key Technologies & Tools

- **Package Management**: Homebrew (via Brewfile), pipx, uv, npm, cargo, yazi plugins
- **Shell**: Zsh with Oh My Zsh custom aliases/functions; Bash is also installed
- **Terminal**: WezTerm and Warp
- **Editor**: Neovim with AstroNvim v4+ configuration; Zed is installed as a GUI editor
- **File Management & TUI Tools**: Yazi, eza, fd, ripgrep, bat, nb, matcha, wtfutil
- **Version Control**: Git, GitHub CLI (`gh`), gitui, serie, git-filter-repo
- **AI Tools installed on this machine**: OpenCode, Goose, Gemini CLI, Pi Coding Agent, CrewAI, Open WebUI, Watsonx Orchestrate
- **Programming Languages / Runtimes**: Python, Lua/LuaJIT, Node.js, Java/OpenJDK, Rust, Go, .NET, Maven, LLVM
- **Python Environment**: pipenv, pipx, uv (modern Python package manager)
- **Terminal Enhancements**: fzf (fuzzy finder), zoxide (smart cd), starship (prompt), tealdeer (`tldr` replacement)

### Repository Structure

```
dotfiles/
├── .config/             # Application configurations
│   ├── gitui/           # gitui TUI Git client
│   ├── goose/           # Goose AI agent
│   ├── matcha/          # matcha feed reader
│   ├── nvim/            # Neovim (AstroNvim) configuration
│   ├── opencode/        # OpenCode AI coding agent
│   ├── skhd/            # skhd hotkey daemon
│   ├── starship.toml    # Starship prompt config
│   ├── wezterm/         # WezTerm terminal emulator config
│   ├── wtf/             # wtfutil dashboard config
│   └── yazi/            # Yazi file manager config
├── .oh-my-zsh/custom/   # Oh My Zsh custom aliases and functions
├── .zshrc              # Main Zsh configuration
├── Brewfile            # Homebrew package definitions
├── Brewfile.lock.json  # Locked package versions
├── .stowignore         # Files to ignore during stow
├── .gitignore          # Git ignore patterns
```

When updating this file, verify installed tools with `command -v <tool>`, `brew list --versions <formula>`, `pipx list`, `uv tool list`, `npm list -g`, or `cargo install --list`. Do not describe a tool as installed just because a config directory exists, and remove references to tools that are not installed on this machine.

## Setup and Installation

### Initial Setup on a New Machine

1. **Clone the repository**:
   ```bash
   git clone git@github.com:howard-haowen/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Install packages via Homebrew**:
   ```bash
   brew bundle install
   ```

3. **Create symlinks with GNU Stow**:
   ```bash
   stow .
   ```

4. **Install Oh My Zsh plugins** (if not already installed):
   ```bash
   # zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

   # zsh-syntax-highlighting
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

   # fast-syntax-highlighting
   git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

   # zsh-autocomplete
   git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
   ```

5. **Start Neovim** to trigger AstroNvim plugin installation:
   ```bash
   nvim
   ```

### Updating Dotfiles

When dotfiles are modified in `~/dotfiles`:

```bash
# Remove existing symlinks
stow -D .

# Recreate symlinks with updated files
stow .
```

### Managing Packages

**List installed packages**:
```bash
# Homebrew packages
brew bundle list | sort

# Python packages (pipx)
pipx list

# Python packages (uv)
uv tool list

# Node.js global packages
npm list -g

# Rust packages
cargo install --list

# Yazi plugins
ya pkg list
```

**Update Brewfile** after installing new packages:
```bash
brew bundle dump --force
```

### Updating README.md Generated Output Blocks

When asked to update `README.md`, refresh the generated command output blocks by running each documented command and replacing the `output` code block immediately below it with the latest command output.

Run these commands from the repository root:

```bash
eza --all --tree --level=2 --ignore-glob='.git|.mypy_cache' .
brew bundle list | sort
pipx list | sed -n '4,$p'
uv tool list
ya pkg list
npm list -g
cargo install --list
```

Notes:
- Preserve the command blocks unless the command itself must be corrected.
- Include stderr in the replacement output when a command reports package/environment problems that are useful to document.
- If `npm list -g` is affected by agent-injected `npm_config_*` or `npm_*` environment variables, unset those variables and rerun it so the output reflects the user's normal global npm prefix.

## Development Conventions

### File Organization

- **Configuration files**: Place in `.config/` directory following XDG Base Directory specification
- **Shell customizations**: Add to `.oh-my-zsh/custom/` for aliases and functions
- **Ignore patterns**: Update both `.stowignore` and `.gitignore` for files that shouldn't be tracked or symlinked

### Stow Management

Files listed in `.stowignore` will NOT be symlinked:
- `./.config/nushell/history.txt` - Shell history (privacy; retained because it is present in `.stowignore`)
- `./.mypy_cache/` - Python type checker cache

### Shell Configuration

The `.zshrc` file is organized into sections:
1. **fzf configuration**: Fuzzy finder with Catppuccin Mocha theme
2. **Completion setup**: Homebrew completions and zsh compinit
3. **Oh My Zsh**: Plugin loading and theme configuration
4. **User configuration**: Editor, history settings, key bindings
5. **Path configuration**: Various tool paths (pipx, npm, cargo, Java, etc.)
6. **Startup messages**: Greeting and weather display (commented out)

### Neovim Configuration

- Uses **AstroNvim v4+** as the base configuration
- Custom plugins defined in `.config/nvim/lua/plugins/`
- Configuration follows AstroNvim's modular structure
- Backup existing nvim config before installing

### Theme and Appearance

- **Terminal theme**: Catppuccin Mocha (used in fzf, yazi, gitui)
- **Prompt**: Starship with custom configuration
- **Font**: IBM Plex series and Hack Nerd Font

## Common Tasks

### Adding a New Tool Configuration

1. Create configuration in `.config/<tool-name>/`
2. Test the configuration
3. Commit changes to git
4. Run `stow -D . && stow .` to update symlinks

### Installing a New Homebrew Package

1. Install the package: `brew install <package>`
2. Update Brewfile: `brew bundle dump --force`
3. Commit the updated Brewfile

### Managing Python Environments

This setup supports three Python package managers:
- **pipenv**: For project-specific virtual environments
- **pipx**: For isolated CLI tool installations
- **uv**: Modern, fast Python package manager (preferred for new tools)

Example with uv:
```bash
uv tool install <package-name>
```

### Troubleshooting Symlinks

If symlinks are broken:
```bash
# Remove all symlinks
stow -D .

# Recreate symlinks
stow .

# Verify symlinks
ls -la ~ | grep '\->'
```

## Important Notes

- **macOS-specific**: This configuration is tailored for macOS (darwin)
- **Homebrew paths**: Uses `/opt/homebrew` (Apple Silicon) paths
- **Shell history**: Configured with 10,000 command history, duplicates removed
- **Editor preference**: Neovim for local sessions, vim for SSH sessions
- **Browser**: w3m (terminal-based browser) set as default
- **Lua runtime**: Uses LuaJIT (5.1 compatible)

## AI Tool Integration

AI-related tools currently installed on this machine include:
- **OpenCode**: AI coding agent for terminal (`opencode`, Homebrew package currently installed)
- **Goose**: Extensible AI agent (`goose`, installed under `~/.local/bin`)
- **Gemini CLI**: Google Gemini command-line tool (`gemini`, installed via npm)
- **Pi Coding Agent**: Coding agent CLI (`pi`, installed via npm)
- **CrewAI**: Multi-agent framework (`crewai`, installed via uv)
- **Open WebUI**: Local/web AI interface (`open-webui`, installed via uv)
- **Watsonx Orchestrate CLI**: `orchestrate`, installed via uv

Do not add uninstalled AI tools to this section.

## Security Considerations

- **History privacy**: Commands starting with space are not saved to history (`HIST_IGNORE_SPACE`)
- **Sensitive files**: Shell history and cache directories are excluded from git tracking
- **Credentials**: No credentials or API keys should be committed to this repository

## Additional Resources

- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/)
- [AstroNvim Documentation](https://docs.astronvim.com/)
- [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Homebrew Bundle Documentation](https://github.com/Homebrew/homebrew-bundle)
