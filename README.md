# dotfiles

Here are my [dotfiles](https://dotfiles.github.io). Feel free to use, fork, and modify them!

## Installation/Update

`bin/bootstrap` clones and updates the included submodules from their respective repos and then creates symlinks in the user's home directory to the files in this repository.

To install Homebrew dependencies, use the command `brew bundle -v --file=homebrew/Brewfile`. This command will also upgrade any of the listed dependencies if they are already installed.

When doing the initial setup with Homebrew, make sure to follow any extra steps that are logged during the installation (such as running the command to setup `fzf`).

*__Warning__: this will overwrite any dotfiles of the same name in your home directory.*

## Components

- [Bash](https://www.gnu.org/software/bash/)
- [fzf](https://github.com/junegunn/fzf)
- [Git](https://git-scm.com/)
- [Homebrew](https://brew.sh/) (for MacOS only)
- [Neovim](https://neovim.io/)
- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
- [tmux](https://github.com/tmux/tmux)
- [Vim](https://www.vim.org/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [z](https://github.com/rupa/z)
