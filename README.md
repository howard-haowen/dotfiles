# Manage dotfiles with [GNU stow](https://www.gnu.org/software/stow/)

## Save dotfiles in a single directory on Machine A

1. Move all dotfiles to `~/dotfiles/` so that it has the same file structure as `~`

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
│   └── nvim
│       └── lua
│           └── community.lua
├── .zshrc
├── Brewfile
├── Brewfile.lock.json
└── README.md
```

2. While in `~/dotfiles`, run `stow .` to create symlinks.

## Replicate dotfiles on Machine B


