#!/usr/bin/env bash

# Warn user this script will overwrite current dotfiles
while true; do
  read -p "Warning: this will overwrite your current dotfiles. Continue? [y/n] " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done

# Get the dotfiles directory's absolute path
DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd -P)"

# Pull latest files from GitHub
cd $DOTFILES_DIR
git submodule update --init --recursive # init git submodules
git submodule foreach git pull origin master # pull latest versions of vendor submodules

# Create directories if they don't exist
create_dir() {
  if [[ ! -e $1 ]]; then
      mkdir $1
      echo "${1} directory created"
  elif [[ ! -d $1 ]]; then
      echo "${1} already exists but is not a directory"
  fi
}

create_dir $DOTFILES_DIR/zsh/.zsh/functions
create_dir $HOME/.vim
create_dir $HOME/.vim/autoload
create_dir $HOME/.vim/backup
create_dir $HOME/.vim/swp
create_dir $HOME/.vim/undo
create_dir $HOME/.tmux
create_dir $HOME/.config

# Symlink and report creation of link
create_symlink() {
  ln -sfn $1 $2
  echo "Symlinked ${1} -> ${2}"
}

# All the symlinks
# Pure Prompt
create_symlink $DOTFILES_DIR/submodules/pure/pure.zsh $DOTFILES_DIR/zsh/.zsh/functions/prompt_pure_setup
create_symlink $DOTFILES_DIR/submodules/pure/async.zsh $DOTFILES_DIR/zsh/.zsh/functions/async

# Git
create_symlink $DOTFILES_DIR/git/.gitconfig $HOME/.gitconfig
create_symlink  $DOTFILES_DIR/git/.gitignore_global $HOME/.gitignore_global

# Ruby
create_symlink $DOTFILES_DIR/ruby/.gemrc $HOME/.gemrc

# Vim
create_symlink $DOTFILES_DIR/submodules/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
create_symlink $DOTFILES_DIR/vim/.vimrc $HOME/.vimrc
create_symlink $DOTFILES_DIR/vim/.gvimrc $HOME/.gvimrc

# Neovim
create_symlink $HOME/.vim $HOME/.config/nvim
create_symlink $HOME/.vimrc $HOME/.config/nvim/init.vim

# tmux
create_symlink $DOTFILES_DIR/tmux/.tmux.conf $HOME/.tmux.conf
create_symlink $DOTFILES_DIR/tmux/colorschemes $HOME/.tmux/colorschemes
# zsh
create_symlink $DOTFILES_DIR/zsh/.zshrc $HOME/.zshrc
create_symlink $DOTFILES_DIR/zsh/.zsh $HOME/.zsh
