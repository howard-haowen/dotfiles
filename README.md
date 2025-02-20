# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with icons using `eza`
- use the `-I` option to ignore a directory
```sh
eza --all --tree --icons --level=3 -I .git
```

```txt
.
 .
├──  .config
│   ├──  bagels
│   │   └──  config.yaml
│   ├──  elia
│   │   └──  config.toml
│   ├──  fish
│   │   └──  functions
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
brew bundle list
```

```output
neovim
helix
pipenv
pipx
node
openjdk
rust
go
yazi
ffmpegthumbnailer
ffmpeg
sevenzip
jq
poppler
fd
ripgrep
fzf
zoxide
imagemagick
bat
eza
fastfetch
git
lazygit
rich-cli
starship
stow
tldr
tree
zellij
zsh-autosuggestions
zsh-syntax-highlighting
```

## Packages installed via `pipx`

- List packages installed via `pipx`
```sh
pipx list
```

- output
```sh
   package datasette 0.65.1, installed using Python 3.12.7
    - datasette
   package jsondiff 2.2.1, installed using Python 3.12.7
    - jdiff
   package llm 0.19.1, installed using Python 3.12.6
    - llm
   package openai-whisper 20240930, installed using Python 3.12.7
    - whisper
   package strip-tags 0.5.1, installed using Python 3.12.7
    - strip-tags
   package ttok 0.3, installed using Python 3.12.7
    - ttok
   package uv 0.5.11, installed using Python 3.12.7
    - uv
    - uvx
```

## Packages installed via `uv`

- List packages installed via `uv`
```sh
uv tool list
```

- output
```sh
bagels v0.3.6
- bagels
docling v2.23.0
- docling
- docling-tools
elia-chat v1.10.0
- elia
jupytext v1.16.7
- jupytext
- jupytext-config
markitdown v0.0.1a3
- markitdown
nbpreview v0.9.1
- nbp
- nbpreview
open-interpreter v0.4.3
- i
- interpreter
- interpreter-classic
- wtf
open-webui v0.5.10
- open-webui
ruff v0.9.5
- ruff
```
