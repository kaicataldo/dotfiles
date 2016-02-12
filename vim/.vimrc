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
  " Editor Features
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'mileszs/ack.vim'
  NeoBundle 'rking/ag.vim'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'qpkorr/vim-bufkill'
  NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
  NeoBundle 'sjl/vitality.vim'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'junegunn/goyo.vim'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'ntpeters/vim-better-whitespace'

  " Language/Syntax
  NeoBundle 'jelera/vim-javascript-syntax'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'fatih/vim-go'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'cakebaker/scss-syntax.vim'
  NeoBundle 'elzr/vim-json'
  NeoBundle 'ekalinin/Dockerfile.vim'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'mustache/vim-mustache-handlebars'

  " Color Schemes
  NeoBundle 'chriskempson/base16-vim'
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'tomasr/molokai'
call neobundle#end()
NeoBundleCheck

" === Plugins Config ===
" vim-airline
let g:airline_theme='hybridline'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''

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

" indentLine
let g:indentLine_enabled=0
let g:indentLine_char='┆'

" Syntastic
" Load JS linter based on config file in project
" ...Now with locally installed linters only!
function! SyntasticJSCheckers(checker_options)
  let l:checkers=[]
  " system appends ^@ to the returned string for some reason ¯\_(ツ)_/¯
  silent let l:project_root=substitute(system('git rev-parse --show-toplevel'), '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

  for l:checker in a:checker_options
    if findfile('.' . checker . 'rc', ';' . project_root) != ''
      let l:local_checker=string(project_root . '/node_modules/.bin/' . checker)

      call add(checkers, checker)
      execute 'let g:syntastic_javascript_' . checker . '_exec=' . local_checker
    endif
  endfor

  let g:syntastic_javascript_checkers=checkers
endfunction

au Filetype javascript call SyntasticJSCheckers(['jscs', 'jshint', 'eslint'])

"vim-javascript
let g:javascript_ignore_javaScriptdoc=1

"vim-jsx
let g:jsx_ext_required=0

"vim-json
let g:vim_json_syntax_conceal = 0

" vim-hybrid
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1

" === General settings ===
filetype plugin indent on
syntax enable
set cursorline
set encoding=utf-8
set number
set cursorline
set backspace=indent,eol,start
set clipboard=unnamed " Use system clipboard
set mouse=a " Enable mouse in terminal Vim

" Colors
set background=dark
colorscheme hybrid

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

" No beeping
set noeb vb t_vb=

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
map <C-n> :NERDTreeToggle<CR>

" numbertoggle
let g:NumberToggleTrigger='<Leader>0'

" indentLine
map <silent> <Leader>l :IndentLinesToggle<CR>

" Better Whitespace
nmap <Leader>w :StripWhitespace<CR>

" Clear Highlighing
nnoremap <silent> <Leader>h :nohlsearch<CR>

" Toggle paste mode
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

