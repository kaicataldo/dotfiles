# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit && prompt pure # Initialize Pure prompt

# z
. $ZSH/vendor/z/z.sh

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# nvm
. $HOME/.nvm/nvm.sh

# Go
export GOPATH=$HOME/projects/go
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
