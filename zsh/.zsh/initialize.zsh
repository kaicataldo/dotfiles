# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit && prompt pure # Initialize Pure prompt

# z
. $ZSH/vendor/z/z.sh

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
