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
DOTFILES_DIR=$(cd $(dirname $0) ; pwd -P)

# Pull latest files from GitHub
cd "${DOTFILES_DIR}"
git pull origin master
git submodule update --init --recursive # pull latest versions of vendor submodules

# Create .zsh/functions directory if doesn't exit
if [ ! -e $DOTFILES_DIR/zsh/.zsh/functions ]
then
  mkdir $DOTFILES_DIR/zsh/.zsh/functions
fi

# All the symlinks
# Pure Prompt
ln -sf $DOTFILES_DIR/zsh/.zsh/vendor/pure/pure.zsh $DOTFILES_DIR/zsh/.zsh/functions/prompt_pure_setup
ln -sf $DOTFILES_DIR/zsh/.zsh/vendor/pure/async.zsh $DOTFILES_DIR/zsh/.zsh/functions/async

# Git
ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global

# Ruby
ln -sf $DOTFILES_DIR/ruby/.gemrc ~/.gemrc

# zsh
ln -snf $DOTFILES_DIR/zsh/.zsh ~/.zsh
ln -sf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc
