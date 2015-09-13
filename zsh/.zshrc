# Default user
export DEFAULT_USER=kaicataldo

# Default editor
export EDITOR='atom --wait'

# Pure prompt
fpath=($HOME/.zsh/functions $fpath )
autoload -U promptinit && promptinit
prompt pure

# z
. $HOME/.zsh/vendor/z/z.sh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# nvm
. ~/.nvm/nvm.sh

# Go
export GOPATH=$HOME/projects/go
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

source ~/.zsh/aliases.zsh
