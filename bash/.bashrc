# === Functions ===

# Create new tmux session in current directory
tmn() {
  tmux new -s "$(basename $PWD)"
}

# Parse whether Git branch is dirty to show in Bash prompt
parse_git_dirty() {
  # "working directory" changed to "working tree" in Git v2.9.1
  # https://github.com/git/git/blob/master/Documentation/RelNotes/2.9.1.txt
  [[ ! $(git status 2> /dev/null) =~ working[[:space:]](tree|directory)[[:space:]]clean ]] && echo "*"
}

# Parse Git branch name to show in Bash prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1$(parse_git_dirty)/"
}

# === Config ===

export CLICOLOR=1
export VISUAL="vim"
export EDITOR="$VISUAL"
export PS1="\[\033[34m\]\w\[\033[30m\]\$(parse_git_branch)\n\[\033[35m\]$\[\033[00m\] "

# History Settings
export HISTSIZE=5000
export HISTFILESIZE=10000
# Append instead of overwrite history
shopt -s histappend
# Add commands to history immediately
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

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

# === Initializations ===

# Bash completion
if [ -x "$(command -v brew)" ] && [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

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
