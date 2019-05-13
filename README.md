# dotfiles

Here are my [dotfiles](https://dotfiles.github.io). They've been written with a few goals in mind:
 * Easily portable across Linux & macOS UNIX systems
 * Quick, easy setup for a reproducible environment

## Installation/Update

### `bin/bootstrap`

`bin/bootstrap` creates symlinks in the user's home directory to the files in this repository. When run with the `--dev-env` flag, it will also bootstrap Vim, Neovim, and tmux.

*__Warning__: this will overwrite any dotfiles of the same name in your home directory.*

### macOS

#### Homebrew

Most dependencies can be installed with Homebrew (with the exception of vim-plug).

To install Homebrew dependencies, use the `brew bundle` command (this command will also upgrade any of the listed dependencies if they are already installed):

```sh
brew bundle -v --file=homebrew/Brewfile
```

Include macOS developer environment packages with the following command:

```sh
brew bundle -v --file=homebrew/Brewfile && brew bundle -v --file=homebrew/Brewfile-dev-env
```

When doing the initial setup with Homebrew, make sure to follow any extra steps that are logged during the installation (such as running the command to setup `fzf`).

#### vim-plug

vim-plug can be installed [as follows](https://github.com/junegunn/vim-plug#vim):

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Linux

While most dependencies can be installed with your distro's package manager, the following tools need to be installed manually.

#### z

[z](https://github.com/rupa/z) is not available through Linux package managers and must be installed manually:

```sh
cd ~ && wget https://raw.githubusercontent.com/rupa/z/master/z.sh
```

#### fzf

fzf can be installed with [Git](https://github.com/junegunn/fzf#using-git):

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

#### vim-plug

vim-plug can be installed [as follows](https://github.com/junegunn/vim-plug#vim):

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Components

- [Bash](https://www.gnu.org/software/bash/)
- [fzf](https://github.com/junegunn/fzf)
- [Git](https://git-scm.com/)
- [Homebrew](https://brew.sh/) (for macOS only)
- [Neovim](https://neovim.io/)
- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
- [tmux](https://github.com/tmux/tmux)
- [Vim](https://www.vim.org/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [z](https://github.com/rupa/z)
