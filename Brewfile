# ╭──────────────────────────────────────────────────────────╮
# │ brew bundle                                              │
# ╰──────────────────────────────────────────────────────────╯
# Remove this because now "bundle" is part of the core "brew"
# tap "homebrew/bundle" || true

# ╭──────────────────────────────────────────────────────────╮
# │ Core taps                                                │
# ╰──────────────────────────────────────────────────────────╯
tap "TheZoraiz/ascii-image-converter"
tap "asmvik/formulae", "https://github.com/asmvik/homebrew-formulae.git"
tap "harehare/tap"
tap "hashicorp/tap"
# Required for the cask ngrok
tap "ngrok/ngrok"
# Required for imsg
tap "steipete/tap"
# Required for eilmeldung
tap "christo-auer/eilmeldung", "https://github.com/christo-auer/eilmeldung"
# Required for quarkdown
tap "quarkdown-labs/quarkdown"

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
## Just-In-Time Compiler (JIT) for the Lua programming language
brew "luajit"
## Platform built on V8 to build network applications
brew "node" #node.js
## Development kit for the Java programming language
brew "openjdk" #java
## Safe, concurrent, practical language
brew "rust" #rust
## Open source programming language to build simple/reliable/efficient software
brew "go" #golang
## .NET Core
brew "dotnet"
## Java-based project management
brew "maven"

# ╭──────────────────────────────────────────────────────────╮
# │ AI tools                                                 │
# ╰──────────────────────────────────────────────────────────╯
## AI coding agent, built for the terminal
# brew "opencode"
## All-in-one AI-Powered CLI Chat & Copilot
# brew "aichat"
## Open source, extensible AI agent that goes beyond code suggestions
# brew "block-goose-cli"

# ╭──────────────────────────────────────────────────────────╮
# │ Git tools                                                │
# ╰──────────────────────────────────────────────────────────╯
## distributed revision control system
brew "git"
## Blazing fast terminal-ui for git written in rust
brew "gitui"
## Quickly rewrite git repository history
brew "git-filter-repo"
## Rich git commit graph in your terminal
brew "serie"
## GitHub command-line tool
brew "gh"
## Command-line tool to show clear git graphs arranged for your branching model
# brew "git-graph"
## simple terminal ui for git commands
# brew "lazygit"

# ╭──────────────────────────────────────────────────────────╮
# │ File processors                                          │
# ╰──────────────────────────────────────────────────────────╯
## lightweight and flexible command-line json processor
brew "jq"
### `brew bundle`# Process YAML, JSON, XML, CSV and properties documents from the CLI
brew "yq"
## jq-like command-line tool for markdown processing
brew "harehare/tap/mq", trusted: true

# ╭──────────────────────────────────────────────────────────╮
# │ Dashboard                                                │
# ╰──────────────────────────────────────────────────────────╯
## Personal information dashboard for your terminal
brew "wtfutil"

# ╭──────────────────────────────────────────────────────────╮
# │ File explorers                                           │
# ╰──────────────────────────────────────────────────────────╯
## Hackable, minimal, fast TUI file explorer
# brew "xplr"
## file browser
# brew "ranger"
## yazi file manager
brew "yazi"

# ╭──────────────────────────────────────────────────────────╮
# │ yazi dependencies                                │
# ╰──────────────────────────────────────────────────────────╯
## Create thumbnails for your video files
brew "ffmpegthumbnailer"
## Play, record, convert, and stream audio and video
brew "ffmpeg"
## Feature-rich command-line audio/video downloader
brew "yt-dlp"
## 7-Zip is a file archiver with a high compression ratio
brew "sevenzip"
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
# │ Notes, bookmarks, and tasks                              │
# ╰──────────────────────────────────────────────────────────╯
## Command-line and local web note-taking, bookmarking, and archiving
brew "nb"
## Tasks, boards & notes for the command-line habitat
brew "taskline"
## Feature-rich console based todo list manager, also known as taskwarrior
# brew "task"
## Tool for taking notes and open urls with taskwarrior
# brew "taskopen"
## Terminal user interface for taskwarrior
# brew "taskwarrior-tui"

# ╭──────────────────────────────────────────────────────────╮
# │ Other tools                                              │
# ╰──────────────────────────────────────────────────────────╯
## RSS reader for the terminal
# brew "nom"
## RSS/Atom feeds in the terminal
# brew "goread"
## Pretty feed reader (ATOM/RSS) that stores articles in Markdown files
# brew "bulletty"
## RSS/Atom feed reader for text terminals
# brew "newsboat"
## Daily digest generator for your RSS feeds
brew "matcha"
## TUI RSS reader based on the awesome news-flash library
# brew "eilmeldung"
## User-friendly cURL replacement (command-line HTTP client)
brew "httpie"
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
# brew "tldr"
## Very fast implementation of tldr in Rust
brew "tealdeer"
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
## Terminal slideshow tool, doesn't work!
# brew "presenterm"
## Readline wrapper: adds readline support to tools that lack it
brew "rlwrap"
## Pager/text based browser
brew "w3m"
## Modern diagram scripting language that turns text to diagrams
brew "d2"
## Simple hotkey daemon for macOS
brew "asmvik/formulae/skhd", trusted: true
## Framework for Verilog RTL synthesis
# brew "yosys"
## Configurable static site generator
brew "hugo"
## Next-gen compiler infrastructure
brew "llvm"
## Send push notifications to your phone or desktop via PUT/POST
brew "ntfy"
## Daemon to provide vmnet.framework support for rootless QEMU
brew "socket_vmnet"
## Toolkit for creating graphical user interfaces
# brew "gtk+3"
## HashiCorp Vault CLI
brew "hashicorp/tap/vault", trusted: true
## Send iMessages from the terminal
brew "steipete/tap/imsg", trusted: true
## Command-line unarchiving tools supporting multiple formats
brew "unar"
## Deep clean and optimize your Mac
brew "mole"
## Markdown meets the power of LaTeX
brew "quarkdown-labs/quarkdown/quarkdown", trusted: true

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
# cask "wezterm"
## Rust-based terminal
cask "warp"
## Multiplayer code editor
cask "zed"
## Get up and running with large language models locally
cask "ollama-app"
## Kubernetes and container management on the desktop
cask "rancher"
## Free and open-source RSS reader
cask "netnewswire"
## Reverse proxy, secure introspectable tunnels to localhost
cask "ngrok"
## Imaging utility to install operating systems to a microSD card
cask "raspberry-pi-imager"
## Free cross-platform office suite, fresh version
cask "libreoffice"

# ╭──────────────────────────────────────────────────────────╮
# │ Fonts                                                    │
# ╰──────────────────────────────────────────────────────────╯
# IBM Plex series
cask "font-ibm-plex-serif"
cask "font-ibm-plex-sans"
cask "font-ibm-plex-sans-tc"
cask "font-ibm-plex-sans-condensed"
cask "font-ibm-plex-mono"
cask "font-ibm-plex-math"
## Menlo for Powerline
cask "font-hack-nerd-font"
