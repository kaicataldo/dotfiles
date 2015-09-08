# Default shell
export SHELL=/bin/zsh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Default editor
export EDITOR='subl -n -w'

# Default user
export DEFAULT_USER=kaicataldo

# oh-my-zsh theme
ZSH_THEME="kai-agnoster"

# oh-my-zsh plugins
plugins=(git brew npm)

# Source oh-my-zsh
export ZSH=/Users/kaicataldo/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# nvm
. ~/.nvm/nvm.sh

# Go
export GOPATH=$HOME/projects/go
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
