# ╭──────────────────────────────────────────────────────────╮
# │ brew bundle                                              │
# ╰──────────────────────────────────────────────────────────╯
tap "homebrew/bundle" || true 

# ╭──────────────────────────────────────────────────────────╮
# │ Core taps                                                │
# ╰──────────────────────────────────────────────────────────╯
tap "TheZoraiz/ascii-image-converter"
tap "koekeishiya/formulae"
tap "hashicorp/tap"

# ╭──────────────────────────────────────────────────────────╮
# │ Text editor                                              │
# ╰──────────────────────────────────────────────────────────╯
## Ambitious Vim-fork focused on extensibility and agility
brew "neovim", head: "true"
## Post-modern modal text editor
# brew "helix"

# ╭──────────────────────────────────────────────────────────╮
# │ Python environments                                      │
# ╰──────────────────────────────────────────────────────────╯
# All these can be replaced by the uv package manager written in Rust
# brew "pyenv" 
brew "pipenv"
brew "pipx"

# ╭──────────────────────────────────────────────────────────╮
# │ Other programming languages                              │
# ╰──────────────────────────────────────────────────────────╯
## Powerful, lightweight programming language
brew "lua" #lua
## Package manager for the Lua programming language
brew "luarocks" 
## Platform built on V8 to build network applications
brew "node" #node.js
## Development kit for the Java programming language
brew "openjdk" #java
## Safe, concurrent, practical language
brew "rust" #rust
## Open source programming language to build simple/reliable/efficient software
brew "go" #golang

# ╭──────────────────────────────────────────────────────────╮
# │ AI tools                                                 │
# ╰──────────────────────────────────────────────────────────╯
## All-in-one AI-Powered CLI Chat & Copilot
brew "aichat"
## AI coding agent, built for the terminal
brew "opencode"

# ╭──────────────────────────────────────────────────────────╮
# │ Git tools                                                │
# ╰──────────────────────────────────────────────────────────╯
## distributed revision control system
brew "git"
## Blazing fast terminal-ui for git written in rust
brew "gitui"
## Quickly rewrite git repository history
brew "git-filter-repo"
## Command-line tool to show clear git graphs arranged for your branching model
brew "git-graph"
## simple terminal ui for git commands
# brew "lazygit"

# ╭──────────────────────────────────────────────────────────╮
# │ File explorers                                           │
# ╰──────────────────────────────────────────────────────────╯
## Hackable, minimal, fast TUI file explorer
# brew "xplr"
## file browser
# brew "ranger"

# ╭──────────────────────────────────────────────────────────╮
# │ yazi and its dependencies                                │
# ╰──────────────────────────────────────────────────────────╯
## yazi file manager 
brew "yazi" 
## Create thumbnails for your video files
brew "ffmpegthumbnailer" 
## Play, record, convert, and stream audio and video
brew "ffmpeg"
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
## Command-line fuzzy finder written in Go
brew "fzf" 
## Shell extension to navigate your filesystem faster
brew "zoxide" 
## tools and libraries to manipulate images in many formats
brew "imagemagick" 
## Interpreter for PostScript and PDF
brew "ghostscript"

# ╭──────────────────────────────────────────────────────────╮
# │ Other tools                                              │
# ╰──────────────────────────────────────────────────────────╯
## Easily create and use cli based on bash script
brew "argc"
## Clone of cat(1) with syntax highlighting and Git integration
brew "bat"
## Modern, maintained replacement for ls
brew "eza"
## Simple terminal image viewer written in Rust
brew "viu"
## like neofetch, but much faster because written mostly in c
brew "fastfetch"
## command-line toolbox for fancy output in the terminal
brew "rich-cli"
## cross-shell prompt for astronauts
brew "starship"
## organize software neatly under a single directory tree (e.g. /usr/local)
brew "stow"
## Terminal image and video viewer
# brew "timg"
## simplified and community-driven man pages
brew "tldr"
## display directories as trees (with optional color/html output)
brew "tree"
## pluggable terminal workspace, with terminal multiplexer as the base feature
# brew "zellij"
## Terminal multiplexer
# brew "tmux"
## Bourne-Again SHell, a UNIX command interpreter
brew "bash"
## Fish-like fast/unobtrusive autosuggestions for zsh
brew "zsh-autosuggestions"
## Fish shell like syntax highlighting for zsh
brew "zsh-syntax-highlighting"
## Convert images to ascii art
brew "ascii-image-converter"
## Terminal based presentation tool
brew "slides"
## Terminal slideshow tool, the export2pdf function doesn't work!
# brew "presenterm"
## Readline wrapper: adds readline support to tools that lack it
brew "rlwrap"
## Pager/text based browser
brew "w3m"
## Modern diagram scripting language that turns text to diagrams
brew "d2"
## Command-line and local web note-taking, bookmarking, and archiving
brew "nb"
## Feature-rich console based todo list manager, also known as taskwarrior
brew "task"
## Tool for taking notes and open urls with taskwarrior
brew "taskopen"
## Terminal user interface for taskwarrior
brew "taskwarrior-tui"
## Simple hotkey daemon for macOS
brew "skhd"
## Framework for Verilog RTL synthesis
brew "yosys"
## Configurable static site generator
brew "hugo"
## Next-gen compiler infrastructure
brew "llvm"
## Toolkit for creating graphical user interfaces
# brew "gtk+3"
## HashiCorp Vault CLI
brew "hashicorp/tap/vault"
## Object-relational database system
brew "postgresql@13"

# ╭──────────────────────────────────────────────────────────╮
# │ Dependencies of WeasyPrint, which converts HTML to PDF   │
# ╰──────────────────────────────────────────────────────────╯
## Vector graphics library with cross-device output support
# brew "cairo"
## Framework for layout and rendering of i18n text
# brew "pango"
## Toolkit for image loading and pixel buffer manipulation
# brew "gdk-pixbuf"
## Portable Foreign Function Interface library
# brew "libffi"

# ╭──────────────────────────────────────────────────────────╮
# │ Cask applications                                        │
# ╰──────────────────────────────────────────────────────────╯
# specify a directory to install the applications in
cask_args appdir: '/Applications'
## Terminal emulator as alternative to Apple's Terminal app
# cask "iterm2"
## GPU-accelerated cross-platform terminal emulator and multiplexer
cask "wezterm"
## Get up and running with large language models locally
cask "ollama-app"
## Menlo for Powerline 
cask "font-hack-nerd-font"
## Symbols Nerd Font (Symbols Only)
cask "font-symbols-only-nerd-font"
## IBM Plex Sans
cask "font-ibm-plex-sans"
