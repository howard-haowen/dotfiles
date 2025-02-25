# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with icons using `eza`
- use the `-I` option to ignore a directory
```sh
eza --all --tree --icons --level=3 -I .git
```

```txt
 .
├──  .config
│   ├──  aichat
│   │   └──  config.yaml
│   ├──  bagels
│   │   └──  config.yaml
│   ├──  elia
│   │   └──  config.toml
│   ├──  fish
│   │   └──  functions
│   ├──  gitui
│   │   └──  catppuccin-mocha.ron
│   ├──  helix
│   │   ├──  config.toml
│   │   └──  languages.toml
│   ├──  nushell
│   │   ├──  config.nu
│   │   └──  env.nu
│   ├──  nvim
│   │   ├──  .neoconf.json
│   │   ├──  .stylua.toml
│   │   ├──  init.lua
│   │   ├──  lua
│   │   ├──  neovim.yml
│   │   ├── 󰂺 README.md
│   │   └──  selene.toml
│   ├──  starship.toml
│   ├──  wezterm
│   │   ├──  images
│   │   └──  wezterm.lua
│   ├──  xplr
│   │   └──  init.lua
│   ├──  yazi
│   │   ├──  flavors
│   │   ├──  keymap.toml
│   │   ├──  package.toml
│   │   ├──  plugins
│   │   ├──  theme.toml
│   │   └──  yazi.toml
│   └──  zellij
│       └──  config.kdl
├──  .gitignore
├──  .oh-my-zsh
│   └──  custom
│       ├──  aliases.zsh
│       └──  functions.zsh
├──  .stowignore
├── 󱆃 .zshrc
├── 󱄖 Brewfile
├── 󱄖 Brewfile.lock.json
└── 󰂺 README.md
```

1. While in `~/dotfiles`, run this to create symlinks:
```sh
stow .
```

1. When new dotfiles are added to `~/dotfiles`, run this to delete all symlinks before creating them again:
```sh
stow -D .
```

## Replicate dotfiles on Machine B

1. Clone the dotfiles repository using `git`.
```sh
git clone git@github.com:howard-haowen/dotfiles.git 
```

1. While in `~/dotfiles`, run this to create symlinks:
```sh
stow .
```

## Packages installed via `brew bundle`

- List all packages listed in `Brewfile`
```sh
brew bundle list | sort
```

```output
aichat
argc
ascii-image-converter
bat
eza
fastfetch
fd
ffmpeg
ffmpegthumbnailer
fzf
git
gitui
go
imagemagick
jq
neovim
nethack
node
openjdk
pipenv
pipx
poppler
rich-cli
ripgrep
rust
sevenzip
starship
stow
tldr
tree
yazi
zoxide
zsh-autosuggestions
zsh-syntax-highlighting
```

## Packages installed via `pipx`

- List packages installed via `pipx`
```sh
pipx list | sort
```

- output
```sh
    - jdiff
    - llm
    - uv
    - uvx
    - whisper
   package jsondiff 2.2.1, installed using Python 3.12.7
   package llm 0.19.1, installed using Python 3.12.6
   package openai-whisper 20240930, installed using Python 3.12.7
   package uv 0.5.11, installed using Python 3.12.7
```

## Packages installed via `uv`

- List packages installed via `uv`
```sh
uv tool list | sort
```

- output
```sh
- bagels
- datasette
- docling
- docling-tools
- elia
- i
- interpreter
- interpreter-classic
- jupytext
- jupytext-config
- markitdown
- nbp
- nbpreview
- open-webui
- ruff
- vd
- vd2to3.vdx
- visidata
- wtf
bagels v0.3.6
datasette v0.65.1
docling v2.23.0
elia-chat v1.10.0
jupytext v1.16.7
markitdown v0.0.1a3
nbpreview v0.9.1
open-interpreter v0.4.3
open-webui v0.5.10
ruff v0.9.5
visidata v3.1.1
```
