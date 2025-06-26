# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with icons using `eza`
- use the `-I` option to ignore a directory

```sh
eza --all --tree --icons --level=2 -I '.git|.mypy_cache'
```

```output
.config
├── aichat
│   └── config.yaml
├── bagels
│   └── config.yaml
├── elia
│   └── config.toml
├── fish
│   └── functions
├── gitui
│   └── catppuccin-mocha.ron
├── helix
│   ├── config.toml
│   └── languages.toml
├── nushell
│   ├── config.nu
│   └── env.nu
├── nvim
│   ├── .neoconf.json
│   ├── .stylua.toml
│   ├── init.lua
│   ├── lua
│   ├── neovim.yml
│   ├── README.md
│   └── selene.toml
├── skhd
│   └── skhdrc
├── starship.toml
├── task
│   ├── taskrc
│   └── themes
├── taskopen
│   └── taskopenrc
├── visidata
│   └── config.py
├── wezterm
│   ├── images
│   └── wezterm.lua
├── xplr
│   └── init.lua
├── yazi
│   ├── flavors
│   ├── keymap.toml
│   ├── keymap.toml-1750663417076191
│   ├── package.toml
│   ├── plugins
│   ├── theme.toml
│   ├── theme.toml-1750663417087928
│   ├── yazi.toml
│   └── yazi.toml-1750663417072497
└── zellij
    └── config.kdl
.gitignore
.nbrc
.oh-my-zsh
└── custom
    ├── aliases.zsh
    └── functions.zsh
.stowignore
.w3m
└── config
.zshrc
Brewfile
Brewfile.lock.json
DumpBrewfile
README.md
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
git
git-filter-repo
gitui
go
hugo
imagemagick
jq
llvm
lua
luarocks
nb
neovim
nethack
node
openjdk
pipenv
pipx
poppler
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
pipx list | sort
```

```output
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

```output
- bagels
- crewai
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
- datasette
- docling
- docling-tools
- elia
- i
- igt
- in2csv
- interpreter
- interpreter-classic
- jupytext
- jupytext-config
- markitdown
- nbp
- nbpreview
- ruff
- sql2csv
- vd
- vd2to3.vdx
- visidata
- watsonx-ai
- wtf
bagels v0.3.6
crewai v0.130.0
csvkit v2.1.0
datasette v0.65.1
docling v2.23.0
elia-chat v1.10.0
ibm-watsonx-ai-cli v0.1.8
jupytext v1.16.7
markitdown v0.0.1a3
nbpreview v0.9.1
open-interpreter v0.4.3
pyigt v2.2.0
ruff v0.9.5
visidata v3.1.1
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
├── @google/gemini-cli@0.1.4
├── @zowe/cli@7.28.2
├── netlistsvg@1.0.2
└── readability-cli@2.4.5
```