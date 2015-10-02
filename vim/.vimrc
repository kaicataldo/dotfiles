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

call neobundle#end()
NeoBundleCheck

" === General Config ===
set t_Co=256
set tabstop=2
set shiftwidth=2
set expandtab
set number
set backspace=indent,eol,start
set background=dark
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13
set guioptions-=r " Hide scrollbars
set guioptions-=L

syntax on
filetype plugin indent on

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//

" === Bundles Config ===
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" base16-vim
let base16colorspace=256

" NERDTree
let NERDTreeShowHidden=1

" Color Scheme
colorscheme base16-ocean

" === Key Mappings ===
let mapleader=","
imap jj <esc>

" Line navigation ignores line wrap
map k gk
map j gj

" NERDTree
map <leader>n :NERDTreeToggle<CR>
