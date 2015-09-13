#!/usr/bin/env bash

DOTFILES_DIR=$HOME/projects/dotfiles

# Pull latest files from GitHub
git pull origin master
git submodule update --init --recursive

# All the symlinks
# Pure Prompt
ln -s $DOTFILES_DIR/zsh/.zsh/vendor/pure/pure.zsh $DOTFILES_DIR/zsh/.zsh/functions/prompt_pure_setup
ln -s $DOTFILES_DIR/zsh/.zsh/vendor/pure/async.zsh $DOTFILES_DIR/zsh/.zsh/functions/async

# Git
ln -s $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
ln -s $DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global

# Ruby
ln -s $DOTFILES_DIR/ruby/.gemrc ~/.gemrc

# zsh
ln -sn $DOTFILES_DIR/zsh/.zsh ~/.zsh
ln -s $DOTFILES_DIR/zsh/.zshrc ~/.zshrc
