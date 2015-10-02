" General
set number
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13
set guioptions-=r " Hide scrollbars
set guioptions-=L
syntax on
set backspace=indent,eol,start
set t_Co=256
set background=dark

" NeoBundle
if has('vim_starting')
  if &compatible
   set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'flazz/vim-colorschemes'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" Bundles config
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
" base16-vim
let base16colorspace=256
" NERDTree
let NERDTreeShowHidden=1
" Color Scheme
colorscheme base16-ocean

" Key Mappings
let mapleader=","
imap jj <esc>
" NERDTree
map <leader>n :NERDTreeToggle<CR>
