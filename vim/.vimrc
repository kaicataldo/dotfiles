" vim-plug
call plug#begin('~/.vim/plugged')

  " Plugins
  " Editor Features
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  Plug 'neomake/neomake'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'mileszs/ack.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'Raimondi/delimitMate'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'yonchu/accelerated-smooth-scroll'

  " Language/Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'mxw/vim-jsx'
  Plug 'posva/vim-vue'
  Plug 'moll/vim-node'
  Plug 'elzr/vim-json'
  Plug 'leafgarland/typescript-vim'
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

call plug#end()

" === Plugins Config ===
" vim-airline
let g:airline_theme = 'hybridline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" CtrlP
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_dont_split = 'NERD'

" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['^\.DS_Store$']
let NERDTreeHighlightCursorline = 0

" neomake
let g:neomake_error_sign = { 'text': '✖', 'texthl': 'WarningMsg' }
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']
let g:neomake_vue_enabled_makers = ['eslint_d']
autocmd! BufWritePost * Neomake

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-json
let g:vim_json_syntax_conceal = 0

if executable('ag')
  " ack.vim
  let g:ackprg = 'ag --vimgrep'

  " CtrlP
  " Use ag in CtrlP for listing files. Respects .gitignore!
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ctrlp_clear_cache_on_exit = 1
endif

" vim-hybrid
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" accelerated-smooth-scroll
let g:ac_smooth_scroll_fb_sleep_time_msec = 5
let g:ac_smooth_scroll_du_sleep_time_msec = 5

" === General settings ===
filetype plugin indent on
syntax enable
set encoding=utf-8
set number
set backspace=indent,eol,start
set mouse=a " Enable mouse in terminal Vim
set undofile " Save undo history on buffer close
if !has('nvim')
  set ttymouse=xterm2 " Set codes being sent by mouse
else
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 " Change cursor shape based on mode
endif

" Visuals
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

" Disable preview window
set completeopt-=preview

" Spellcheck .md/.txt files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" === Key mappings ===
let mapleader=";"
inoremap jj <Esc>

" Exit terminal mode
if has('nvim')
  tnoremap jj <C-\><C-n>
endif

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

" === Misc ===
" .focss files
autocmd BufRead,BufNewFile *.focss set syntax=scss
