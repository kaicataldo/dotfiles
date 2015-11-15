" === NeoBundle ===
if has('vim_starting')
  if &compatible
   set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'

  " Plugins
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'chriskempson/base16-vim'
  NeoBundle 'flazz/vim-colorschemes'
  NeoBundle 'altercation/vim-colors-solarized'
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
  NeoBundle 'othree/html5.vim'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'qpkorr/vim-bufkill'
  NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'rking/ag.vim'
  NeoBundle 'mileszs/ack.vim'

call neobundle#end()
NeoBundleCheck

" === Plugins Config ===
" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" CtrlP
let g:ctrlp_cmd=':CtrlPMixed'
let g:ctrlp_working_path_mode='rw'
let g:ctrlp_dont_split='NERD'

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2

" ag.vim
let g:ag_working_path_mode='r'
let g:ag_highlight=1
let g:ag_mapping_message=0

" Syntastic
let g:syntastic_javascript_checkers=['jshint', 'jscs', 'eslint']

" vim-jsx
let g:jsx_ext_required=0

" base16-vim
let base16colorspace=256

" === General settings ===
filetype plugin indent on
set cursorline
set encoding=utf-8
set number
set cursorline
set backspace=indent,eol,start
set mouse=a

" Colors
syntax on
set t_Co=256
set background=dark
colorscheme base16-ocean

" Status line
set laststatus=2

" Tabs
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab

" Indentation
set smartindent

" Folding
set foldmethod=indent
set nofoldenable

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
set guifont=Inconsolata\ for\ Powerline:h16
set linespace=1

" Hide scrollbars
set guioptions-=r
set guioptions-=L

" No beeping
set vb t_vb=

" === Key mappings ===
let mapleader="\<Space>"
imap jj <Esc>

" Line navigation ignores line wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Buffer navigation
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>j :bprevious<CR>

" Tab navigation
nnoremap <Leader>K :tabn<CR>
nnoremap <Leader>J :tabp<CR>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NERDTree
map <Leader>t :NERDTreeToggle<CR>

" numbertoggle
let g:NumberToggleTrigger='<Leader>n'

" Better Whitespace
nmap <Leader>w :StripWhitespace<CR>

" Toggle paste mode
map <F6> :set invpaste<CR>
set pastetoggle=<F6>

" === The Silver Searcher ===
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching=0

  " Ag shotcut
  nnoremap <C-a> :Ag!<Space>
  nnoremap <Leader>a :Ag! <cword><CR>
endif

