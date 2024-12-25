# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with color
- use the `-I` option to ignore a directory
```sh
tree -a -C -I .git 
```

```txt
.
├── .config
│   ├── elia
│   │   └── config.toml
│   ├── fish
│   │   └── functions
│   │       ├── cheat.sh.fish
│   │       ├── ls-pipenv.fish
│   │       └── wttr.fish
│   ├── nushell
│   │   ├── config.nu
│   │   └── env.nu
│   ├── nvim
│   │   ├── .neoconf.json
│   │   ├── .stylua.toml
│   │   ├── README.md
│   │   ├── init.lua
│   │   ├── lua
│   │   │   ├── community.lua
│   │   │   ├── lazy_setup.lua
│   │   │   ├── plugins
│   │   │   │   ├── astrocore.lua
│   │   │   │   ├── astrolsp.lua
│   │   │   │   ├── astroui.lua
│   │   │   │   ├── mason.lua
│   │   │   │   ├── noice.lua
│   │   │   │   ├── none-ls.lua
│   │   │   │   ├── treesitter.lua
│   │   │   │   └── user.lua
│   │   │   └── polish.lua
│   │   ├── neovim.yml
│   │   └── selene.toml
│   ├── starship.toml
│   ├── yazi
│   │   ├── keymap.toml
│   │   ├── package.toml
│   │   ├── plugins
│   │   │   └── rich-preview.yazi
│   │   │       ├── DO_NOT_MODIFY_ANYTHING_IN_THIS_DIRECTORY
│   │   │       ├── LICENSE
│   │   │       ├── README.md
│   │   │       └── init.lua
│   │   ├── theme.toml
│   │   └── yazi.toml
│   └── zellij
│       └── config.kdl
├── .gitignore
├── .stowignore
├── .zshrc
├── Brewfile
├── Brewfile.lock.json
└── README.md

13 directories, 39 files
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

## packages installed via `pipx`

- list packages installed via `pipx`
```sh
pipx list
```

- output
```sh
venvs are in /Users/haowen_jiang/.local/pipx/venvs
apps are exposed on your $PATH at /Users/haowen_jiang/.local/bin
manual pages are exposed at /Users/haowen_jiang/.local/share/man
   package docling 2.13.0, installed using Python 3.12.7
    - docling
   package elia-chat 1.10.0, installed using Python 3.12.7
    - elia
   package jsondiff 2.2.1, installed using Python 3.12.7
    - jdiff
   package llm 0.19.1, installed using Python 3.12.6
    - llm
   package strip-tags 0.5.1, installed using Python 3.12.7
    - strip-tags
   package ttok 0.3, installed using Python 3.12.7
    - ttok
   package uv 0.5.11, installed using Python 3.12.7
    - uv
    - uvx
```

## packages installed via `uv`

- list packages installed via `uv`
```sh
uv tool list
```

- output
```sh
open-interpreter v0.4.3
- i
- interpreter
- interpreter-classic
- wtf
```
