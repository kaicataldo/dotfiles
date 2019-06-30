" === vim-plug ===

call plug#begin('~/.vim/plugged')
  " Editor Features
  Plug 'scrooloose/nerdtree'
  " Install fzf externally, either with Homebrew or Git
  " https://github.com/junegunn/fzf#installation
  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' " Installed with Homebrew
  else
    Plug '~/.fzf' " Installed with Git
  endif
  Plug 'junegunn/fzf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'mgee/lightline-bufferline'
  Plug 'w0rp/ale'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Raimondi/delimitMate'

  " Language/Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'moll/vim-node'
  Plug 'leafgarland/typescript-vim'
  Plug 'elzr/vim-json'
  Plug 'othree/html5.vim'
  Plug 'ekalinin/Dockerfile.vim'

  " Color Schemes
  Plug 'kaicataldo/material.vim'
call plug#end()

" === Plugin Config ===

" material.vim
let g:material_terminal_italics = 1
let g:material_theme_style = 'default'

" lightline
let g:lightline = {
  \ 'colorscheme': 'material_vim',
  \ 'active': {
    \ 'left': [
      \ [ 'mode', 'paste' ],
      \ [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \ ]
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
let g:lightline.tabline = { 'left': [ [ 'buffers' ] ], 'right': [] }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type = { 'buffers': 'tabsel' }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['^\.DS_Store$']
let g:NERDTreeHighlightCursorline = 0

" ale
let g:ale_linters_explicit = 1 " Only use linters defined in map
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
if has('nvim')
  let g:ale_completion_enabled = 1
endif

" https://github.com/w0rp/ale/issues/1224#issuecomment-352248157
let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow'],
  \ 'typescript': ['eslint', 'tslint', 'tsserver'],
\ }
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'css': ['prettier']
\ }

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" vim-json
let g:vim_json_syntax_conceal = 0

" ack.vim
let g:ackprg = 'ag --vimgrep --hidden --ignore .git'

" fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" === General settings ===

set encoding=utf-8

" Keyboard/Mouse
set backspace=indent,eol,start
set mouse=a " Enable mouse in terminal Vim
set clipboard=unnamed " Use OS's clipboard
if !has('nvim')
  set ttymouse=xterm2 " Set codes being sent by mouse
endif

" Visuals
if has('termguicolors')
  set termguicolors " True colors
else
  set t_Co=256
endif

colorscheme material
set cursorline " highlight current line - disabled in Vim for performance reasons

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

" fzf.vim
map <C-p> :FZF<CR>

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
