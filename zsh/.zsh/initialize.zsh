# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit # Initialize Pure prompt

# Pure Prompt
prompt pure

# z
. $ZSH/vendor/z/z.sh

# Homebrew
if [[ $OSTYPE == darwin* ]]; then
  export PATH=/usr/local/sbin:$PATH
fi

# nvm
. $HOME/.nvm/nvm.sh

# rbenv
if [[ $OSTYPE == 'linux-gnu' ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

eval "$(rbenv init -)"

# Go
export GOPATH=$HOME/Projects/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
