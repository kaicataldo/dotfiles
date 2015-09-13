# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY # Append history imeediately
setopt SHARE_HISTORY # Share history across sessions
setopt EXTENDED_HISTORY # Save timestamp
setopt HIST_IGNORE_ALL_DUPS # Don't save duplicates

setopt COMPLETE_ALIASES # Don't expand aliases before completion has finished
