# Load zsh modules
autoload -U compinit promptinit
compinit # Initialize completion
promptinit # Initialize prompt

# Pure Prompt
prompt pure

# z
if [ -f "$(brew --prefix)/etc/profile.d/z.sh" ]; then
  source "$(brew --prefix)/etc/profile.d/z.sh"
fi

# fzf
if [ -f "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
fi

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# rbenv
if [ -s "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi

# Go
export GOPATH="$HOME/Code/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
