# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit # Initialize Pure prompt

# Base16 Shell
BASE16_SHELL=$ZSH/vendor/base16-shell/base16-ocean.dark.sh
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Pure Prompt
prompt pure

# z
. $ZSH/vendor/z/z.sh

# Homebrew
if [[ $OSTYPE == darwin* ]]; then
  export PATH=/usr/local/sbin:$PATH
fi

# nvm
export NVM_DIR="$HOME/.nvm"

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  . "$NVM_DIR/nvm.sh"
fi

# rbenv
if [[ -s "$HOME/.rbenv" ]]; then
  if [[ $OSTYPE == 'linux-gnu' ]]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
  fi

  eval "$(rbenv init -)"
fi

# Go
export GOPATH=$HOME/Projects/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
