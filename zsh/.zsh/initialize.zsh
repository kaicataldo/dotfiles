# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit # Initialize Pure prompt

# Pure Prompt
prompt pure

# z
. $ZSH/vendor/z/z.sh

# nvm
export NVM_DIR=$HOME/.nvm

if [[ -s $NVM_DIR/nvm.sh ]]; then
  . $NVM_DIR/nvm.sh
fi

# rbenv
if [[ -s $HOME/.rbenv ]]; then
  if [[ $OSTYPE == "linux-gnu" ]]; then
    export PATH=$HOME/.rbenv/bin:$PATH
  fi

  eval "$(rbenv init -)"
fi

# Go
export GOPATH=$HOME/Projects/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Archey
if [[ $OSTYPE == darwin* && -s /usr/local/bin/archey ]]; then
  archey --offline
fi
