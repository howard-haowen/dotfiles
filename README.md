# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with icons using `eza`
- use the `-I` option to ignore a directory

```sh
eza --all --tree --level=2 --ignore-glob='.git|.mypy_cache' .
```

```output
.
├── .config
│   ├── aichat
│   ├── bagels
│   ├── elia
│   ├── fish
│   ├── gitui
│   ├── goose
│   ├── goread
│   ├── helix
│   ├── matcha
│   ├── nom
│   ├── nushell
│   ├── nvim
│   ├── opencode
│   ├── skhd
│   ├── starship.toml
│   ├── task
│   ├── taskopen
│   ├── wezterm
│   ├── wtf
│   ├── xplr
│   ├── yazi
│   ├── zed
│   └── zellij
├── .gitignore
├── .harlequin.toml
├── .luarocks
│   └── config-5.1.lua
├── .nbrc
├── .newsboat
│   └── urls
├── .oh-my-zsh
│   └── custom
├── .pi
│   └── agent
├── .stowignore
├── .taskline.json
├── .visidatarc
├── .w3m
│   └── config
├── .zshrc
├── AGENTS.md
├── Brewfile
├── Brewfile.lock.json
├── DumpBrewfile
├── newsfeed.opml
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
argc
ascii-image-converter
bash
bat
d2
dotnet
eilmeldung
eza
fastfetch
fd
ffmpeg
ffmpegthumbnailer
fzf
gh
ghostscript
git
git-filter-repo
gitui
go
harehare/tap/mq
hashicorp/tap/vault
httpie
hugo
imagemagick
jq
llvm
lua
luajit
luarocks
matcha
maven
nb
neovim
node
ntfy
openjdk
pipenv
pipx
poppler
rich-cli
ripgrep
rlwrap
rust
serie
sevenzip
skhd
slides
socket_vmnet
starship
steipete/tap/imsg
stow
taskline
tealdeer
tree
unar
viu
w3m
wtfutil
yazi
yq
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
   package jsondiff 2.2.1, installed using Python 3.14.5
    - jdiff
   package uv 0.11.16, installed using Python 3.14.5
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
docling-slim v2.93.0
- docling
- docling-tools
ibm-watsonx-orchestrate v1.14.0
- orchestrate
markitdown v0.1.3
- markitdown
open-webui v0.6.41
- open-webui
pyigt v2.2.0
- igt
rendercv v2.6
- rendercv
rich-diff v1.0.4
- rich-diff
ruff v0.14.3
- ruff
visidata v3.2
- vd
- vd2to3.vdx
- visidata
```

## Packages installed via `npm`

- List global packages installed via `npm`

```sh
npm list -g
```

```output
/Users/haowen_jiang/.npm-global/lib
├── @earendil-works/pi-coding-agent@0.79.0
├── @google/gemini-cli@0.19.1
├── bobshell@0.0.33
├── decktape@3.15.0
├── defuddle@0.18.1
└── newsroom-cli@0.1.11
```

## Packages installed via `yazi`

- List packages installed via `yazi`

```sh
ya pkg list
```

```output
Plugins:
	AnirudhG07/rich-preview (573b275)
	ahkohd/eza-preview (7a2d60f)
Flavors:
	yazi-rs/flavors:catppuccin-mocha (df95930)
```

## Packages installed via `cargo`

- List packages installed via `cargo`

```sh
cargo install --list
```

```output

```
