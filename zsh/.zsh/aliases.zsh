# General
alias c='clear'
alias h='history'

# Directory Info
alias ll='ls -lFh'
alias la='ls -lAFh' # List all files (inlcuding hidden)
alias lh='ls -ld .*' # List hidden files only
alias lr='ls -tRFh' # List recursively

# zsh config
alias zshrc="${EDITOR} ${$(cd -P $(dirname $0) && cd ..; pwd -P)}"
alias reload=". ~/.zshrc && echo 'Shell config reloaded from ~/.zshrc'"

# Homebrew
alias brewup='brew update && brew upgrade --all && brew cleanup && brew prune && brew doctor'

# npm
alias npmls='npm ls --depth=0'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
