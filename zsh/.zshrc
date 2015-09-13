# Default shell
export SHELL=/bin/zsh

# Default user
export DEFAULT_USER=kaicataldo

# Default editor
export EDITOR='atom --wait'

# Custom directory
ZSH_CUSTOM="$HOME/projects/dotfiles/zsh/custom"

# oh-my-zsh plugins
plugins=(git brew npm)

# Source oh-my-zsh
export ZSH=/Users/kaicataldo/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Pure Prompt
# 1. $ git clone git@github.com:sindresorhus/pure.git
# 2. $ ln -s "path/to/repo/pure.zsh" ~/projects/dotfiles/zsh/custom/functions/prompt_pure_setup
# 3. $ ln -s "path/to/repo/async.zsh" ~/projects/dotfiles/zsh/custom/functions/async
fpath=("$HOME/projects/dotfiles/zsh/custom/functions" $fpath)
autoload -U promptinit && promptinit
prompt pure

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# nvm
. ~/.nvm/nvm.sh

# Go
export GOPATH=$HOME/projects/go
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
