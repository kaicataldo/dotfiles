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
git submodule foreach git pull origin master # pull latest versions of vendor submodules


# Create directories if they don't exist
createDir() {
  if [[ ! -e $1 ]]; then
      mkdir $1
      echo "${1} directory created"
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
  echo "NeoBundle installed"
fi

# Symlink and report creation of link
createSymlink() {
  ln -sfn $1 $2
  echo "Symlinked ${1} -> ${2}"
}

# All the symlinks
# Pure Prompt
createSymlink $DOTFILES_DIR/zsh/.zsh/vendor/pure/pure.zsh $DOTFILES_DIR/zsh/.zsh/functions/prompt_pure_setup
createSymlink $DOTFILES_DIR/zsh/.zsh/vendor/pure/async.zsh $DOTFILES_DIR/zsh/.zsh/functions/async

# Git
createSymlink $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
createSymlink  $DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global

# Ruby
createSymlink $DOTFILES_DIR/ruby/.gemrc ~/.gemrc

# Vim
createSymlink $DOTFILES_DIR/vim/.vimrc ~/.vimrc
createSymlink $DOTFILES_DIR/vim/.gvimrc ~/.gvimrc

# zsh
createSymlink $DOTFILES_DIR/zsh/.zshrc ~/.zshrc
createSymlink $DOTFILES_DIR/zsh/.zsh ~/.zsh
