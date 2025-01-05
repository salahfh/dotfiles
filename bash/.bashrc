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
# PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

eval $(opam env)

# Add git to the prompt
. ~/.git-prompt.sh
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
PROMPT_COMMAND='__git_ps1 "[\u@\h \w" "]\$ "'
