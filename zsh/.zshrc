# Default shell
export SHELL=/bin/zsh

# PATH
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Default editor
export EDITOR='subl -n -w'

# Default user
export DEFAULT_USER=kaicataldo

# oh-my-zsh theme
ZSH_THEME="kai-agnoster"

# oh-my-zsh plugins
plugins=(git brew)

# Source oh-my-zsh
export ZSH=/Users/kaicataldo/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
