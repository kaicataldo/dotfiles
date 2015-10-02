# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit && prompt pure # Initialize Pure prompt

# Base16 Shell
BASE16_SHELL="$ZSH/vendor/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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
