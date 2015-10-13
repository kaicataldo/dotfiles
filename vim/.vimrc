" === NeoBundle ===
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
  NeoBundle 'sjl/vitality.vim'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'kien/ctrlp.vim'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'ntpeters/vim-better-whitespace'
  NeoBundle 'junegunn/goyo.vim'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'jelera/vim-javascript-syntax'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'scrooloose/nerdcommenter'

call neobundle#end()
NeoBundleCheck

" === Bundles config ===
" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" CtrlP
let g:ctrlp_cmd = ':CtrlPMRU'
let g:ctrlp_dont_split = 'nerdtree'

" NERDTree
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_javascript_checkers = ['jshint', 'jscs', 'eslint']

" vim-jsx
" Allow JSX in normal JS files
let g:jsx_ext_required=0

" base16-vim
let base16colorspace=256
colorscheme base16-ocean

" === General settings ===
filetype plugin indent on
set cursorline
set encoding=utf-8
set number
set cursorline
set backspace=indent,eol,start

" Colors
syntax on
set t_Co=256
set background=dark

" Status line
set laststatus=2

" Tabs
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

" Indentation
set smartindent

" Search
set smartcase
set ignorecase
set incsearch
set hlsearch
set wildignore+=*/node_modules/*

" Vim directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//

" Splits
set splitbelow
set splitright

" === GUI ===
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12

" Hide scrollbars
set guioptions-=r
set guioptions-=L

" No beeping
set vb t_vb=

" === Key mappings ===
let mapleader=","
imap jj <esc>

" Line navigation ignores line wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Buffer navigation
nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprevious<CR>

" Tab navigation
nnoremap <leader>K :tabn<CR>
nnoremap <leader>J :tabp<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree
map <leader>n :NERDTreeToggle<CR>

"Better Whitespace
nmap <leader>w :StripWhitespace <CR>

