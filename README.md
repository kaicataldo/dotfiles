# dotfiles

Here are my [dotfiles](https://dotfiles.github.io). They've been written with a few goals in mind:
 * Portable across modern macOS, Windows (Git Bash), and Linux environments
 * Quick, easy setup for a reproducible environment

## Installation/Update

### `bootstrap.sh`

`bootstrap.sh` creates symlinks in the user's home directory to the files in this repository. When run with the `--dev-env` flag, it will also bootstrap Vim, Neovim, and tmux.

*__Warning__: this will overwrite any dotfiles of the same name in your home directory.*

### coc.nvim

After running vim-plug's `:PlugUpdate` command, install the following CoC extensions:

- [coc-eslint](https://github.com/neoclide/coc-eslint)
- [coc-styled-components](https://github.com/fannheyward/coc-styled-components)
- [coc-prettier](https://github.com/neoclide/coc-prettier)
- [coc-tsserver](https://github.com/neoclide/coc-tsserver)
- [coc-yaml](https://github.com/neoclide/coc-yaml)
- [coc-json](https://github.com/neoclide/coc-json)
- [coc-rls](https://github.com/neoclide/coc-rls)
- [coc-flow](https://github.com/amiralies/coc-flow)
- [coc-git](https://github.com/neoclide/coc-git)
- [coc-go](https://github.com/josa42/coc-go)

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
curl -fLo ~/.z/z.sh --create-dirs \
      https://raw.githubusercontent.com/rupa/z/master/z.sh
```

#### fzf

fzf is available for many popular distros. If it's not available for yours, it can be installed with [Git](https://github.com/junegunn/fzf#using-git):

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

#### Copying in Vim/tmux

The version of Vim provided by your distro's package registry may not be compiled with clipboard support. If that's the case, follow the following instructions:

For Ubuntu >=19.10, install `vim-gtk` instead of `vim`. This installs a version of Vim compiled with clipboard support.

```sh
sudo apt install vim-gtk xclip
```

Note that both Vim & tmux rely on `xclip` in this setup.

### Windows (Git Bash)

#### Git

Download and run the [Git for Windows Installer](https://git-scm.com/downloads).

#### z

[z](https://github.com/rupa/z) must be installed manually:

```sh
curl -fLo ~/.z/z.sh --create-dirs \
      https://raw.githubusercontent.com/rupa/z/master/z.sh
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
