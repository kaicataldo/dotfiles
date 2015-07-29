# Default shell
export SHELL=/bin/zsh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Default editor
export EDITOR='subl -n -w'

# Default user
export DEFAULT_USER=kaicataldo

# oh-my-zsh theme
ZSH_THEME="kai-agnoster"

# oh-my-zsh plugins
plugins=(git brew)

# Source oh-my-zsh
export ZSH=/Users/kaicataldo/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# nvm
. ~/.nvm/nvm.sh

# rbenv
if which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi

# Heroku
export PATH="/usr/local/heroku/bin:$PATH"

# Shows/Hides hidden files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
