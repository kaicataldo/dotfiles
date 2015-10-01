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
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" Config
set number
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13

" Colors
syntax enable
set t_Co=256
set background=dark

if has("gui_running")
	colorscheme gruvbox
endif

" Key Mappings
imap jj <esc>
