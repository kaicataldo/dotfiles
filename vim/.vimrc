" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" Plugins config
let g:airline_powerline_fonts = 1 " Powerline symbol setup
let g:airline_theme='solarized'

" Config
set number                " show line numbers
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13

" Colors
syntax enable             " enable syntax highlighting
set t_Co=256              " 256 colors
set background=dark

if has("gui_running")
	colorscheme solarized
endif

" Key Mappings
imap jj <esc>             " Map escape key to jj
