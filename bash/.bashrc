#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -hl --color=auto'
alias vi='nvim'
alias vim='nvim'
alias grep='grep -E --color'
alias cat='bat'
alias focus='rfkill block wlan; echo "Focus Mode is ON"'
alias unfocus='rfkill unblock wlan'
alias mupdft='mupdf -C FBF1C7 -A 8 -r 96 -c /usr/share/color/icc/colord/sRGB.icc' # FBF1C7 also good
alias book='mupdft "$(fzf --walker-root=/home/salah/Books)"'
alias goto='todo'

# Add git to the prompt
. ~/.git-prompt.sh
. ~/.command-shortcuts.sh


# fzf
eval "$(fzf --bash)"

## fzf with pacman
alias pzi="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pzr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias activate=". .venv/bin/activate"
. "/home/salah/.deno/env"
[ -f "/home/salah/.ghcup/env" ] && . "/home/salah/.ghcup/env" # ghcup-env

export HISTCONTROL=ignoreboth:erasedups
# eval "$(/home/salah/.local/bin/mise activate bash)"
alias stock='/home/salah/code/python_/stock-market/.venv/bin/stock'
export STOCK_FOLDER='/home/salah/stock'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'


# Disable GDB annonying debug message accept at every run
unset DEBUGINFOD_URLS

export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

update_bash_prompt() {
    local guix_tag=""
    if [ -n "$GUIX_ENVIRONMENT" ]; then
        guix_tag=" [env]"
    fi

    # Call __git_ps1, passing the custom prefix that includes the guix_tag
    __git_ps1 "[\u@\h \W${guix_tag}" "]\$ "
}

# Set the shell prompt
PROMPT_COMMAND=update_bash_prompt
