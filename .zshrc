# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
#
# source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set environment variables
EDITOR=nvim

# Add an alias for python3
alias python=python3
alias py=python3

# Add an alias for pip3
alias pip=pip3

# Set the home directory for nushell config
export XDG_CONFIG_HOME="/Users/haowen_jiang/.config"

# Activate starship
eval "$(starship init zsh)"

# Activate fastfetch
# fastfetch
