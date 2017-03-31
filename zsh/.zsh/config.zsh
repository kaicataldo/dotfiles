# Defaults
export EDITOR=nvim

# Colors
export CLICOLOR=1

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt share_history # Share history across sessions
setopt hist_ignore_all_dups # Don't save duplicates

# Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation

# Key bindings
bindkey -e # emacs keybindings
