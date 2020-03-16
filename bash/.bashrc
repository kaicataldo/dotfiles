# === Functions ===

# Parse whether Git branch is dirty to show in Bash prompt
parse_git_dirty() {
  # "working directory" changed to "working tree" in Git v2.9.1
  # https://github.com/git/git/blob/master/Documentation/RelNotes/2.9.1.txt
  [[ ! $(git status 2> /dev/null) =~ working[[:space:]](tree|directory)[[:space:]]clean ]] && echo "*"
}

# Parse Git branch name to show in Bash prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1$(parse_git_dirty)/"
}

# Create new tmux session in current directory
tmd() {
  tmux new -s "$(basename $PWD)"
}

# === Config ===

export CLICOLOR=1
export VISUAL="vim"
export EDITOR="$VISUAL"
# \$(parse_git_branch) must be escaped so that it isn't evaluated immediately when a new session is created.
# We could use single quotes instead, but using double quotes allows for the colors to be evaluated only once.
# https://stackoverflow.com/questions/21517281/ps1-command-substitution-fails-when-containing-newlines-on-msys-bash
export PS1="\[\033[34m\]\w\[\033[1;30m\]\$(parse_git_branch)"$'\n'"\[\033[35m\]\$\[\033[00m\] "

# History Settings
export HISTSIZE=5000
export HISTFILESIZE=10000 # Append instead of overwrite history
shopt -s histappend # Add commands to history immediately
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# === Aliases ===

# General
alias mv="mv -v"
alias cp="cp -v"

# Directory Info
alias ll="ls -lFh"
alias la="ls -lAFh" # List all files (including hidden)
alias lr="ls -tRFh" # List recursively

# Applications
alias g="git"
alias tm="tmux"
alias d="docker"
alias dc="docker-compose"

# npm
alias npmls="npm ls --depth=0"

# tmux
alias tmn="tmux new -s"
alias tma="tmux a -t"
alias tmk="tmux kill-session -t"
alias tml="tmux ls"

# Bash config
alias reload="[ -f $HOME/.bashrc ] && . $HOME/.bashrc && echo 'Shell config reloaded from ~/.bashrc'"
alias bashrc="[ -f $HOME/.bashrc ] && $EDITOR $HOME/.bashrc"
alias localrc="[ -f $HOME/.localrc ] && $EDITOR $HOME/.localrc"

# Linux aliases
if [ $OSTYPE == "linux-gnu" ]; then
  # Colorize output
  alias ls="ls --color=auto"
fi

# === Initializations ===

# macOS/Linux initializations
if [ $OSTYPE == "darwin" ]; then
  if [ -x "$(command -v brew)" ]; then
    # Bash completion
    [ -f "$(brew --prefix)/etc/profile.d/bash_completion.sh" ] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

    # z
    [ -f "$(brew --prefix)/etc/profile.d/z.sh" ] && . "$(brew --prefix)/etc/profile.d/z.sh"
  fi
elif [ $OSTYPE == "linux-gnu" ]; then
  # Bash completion
  [ -f "/etc/profile.d/bash_completion.sh" ] && . "/etc/profile.d/bash_completion.sh"

  # z
  Z_DIR="$HOME/.z"
  export _Z_DATA="$Z_DIR/data"
  [ -f "$Z_DIR/z.sh" ] && . "$Z_DIR/z.sh"

  # fzf installed with apt
  [ -f "/usr/share/doc/fzf/examples/key-bindings.bash" ] && . "/usr/share/doc/fzf/examples/key-bindings.bash"
elif [ $OSTYPE == "msys" ]; then
  # https://help.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases
  env=~/.ssh/agent.env

  agent_load_env() { test -f "$env" && . "$env" >| /dev/null ; }

  agent_start() {
      (umask 077; ssh-agent >| "$env")
      . "$env" >| /dev/null ; }

  agent_load_env

  # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
  agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

  if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
      agent_start
      ssh-add
  elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
      ssh-add
  fi

  unset env
fi

# fzf installed with Homebrew or Git
[ -f "$HOME/.fzf.bash" ] && . "$HOME/.fzf.bash"

# nvm (https://github.com/creationix/nvm#git-install)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Source local config file specific to machine if it exists
[ -f "$HOME/.localrc" ] && . "$HOME/.localrc"
