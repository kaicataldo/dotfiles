# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit && prompt pure # Initialize Pure prompt

# Base16 Shell
BASE16_SHELL=$ZSH/vendor/base16-shell/base16-ocean.dark.sh
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# z
. $ZSH/vendor/z/z.sh

# Homebrew
if [[ $OSTYPE == 'darwin14.0' ]]; then
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
export GOPATH=$HOME/projects/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
