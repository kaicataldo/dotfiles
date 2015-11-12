# Defaults
export SHELL=/bin/zsh
export EDITOR='vim'

# Colors
export TERM=xterm-256color
export CLICOLOR=1

# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt inc_append_history # Append history as commands are executed
setopt share_history # Share history across sessions
setopt hist_ignore_all_dups # Don't save duplicates

# Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation
