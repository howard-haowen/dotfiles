# ╭──────────────────────────────────────────────────────────╮
# │ brew bundle command                                      │
# ╰──────────────────────────────────────────────────────────╯
tap "homebrew/bundle"

# ╭──────────────────────────────────────────────────────────╮
# │ neovim text editor                                       │
# ╰──────────────────────────────────────────────────────────╯
## Ambitious Vim-fork focused on extensibility and agility
## use `nvim` to launch the editor
tap "neovim/neovim" || true
brew "neovim"
## Post-modern modal text editor
brew "helix"

# ╭──────────────────────────────────────────────────────────╮
# │ python environments                                      │
# ╰──────────────────────────────────────────────────────────╯
# brew "pyenv" # replaced by the uv package manager written in Rust
brew "pipenv"
brew "pipx"

# ╭──────────────────────────────────────────────────────────╮
# │ other programming languages                              │
# ╰──────────────────────────────────────────────────────────╯
brew "node" #node.js
brew "openjdk" #java
brew "rust" #rust
brew "go" #golang

# powerlevel10k theme for zsh
# use starship for a better alternative
# brew "powerlevel10k"

# ╭──────────────────────────────────────────────────────────╮
# │ other tools                                              │
# ╰──────────────────────────────────────────────────────────╯
## yazi file manager 
# brew "yazi" 
## file browser
# brew "ranger"
## Hackable, minimal, fast TUI file explorer
brew "xplr"
## Create thumbnails for your video files
# brew "ffmpegthumbnailer" 
## 7-Zip is a file archiver with a high compression ratio 
# brew "sevenzip" 
## lightweight and flexible command-line json processor
brew "jq" 
## PDF rendering library (based on the xpdf-3.0 code base)
# brew "poppler" 
## Simple, fast and user-friendly alternative to find 
brew "fd" 
## Search tool like grep and The Silver Searcher 
brew "ripgrep" 
## Command-line fuzzy finder written in Go
brew "fzf" 
## Shell extension to navigate your filesystem faster
brew "zoxide" 
# Modern, maintained replacement for ls
brew "eza"
## tools and libraries to manipulate images in many formats
brew "imagemagick" 
## Terminal image and video viewer
# brew "timg"
## distributed revision control system
brew "git"
## simple terminal ui for git commands
brew "lazygit"
# simplified and community-driven man pages
brew "tldr"
## like neofetch, but much faster because written mostly in c
brew "fastfetch"
## suite of command-line tools for converting to and working with csv
# brew "csvkit"
## organize software neatly under a single directory tree (e.g. /usr/local)
brew "stow"
## command-line toolbox for fancy output in the terminal
brew "rich-cli"
## display directories as trees (with optional color/html output)
brew "tree"
## pluggable terminal workspace, with terminal multiplexer as the base feature
brew "zellij"
## modern shell for the github era
brew "nushell"
## user-friendly command-line shell for unix-like operating systems
# brew "fish"
## cross-shell prompt for astronauts
brew "starship"

# ╭──────────────────────────────────────────────────────────╮
# │ cask applications                                        │
# ╰──────────────────────────────────────────────────────────╯
# specify a directory to install the applications in
cask_args appdir: '/Applications'
# add extra repositories other than the default one 
tap 'homebrew/homebrew-bundle' || true 
## Menlo for Powerline 
cask "font-hack-nerd-font"
## Terminal emulator as alternative to Apple's Terminal app
# cask "iterm2"
## GPU-accelerated cross-platform terminal emulator and multiplexer
cask "wezterm"
## Get up and running with large language models locally
cask "ollama"
