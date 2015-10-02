" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
   set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'chriskempson/base16-vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Plugins config
let g:airline_powerline_fonts = 1

" Config
set number
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h13
" Hide scrollbars
set guioptions-=r
set guioptions-=L

" Colors
syntax enable
set t_Co=256
set background=dark
let g:airline_theme='base16'
let base16colorspace=256
colorscheme base16-ocean

" Key Mappings
imap jj <esc>
