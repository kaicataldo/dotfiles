# Base config
export ZSH=$HOME/.zsh
export SHELL=/usr/local/bin/zsh
export EDITOR='atom --wait'

# Source all zsh files
source $ZSH/config.zsh
source $ZSH/completion.zsh
source $ZSH/aliases.zsh

# Local configs ignored by git
if [[ -a ~/.localrc ]]
  then source ~/.localrc
fi

# Custom functions path
fpath=($ZSH/functions $fpath )

# zsh modules
autoload -U compinit promptinit
compinit

# Pure prompt
promptinit
prompt pure

# z
. $ZSH/vendor/z/z.sh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# nvm
export NVM_DIR=$HOME/.nvm
[ -s $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh

# rbenv
eval "$(rbenv init - --no-rehash)"

# Go
export GOPATH=$HOME/projects/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
