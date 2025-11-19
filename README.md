# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with icons using `eza`
- use the `-I` option to ignore a directory

```sh
eza --all --tree --icons --level=2 -I '.git|.mypy_cache'
```

```output
.
├── .config
│   ├── aichat
│   ├── bagels
│   ├── elia
│   ├── fish
│   ├── gitui
│   ├── helix
│   ├── nushell
│   ├── nvim
│   ├── opencode
│   ├── skhd
│   ├── starship.toml
│   ├── task
│   ├── taskopen
│   ├── wezterm
│   ├── xplr
│   ├── yazi
│   └── zellij
├── .gitignore
├── .harlequin.toml
├── .nbrc
├── .oh-my-zsh
│   └── custom
├── .stowignore
├── .visidatarc
├── .w3m
│   └── config
├── .zshrc
├── Brewfile
├── Brewfile.lock.json
├── DumpBrewfile
└── README.md
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
bash
bat
d2
eza
fastfetch
fd
ffmpeg
ffmpegthumbnailer
fzf
ghostscript
git
git-filter-repo
git-graph
gitui
go
hashicorp/tap/vault
hugo
imagemagick
jq
llvm
lua
luarocks
nb
neovim
node
opencode
openjdk
pipenv
pipx
poppler
postgresql@13
rich-cli
ripgrep
rlwrap
rust
sevenzip
skhd
slides
starship
stow
task
taskopen
taskwarrior-tui
tldr
tree
viu
w3m
yazi
yosys
zoxide
zsh-autosuggestions
zsh-syntax-highlighting
```

## Packages installed via `pipx`

- List packages installed via `pipx`

```sh
pipx list | sed -n '4,$p'
```

```output
   package jsondiff 2.2.1, installed using Python 3.12.7
    - jdiff (symlink missing or pointing to unexpected location)
   package openai-whisper 20240930, installed using Python 3.12.7
    - whisper (symlink missing or pointing to unexpected location)
   package uv 0.5.11, installed using Python 3.12.7
    - uv
    - uvx
```

## Packages installed via `uv`

- List packages installed via `uv`

```sh
uv tool list
```

```output
crewai v0.130.0
- crewai
csvkit v2.1.0
- csvclean
- csvcut
- csvformat
- csvgrep
- csvjoin
- csvjson
- csvlook
- csvpy
- csvsort
- csvsql
- csvstack
- csvstat
- in2csv
- sql2csv
datasette v0.65.1
- datasette
docling v2.58.0
- docling
- docling-tools
elia-chat v1.10.0
- elia
ibm-watsonx-orchestrate v1.14.0
- orchestrate
jupytext v1.16.7
- jupytext
- jupytext-config
langflow v1.5.1
- langflow
markitdown v0.1.3
- markitdown
open-interpreter v0.4.3
- i
- interpreter
- interpreter-classic
- wtf
open-webui v0.6.36
- open-webui
pyigt v2.2.0
- igt
rich-diff v1.0.4
- rich-diff
ruff v0.14.3
- ruff
visidata v3.2
- vd
- vd2to3.vdx
- visidata
```

## Packages installed via `yazi`

- List packages installed via `yazi`

```sh
ya pkg list
```

```output
Plugins:
 AnirudhG07/rich-preview (2559e5f)
 AnirudhG07/nbpreview (f8879b3)
Flavors:
 yazi-rs/flavors:catppuccin-mocha (df95930)
```

## Packages installed via `npm`

- List global packages installed via `npm`

```sh
npm list -g
```

```output
└── @google/gemini-cli@0.16.0
```
