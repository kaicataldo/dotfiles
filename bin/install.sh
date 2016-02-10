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
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd -P)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Pull latest files from GitHub
cd $DOTFILES_DIR
git submodule update --init --recursive # pull latest versions of vendor submodules

# Create directories if they don't exist
createDir() {
  if [[ ! -e $1 ]]; then
      mkdir $1
  elif [[ ! -d $1 ]]; then
      echo "${1} already exists but is not a directory"
  fi
}

createDir $DOTFILES_DIR/zsh/.zsh/functions
createDir ~/.vim
createDir ~/.vim/bundle
createDir ~/.vim/backup
createDir ~/.vim/swp
createDir ~/.vim/undo

# Git clone NeoBundle
if [[ ! -e ~/.vim/bundle/neobundle.vim ]]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# All the symlinks
# Pure Prompt
ln -sf $DOTFILES_DIR/zsh/.zsh/vendor/pure/pure.zsh $DOTFILES_DIR/zsh/.zsh/functions/prompt_pure_setup
ln -sf $DOTFILES_DIR/zsh/.zsh/vendor/pure/async.zsh $DOTFILES_DIR/zsh/.zsh/functions/async

# Git
ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global

# JavaScript
ln -sf $DOTFILES_DIR/javascript/.eslintrc ~/.eslintrc

# Ruby
ln -sf $DOTFILES_DIR/ruby/.gemrc ~/.gemrc

# Vim
ln -sf $DOTFILES_DIR/vim/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/vim/.gvimrc ~/.gvimrc

# zsh
ln -snf $DOTFILES_DIR/zsh/.zsh ~/.zsh
ln -sf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc
