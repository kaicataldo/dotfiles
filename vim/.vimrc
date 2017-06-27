" === vim-plug ===

call plug#begin('~/.vim/plugged')

  " Plugins
  " Editor Features
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'w0rp/ale'
  Plug 'mileszs/ack.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'Raimondi/delimitMate'
  Plug 'terryma/vim-expand-region'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Shougo/deoplete.nvim', has('nvim') ? {'do': ':UpdateRemotePlugins'} : {'on': []}
  Plug 'Shougo/neocomplete.vim', !has('nvim') ? {} : {'on': []}
  Plug 'christoomey/vim-tmux-navigator'

  " Language/Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'posva/vim-vue'
  Plug 'moll/vim-node'
  Plug 'elzr/vim-json'
  Plug 'carlitux/deoplete-ternjs', has('nvim') ? {'do': 'npm install -g tern'} : {'on': []}
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
  Plug 'ekalinin/Dockerfile.vim'

  " Color Schemes
  Plug 'w0ng/vim-hybrid'
  Plug 'mhartington/oceanic-next'
  Plug 'trevordmiller/nova-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'ayu-theme/ayu-vim'
  Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()

" === Plugin Config ===

" vim-airline
let g:airline_theme = 'quantum'
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

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow'],
  \ 'vue': ['eslint', 'stylelint'],
  \ 'php': ['phpcs']
\}
let g:ale_linter_aliases = {'vue': ['css', 'javascript']}

" deoplete/neocomplete
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  " file source completion from buffer path instead of CWD
  let g:deoplete#file#enable_buffer_path = 1

  " 'file' = file paths, 'buffer' = words from currently open buffers
  let g:deoplete#sources = {}
  let g:deoplete#sources['javascript.jsx'] = ['ternjs', 'buffer', 'file']
else
  let g:neocomplete#enable_at_startup = 1
endif

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

" === General settings ===

set encoding=utf-8

" Keyboard/Mouse
set backspace=indent,eol,start
set mouse=a " Enable mouse in terminal Vim
set clipboard=unnamed " Use OS's clipboard
if has('nvim')
  set cursorline " highlight current line - disabled in Vim for performance reasons
else
  set ttymouse=xterm2 " Set codes being sent by mouse
endif

" Visuals
if has('termguicolors')
  set termguicolors " True colors
else
  set t_Co=256
endif
set background=dark
colorscheme quantum

" Numbers
set number
set relativenumber
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
autocmd FocusLost * set norelativenumber
autocmd FocusGained * set relativenumber

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
set foldmethod=syntax
set foldlevelstart=99 " Open buffer with expanded folds

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

" Undo/backup/swap
set undofile " Save undo history on buffer close
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

" Spellcheck
autocmd FileType gitcommit,markdown setlocal spell

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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer cycling
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>

" Tab completion
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Exit terminal mode
if has('nvim')
  tnoremap <C-[> <C-\><C-n>
endif

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ack.vim
nnoremap \ :Ack!<Space>
nnoremap K :Ack! <cword><CR>

" ale
nmap <silent> <Leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <Leader>an <Plug>(ale_next_wrap)

" Better Whitespace
nmap <silent> <Leader>w :StripWhitespace<CR>

" Clear highlighting in normal mode
nnoremap <silent> <Esc> :noh<CR><Esc>
nnoremap <silent> <C-[> :noh<CR><Esc>
nnoremap <silent> <C-c> :noh<CR><Esc>

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
