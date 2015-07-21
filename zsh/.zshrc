# default shell
export SHELL=/bin/zsh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# default editor
export EDITOR='subl -n -w'

# default user
export DEFAULT_USER=kaicataldo

# oh-my-zsh theme
ZSH_THEME="kai-omz-theme"

# oh-my-zsh plugins
plugins=(git brew)

# source oh-my-zsh
export ZSH=/Users/kaicataldo/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# heroku cli
export PATH="/usr/local/heroku/bin:$PATH"

# nvm
. ~/.nvm/nvm.sh

# rbenv
if which rbenv > /dev/null;
  then eval "$(rbenv init -)";
fi
