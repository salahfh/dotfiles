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
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

eval $(opam env)
