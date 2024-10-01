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

# ╭──────────────────────────────────────────────────────────╮
# │ python environments                                      │
# ╰──────────────────────────────────────────────────────────╯
brew "pyenv"
brew "pipenv"
brew "pipx"

# ╭──────────────────────────────────────────────────────────╮
# │ other programming languages                              │
# ╰──────────────────────────────────────────────────────────╯
brew "node" #node.js
brew "openjdk" #java
brew "rust" #rust

# powerlevel10k theme for zsh
# use starship for a better alternative
# brew "powerlevel10k"

# ╭──────────────────────────────────────────────────────────╮
# │ yazi file manager and its dependencies                   │
# ╰──────────────────────────────────────────────────────────╯
brew "yazi" 
## Create thumbnails for your video files
brew "ffmpegthumbnailer" 
## 7-Zip is a file archiver with a high compression ratio 
brew "sevenzip" 
## lightweight and flexible command-line json processor
brew "jq" 
## PDF rendering library (based on the xpdf-3.0 code base)
brew "poppler" 
## Simple, fast and user-friendly alternative to find 
brew "fd" 
## Search tool like grep and The Silver Searcher 
brew "ripgrep" 
## Search tool like grep and The Silver Searcher
brew "fzf" 
## Shell extension to navigate your filesystem faster
brew "zoxide" 
## tools and libraries to manipulate images in many formats
brew "imagemagick" 

# ╭──────────────────────────────────────────────────────────╮
# │ other tools                                              │
# ╰──────────────────────────────────────────────────────────╯
## distributed revision control system
brew "git"
## simple terminal ui for git commands
brew "lazygit"
## file browser
# brew "ranger"
## user-friendly command-line shell for unix-like operating systems
# brew "fish"
## simplified and community-driven man pages
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
## post-modern modal text editor
# brew "helix"
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
cask "iterm2"
