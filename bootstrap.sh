#!/usr/bin/env bash

# Create and report creation of directories if they don't exist
create_dir() {
  if [ ! -e $1 ]; then
    mkdir $1
    echo "$1 directory created."
  elif [ ! -d $1 ]; then
    echo "$1 already exists but is not a directory."
    exit 1
  else
    echo "$1 already exists and was not created."
  fi
}

# Symlink and report creation of link
create_symlink() {
  ln -sfn $1 $2
  echo "Symlinked $1 to $2."
}

# Print string with a leading newline
print_leading_newline() {
  echo -e "\n$1"
}

# Print string with a trailing newline
print_trailing_newline() {
  echo -e "$1\n"
}

# Warn user this script will overwrite current dotfiles
while true; do
  read -p "Friendly warning: this will overwrite your current dotfiles. Continue? [y/n] " yn
  case $yn in
    [Yy]* ) break ;;
    [Nn]* ) exit 0 ;;
    * ) print_trailing_newline "Please answer [y]es or [n]o." ;;
  esac
done

# Get the dotfiles directory's absolute path
DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd -P)"

# Bash
print_leading_newline "Symlinking Bash dotfiles..."
create_symlink $DOTFILES_DIR/bash/.bashrc $HOME/.bashrc
create_symlink $DOTFILES_DIR/bash/.bash_profile $HOME/.bash_profile

# Git
print_leading_newline "Symlinking Git dotfiles..."
create_symlink $DOTFILES_DIR/git/.gitconfig $HOME/.gitconfig
create_symlink $DOTFILES_DIR/git/.gitignore_global $HOME/.gitignore_global

# Bootstrap Vim/Neovim/tmux when run with the --dev-env flag
if [ "$1" == "--dev-env" ]; then
  print_leading_newline "Creating directories for Vim..."
  create_dir $HOME/.vim
  create_dir $HOME/.vim/autoload
  create_dir $HOME/.vim/backup
  create_dir $HOME/.vim/swp
  create_dir $HOME/.vim/undo
  create_dir $HOME/.config

  # Vim
  print_leading_newline "Symlinking Vim dotfiles..."
  create_symlink $DOTFILES_DIR/vim/.vimrc $HOME/.vimrc

  # Neovim
  print_leading_newline "Symlinking Neovim dotfiles..."
  create_symlink $HOME/.vim $HOME/.config/nvim
  create_symlink $HOME/.vimrc $HOME/.config/nvim/init.vim

  print_leading_newline "Creating directories for tmux..."
  create_dir $HOME/.tmux

  # tmux
  print_leading_newline "Symlinking tmux dotfiles..."
  create_symlink $DOTFILES_DIR/tmux/.tmux.conf $HOME/.tmux.conf
  create_symlink $DOTFILES_DIR/tmux/themes $HOME/.tmux/themes
fi

print_leading_newline "Bootstrapping dotfiles complete!"
exit 0
