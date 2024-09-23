# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`.

- show the tree structure of all files with color
```sh
tree -a -C
```

```txt
├── .config
│   ├── fish
│   │   └── functions
│   │       ├── cheat.sh.fish
│   │       ├── ls-pipenv.fish
│   │       └── wttr.fish
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
│   │   │   │   ├── none-ls.lua
│   │   │   │   ├── treesitter.lua
│   │   │   │   └── user.lua
│   │   │   └── polish.lua
│   │   ├── neovim.yml
│   │   └── selene.toml
│   └── zellij
│       └── config.kdl
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
