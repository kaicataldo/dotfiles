# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit # Initialize prompt

# Pure Prompt
prompt pure

# z
. $CONFIG_DIR/vendor/z/z.sh

# fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# Homebrew
export PATH=/usr/local/sbin:$PATH

# nvm
export NVM_DIR=$HOME/.nvm

if [ -s $NVM_DIR/nvm.sh ]; then
  . $NVM_DIR/nvm.sh
fi

# rbenv
if [ -s $HOME/.rbenv ]; then
  eval "$(rbenv init -)"
fi

# Go
export GOPATH=$HOME/Code/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
