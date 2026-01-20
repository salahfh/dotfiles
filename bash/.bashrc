#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias vi='nvim'
alias vim='nvim'
alias cat='bat'
alias focus='rfkill block wlan; echo "Focus Mode is ON"'
alias unfocus='rfkill unblock wlan'
# PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

eval $(opam env)

# Add git to the prompt
. ~/.git-prompt.sh
. ~/.command-shortcuts.sh

# Git
PROMPT_COMMAND='__git_ps1 "[\u@\h \w" "]\$ "'

# fzf
eval "$(fzf --bash)"

## fzf with pacman
alias pzi="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pzr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias activate=". .venv/bin/activate"
. "/home/salah/.deno/env"
[ -f "/home/salah/.ghcup/env" ] && . "/home/salah/.ghcup/env" # ghcup-env

export HISTCONTROL=ignoreboth:erasedups
