" vim-plug
call plug#begin('~/.vim/plugged')

  " Plugins
  " Editor Features
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/syntastic'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Raimondi/delimitMate'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'edkolev/tmuxline.vim'

  " Language/Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'moll/vim-node'
  Plug 'elzr/vim-json'
  Plug 'othree/html5.vim'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'JulesWang/css.vim'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'groenewege/vim-less'
  Plug 'fatih/vim-go'
  Plug 'vim-ruby/vim-ruby'
  Plug 'mitsuhiko/vim-python-combined'
  Plug 'StanAngeloff/php.vim'
  Plug 'plasticboy/vim-markdown'
  Plug 'tpope/vim-git'
  Plug 'ekalinin/Dockerfile.vim'

  " Color Schemes
  Plug 'w0ng/vim-hybrid'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'altercation/vim-colors-solarized'

call plug#end()

" === Plugins Config ===
" vim-airline
let g:airline_theme='hybridline'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''

" tmuxline
let g:tmuxline_separators = {
  \ 'left' : '',
  \ 'left_alt': '',
  \ 'right' : '',
  \ 'right_alt' : '',
  \ 'space' : ' '}

" CtrlP
let g:ctrlp_cmd=':CtrlPMixed'
let g:ctrlp_working_path_mode='r'
let g:ctrlp_dont_split='NERD'

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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
if !has('nvim')
  set ttymouse=xterm2 " Set codes being sent by mouse
endif

" Colors
set t_Co=256
set background=dark
colorscheme hybrid_material

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

" Disable bells
set noerrorbells
set novisualbell
set t_vb=

" Spellcheck .md/.txt files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" === Key mappings ===
let mapleader=";"
inoremap jj <Esc>

" Line navigation ignores line wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Retain selection after indenting
vnoremap <  <gv
vnoremap >  >gv

" Split navigation
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>

" Copy to clipboard
nnoremap <Leader>y "*y
vnoremap <Leader>y "*y
nnoremap <Leader>p "*p
vnoremap <Leader>p "*p
nnoremap <Leader>P "*P
vnoremap <Leader>P "*P

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ack.vim
nnoremap \ :Ack!<Space>
nnoremap K :Ack! <cword><CR>

" Better Whitespace
nmap <silent> <Leader>w :StripWhitespace<CR>

" Clear Highlighing
nnoremap <silent> <Leader><Space> :noh<CR>

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

if has('nvim')
  tnoremap jj <C-\><C-n>
endif

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
endif
