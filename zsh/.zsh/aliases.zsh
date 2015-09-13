# Directory Info
alias ll='ls -GFhl'
alias la='ls -GFhla' # List all files (inlcuding hidden)
alias lh='ls -GFdl .*' # List hidden files only

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Homebrew
alias brewup='brew update && brew upgrade --all && brew cleanup && brew prune && brew doctor'
