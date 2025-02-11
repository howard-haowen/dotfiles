# List files
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --sort=name --no-user -la --git -h --tree --level=2'
alias ls='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --sort=name --no-user -la --git -h'

# Use `fzf` to search for files
# Use `bat` to preview them
# Use the default editor to edit a selected file
alias ff='fzf --border --preview "bat --style=numbers --color=always --line-range :500 {}" --bind "enter:execute($EDITOR {})"'
 
# Use fzf with the preview_file function, defined in custom/preview.zsh
# alias ff='fzf --border --preview "preview_file {}"'
