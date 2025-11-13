# Python alias
alias python="/opt/homebrew/opt/python@3.13/bin/python3.13"

# === List files
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --sort=name --no-user -la --git -h --tree --level=2'
alias ls='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --sort=name --no-user -la --git -h'

# === Search 
# Use `fzf` to search for files
# Use `bat` to preview them
# Use the default editor to edit a selected file
alias rgg='rg --context=5 --color=always --line-number'
alias ff='cd ~ && fzf --border --preview "bat --style=numbers --color=always --line-range :500 {}" --bind "enter:execute($EDITOR {})"'
# Use fzf to preview notes managed by nb CLI and the default editor to edit a selected file
alias nbf='nb list --no-id --paths | fzf --border --preview "bat --style=numbers --color=always --line-range :500 {}" --bind "enter:execute($EDITOR {})"'

alias wt='get_weather'
# See https://github.com/chubin/cheat.sh
alias cheat='cht.sh'
# Use the catppuccin-mocha theme for gitui 
alias gitui='gitui -t catppuccin-mocha.ron'
alias img2text='ascii-image-converter --color'
# taskwarrior and taskopen
alias tw='task'
alias to='taskopen'
# Other shortcuts
alias qr='uvx --from qrcode qr'
alias hq='harlequin'
alias orc='orchestrate'
# Use fzf with the preview_file function, defined in custom/preview.zsh
# alias ff="fzf --border --preview 'preview_file {}'"
