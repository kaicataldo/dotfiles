# General
alias mv="mv -v"
alias cp="cp -v"

# Applications
alias g="git"
alias tm="tmux"
alias dm="docker-machine"
alias dc="docker-compose"

## tmux
alias tms="tmux new -s"
alias tma="tmux a -t"
alias tmk="tmux kill-session -t"
alias tml="tmux ls"

# Directory Info
alias ll="ls -lFh"
alias la="ls -lAFh"  # List all files (inlcuding hidden)
alias lh="ls -ld .*" # List hidden files only
alias lr="ls -tRFh"  # List recursively

# zshrc config
alias zshrc="${EDITOR} ${$(cd -P $(dirname $0) && cd ..; pwd -P)}"
alias reload="source $HOME/.zshrc && echo 'Shell config reloaded from ~/.zshrc'"

#localrc config
alias localrc="if [[ -a $HOME/.localrc ]]; then ${EDITOR} $HOME/.localrc; fi"

# npm
alias npmls="npm ls --depth=0"
