# zsh config location
export ZSH=$HOME/.zsh

# Custom functions path
fpath=($ZSH/functions $fpath)

# Source all zsh files
source $ZSH/config.zsh
source $ZSH/initialize.zsh
source $ZSH/completion.zsh
source $ZSH/aliases.zsh

# Local configs ignored by git
if [[ -a ~/.localrc ]]
  then source ~/.localrc
fi
