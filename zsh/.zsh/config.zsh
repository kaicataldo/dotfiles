# Defaults
export SHELL=/bin/zsh
export EDITOR='atom --wait'

# Colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt inc_append_history # Append history as commands are executed
setopt share_history # Share history across sessions
setopt extended_history # Save timestamp
setopt hist_ignore_all_dups # Don't save duplicates
setopt hist_find_no_dups # When searching history don't display results already cycled through twice
setopt hist_verify # Don't execute, just expand history
setopt COMPLETE_ALIASES # Don't expand aliases before completion has finished

# Prompt
setopt prompt_subst # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt

# Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation
