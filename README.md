# dotfiles

Here are my [dotfiles](https://dotfiles.github.io). Feel free to use, fork, and modify them!

## Installation/Update

`bin/bootstrap` clones and updates the included submodules from their respective repos and then creates symlinks in the user's home directory to the files in this repository. Additionally, it will ask if you would like to install some required dependencies and, when running MacOS, it will also ask if you would like to install Homebrew and update the dependencies listed in `homebrew/Brewfile`.

When doing the initial setup with Homebrew, make sure to follow any extra steps that are required (such as running the command to setup `fzf`).

*__Warning__: this will overwrite any dotfiles of the same name in your home directory.*

## Components

- [Bash](https://www.gnu.org/software/bash/)
- [Git](https://git-scm.com/)
- [tmux](https://github.com/tmux/tmux)
- [fzf](https://github.com/junegunn/fzf)
- [z](https://github.com/rupa/z)
- [hub](https://hub.github.com/)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [nvm](https://github.com/creationix/nvm)
- [Homebrew](https://brew.sh/) (for MacOS only)
- [Vim](https://www.vim.org/)
- [Neovim](https://neovim.io/)
- [vim-plug](https://github.com/junegunn/vim-plug)
