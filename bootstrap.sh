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

create_dir $HOME/.vim
create_dir $HOME/.vim/autoload
create_dir $HOME/.vim/backup
create_dir $HOME/.vim/swp
create_dir $HOME/.vim/undo
create_dir $HOME/.config
create_dir $HOME/.z

# Symlink and report creation of link
create_symlink() {
  ln -sfn $1 $2
  echo "Symlinked ${1} -> ${2}"
}

# All the symlinks

# bash
create_symlink $DOTFILES_DIR/bash/.bashrc $HOME/.bashrc
create_symlink $DOTFILES_DIR/bash/.bash_profile $HOME/.bash_profile

# Git
create_symlink $DOTFILES_DIR/git/.gitconfig $HOME/.gitconfig
create_symlink  $DOTFILES_DIR/git/.gitignore_global $HOME/.gitignore_global

# Vim
create_symlink $DOTFILES_DIR/submodules/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
create_symlink $DOTFILES_DIR/vim/.vimrc $HOME/.vimrc
create_symlink $DOTFILES_DIR/vim/.gvimrc $HOME/.gvimrc

# Neovim
create_symlink $HOME/.vim $HOME/.config/nvim
create_symlink $HOME/.vimrc $HOME/.config/nvim/init.vim

# tmux
create_symlink $DOTFILES_DIR/tmux/.tmux.conf $HOME/.tmux.conf

# z
create_symlink $DOTFILES_DIR/submodules/z/z.sh $HOME/.z/z.sh

# Ruby
create_symlink $DOTFILES_DIR/ruby/.gemrc $HOME/.gemrc

