# General
alias c=clear
alias h=history
alias mv="mv -v"
alias cp="cp -v"

# Applications
alias g=git
alias dm=docker-machine

# Directory Info
alias ll="ls -lFh"
alias la="ls -lAFh"  # List all files (inlcuding hidden)
alias lh="ls -ld .*" # List hidden files only
alias lr="ls -tRFh"  # List recursively

# zshrc config
alias zshrc="${EDITOR} ${$(cd -P $(dirname $0) && cd ..; pwd -P)}"
alias reload="source ~/.zshrc && echo 'Shell config reloaded from ~/.zshrc'"

#localrc config
alias localrc="if [[ -a ~/.localrc ]]; then ${EDITOR} ~/.localrc; fi"

# npm
alias npmls="npm ls --depth=0"
