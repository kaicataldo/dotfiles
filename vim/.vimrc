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
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'rking/ag.vim'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'qpkorr/vim-bufkill'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'junegunn/goyo.vim'
  NeoBundle 'scrooloose/nerdcommenter'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'ntpeters/vim-better-whitespace'
  NeoBundle 'christoomey/vim-tmux-navigator'
  NeoBundle 'edkolev/tmuxline.vim'

  " Language/Syntax
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'othree/javascript-libraries-syntax.vim'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'moll/vim-node'
  NeoBundle 'fatih/vim-go'
  NeoBundle 'othree/html5.vim'
  NeoBundle 'cakebaker/scss-syntax.vim'
  NeoBundle 'elzr/vim-json'
  NeoBundle 'ekalinin/Dockerfile.vim'
  NeoBundle 'mustache/vim-mustache-handlebars'
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'vim-jsbeautify'

  " Color Schemes
  NeoBundle 'altercation/vim-colors-solarized'
  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'mhartington/oceanic-next'
  NeoBundle 'flazz/vim-colorschemes'
call neobundle#end()
NeoBundleCheck

" === Plugins Config ===
" vim-airline
let g:airline_theme='hybridline'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1

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
" Set to use locally installed linters only
function! SetPathSyntasticJSCheckers(checkers)
  " system appends ^@ to the returned string for some reason ¯\_(ツ)_/¯
  silent let l:project_root = substitute(system('git rev-parse --show-toplevel'), '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

  for l:checker in a:checkers
    let l:checker_path = string(project_root . '/node_modules/.bin/' . checker)
    execute 'let g:syntastic_javascript_' . checker . '_exec=' . checker_path
  endfor

  let g:syntastic_javascript_checkers = a:checkers
endfunction

au Filetype javascript call SetPathSyntasticJSCheckers(['jscs', 'jshint', 'eslint'])

" vim-jsx
let g:jsx_ext_required=0

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-hybrid
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1

" === General settings ===
filetype plugin indent on
syntax enable
set encoding=utf-8
set number
set backspace=indent,eol,start
set mouse=a " Enable mouse in terminal Vim
set clipboard=unnamed " Use system clipboard

" Colors
set t_Co=256
set background=dark
colorscheme hybrid

" Status line
set laststatus=2

" Tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Indentation
set autoindent

" Folding
set foldmethod=indent
set nofoldenable

" Search
set smartcase
set ignorecase
set incsearch
set hlsearch
set wildignore+=*/node_modules/*

" Word wrapping
set wrap
set linebreak
set nolist  " list disables linebreak

" Vim directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undo//

" Splits
set splitbelow
set splitright

" No beeping
set noeb vb t_vb=

" Spellcheck .md/.txt files
au BufRead,BufNewFile *.txt,*.md set spell

" Autocomplete
autocmd CompleteDone * pclose

" === Key mappings ===
let mapleader=";"
imap jj <Esc>

" Line navigation ignores line wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Tab navigation
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>j :bp<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" indentLine
map <silent> <Leader>l :IndentLinesToggle<CR>

" Better Whitespace
nmap <silent> <Leader>w :StripWhitespace<CR>

" Clear Highlighing
nnoremap <silent> <Leader>h :noh<CR>

" Toggle paste mode
set pastetoggle=<F6>

" Relative Number Toggle
function! NumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>nt :call NumberToggle()<CR>

" === The Silver Searcher ===
if executable('ag')
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
  nnoremap \ :Ag!<Space>
  nnoremap K :Ag! <cword><CR>
endif

