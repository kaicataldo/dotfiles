# === Config ===

export CLICOLOR=1
export VISUAL="vim"
export EDITOR="$VISUAL"
export PS1="\[\e[34m\]\w\n\[\e[35m\]$\[\e[m\] "

# === Aliases ===

# General
alias mv="mv -v"
alias cp="cp -v"

# Applications
alias g="git"
alias tm="tmux"
alias dm="docker-machine"
alias dc="docker-compose"

# Directory Info
alias ll="ls -lFh"
alias la="ls -lAFh"  # List all files (including hidden)
alias lh="ls -ld .*" # List hidden files only
alias lr="ls -tRFh"  # List recursively

# tmux
alias tms="tmux new -s"
alias tma="tmux a -t"
alias tmk="tmux kill-session -t"
alias tml="tmux ls"

# npm
alias npmls="npm ls --depth=0"

# bash config
alias bashrc="if [ -f $HOME/.bashrc ]; then $EDITOR $HOME/.bashrc; fi"
alias localrc="if [ -f $HOME/.localrc ]; then $EDITOR $HOME/.localrc; fi"
alias reload="if [ -f $HOME/.bashrc ]; then source $HOME/.bashrc && echo 'Shell config reloaded from ~/.bashrc'; fi"

# === Functions ===

# Create new tmux session in current directory
tmn() {
  tmux new -s "$(basename $PWD)"
}

# === Initializations ===

# z
export _Z_DATA="$HOME/.z/z_data"
[ -f "$HOME/.z/z.sh" ] && . "$HOME/.z/z.sh"

# fzf
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

# nvm (https://github.com/creationix/nvm#git-install)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Source local config file specific to machine if it exists
[ -f "$HOME/.localrc" ] && . "$HOME/.localrc"
