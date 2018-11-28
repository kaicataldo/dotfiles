" === vim-plug ===

call plug#begin('~/.vim/plugged')
  " Editor Features
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'mgee/lightline-bufferline'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'
  Plug 'tpope/vim-surround'
  Plug 'wellle/targets.vim'
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-commentary'
  Plug 'Raimondi/delimitMate'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'w0rp/ale'

  " Language/Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'posva/vim-vue'
  Plug 'styled-components/vim-styled-components', {'branch': 'main'}
  Plug 'moll/vim-node'
  Plug 'leafgarland/typescript-vim'
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
  Plug 'ekalinin/Dockerfile.vim'

  " Color Schemes
  Plug 'w0ng/vim-hybrid'
  Plug 'kaicataldo/material.vim'
call plug#end()

" === Plugin Config ===
" material.vim
if !exists('$TMUX')
  let g:material_terminal_italics = 1
endif

" lightline
let g:lightline = {
  \ 'colorscheme': 'material_vim',
  \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ],
      \ [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
      \ 'gitbranch': 'fugitive#head',
      \ 'filename': 'LightLineFilename'
    \ }
\ }

" https://github.com/itchyny/lightline.vim/issues/87#issuecomment-119130738
function! LightLineFilename()
  return expand('%')
endfunction

" lightline-bufferline
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline.tabline = {'left': [['buffers']], 'right': []}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}

" NERDTree
let NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['^\.DS_Store$']
let NERDTreeHighlightCursorline = 0

" ale
let g:ale_linters_explicit = 1 " Only use linters defined in map
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
if has('nvim')
  let g:ale_completion_enabled = 1
endif

" https://github.com/w0rp/ale/issues/1224#issuecomment-352248157
let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'eslint_d'

let g:ale_linter_aliases = {'vue': ['css', 'javascript']}
let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow'],
  \ 'typescript': ['eslint', 'tslint', 'tsserver'],
  \ 'vue': ['eslint', 'stylelint'],
  \ 'php': ['phpcs'],
\ }
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'css': ['prettier']
\ }

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-json
let g:vim_json_syntax_conceal = 0

" CtrlP
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_dont_split = 'NERD'

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

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" deoplete
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  " file source completion from buffer path instead of CWD
  let g:deoplete#file#enable_buffer_path = 1
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
colorscheme material

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
set showtabline=2 " ensure tabline always shows for lightline-bufferline
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
set wildignore+=*/.git/*,*/node_modules/*

" Word wrapping
set wrap
set linebreak
set nolist " list disables linebreak

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

" Disable numbers in Neovim terminal buffers
if has('nvim')
  autocmd TermOpen * setlocal nonumber norelativenumber
endif

" === Key mappings ===

let mapleader=";"
inoremap jj <Esc>

" Line navigation ignores line wrap
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Retain selection after indenting
vnoremap < <gv
vnoremap > >gv

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

" Neovim specific keybindings
if has('nvim')
  " Clear search highlighting using Esc
  " This is bound for Neovim only because mouse clicks are interpretted as
  " input in Vim with this binding.
  nnoremap <silent> <Esc> :noh<CR><Esc>
  nnoremap <silent> <C-[> :noh<CR><Esc>
  nnoremap <silent> <C-c> :noh<CR><Esc>

  " Exit terminal mode
  tnoremap <C-[> <C-\><C-n>
endif

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" ack.vim
nnoremap \ :Ack!<Space>-Q<Space>
nnoremap K :Ack! <cword><CR>

" ale
nmap <silent> <Leader>ap <Plug>(ale_previous_wrap)
nmap <silent> <Leader>an <Plug>(ale_next_wrap)

" Better Whitespace
nmap <silent> <Leader>w :StripWhitespace<CR>

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

" lightline-bufferline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" === Visual ===

" Fix italics in Vim
if !has('nvim')
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

" === Misc ===

" .focss files
autocmd BufRead,BufNewFile *.focss set syntax=scss
