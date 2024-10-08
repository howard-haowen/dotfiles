# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with color
- use the `-I` option to ignore a directory
```sh
tree -a -C -I .git -I .mypy_cach
```

```txt
.
├── .config
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

## pipx packages

- list packages installed via `pipx`
```sh
pipx list
```

- output
```sh
venvs are in /Users/haowen_jiang/.local/pipx/venvs
apps are exposed on your $PATH at /Users/haowen_jiang/.local/bin
manual pages are exposed at /Users/haowen_jiang/.local/share/man
   package llm 0.16, installed using Python 3.12.6
    - llm
```
