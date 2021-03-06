" === vim-plug ===

call plug#begin('~/.vim/plugged')

  " Editor Features
  Plug 'scrooloose/nerdtree'
  " Install fzf externally, either with Homebrew,
  " a Linux Package Manager (like apt), or Git
  " https://github.com/junegunn/fzf#installation
  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' " Installed with Homebrew
  elseif !empty(glob('/usr/bin/fzf'))
    source /usr/share/doc/fzf/examples/fzf.vim " Installed with Linux Package Manager
  else
    Plug '~/.fzf' " Installed with Git
  endif
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'mgee/lightline-bufferline'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'Raimondi/delimitMate'

  " coc.nvim
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
  Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'amiralies/coc-flow', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
  Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-stylelint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'fannheyward/coc-styled-components', {'do': 'yarn install --frozen-lockfile'}

  " Language/Syntax
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'moll/vim-node'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'rust-lang/rust.vim'
  Plug 'othree/html5.vim'
  Plug 'jparise/vim-graphql'
  Plug 'elzr/vim-json'
  Plug 'cespare/vim-toml'
  Plug 'ekalinin/Dockerfile.vim'

  " Color Schemes
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" === Plugin Config ===

" material.vim
let g:material_terminal_italics = 1
let g:material_theme_style = 'default-community'

" lightline
" Options include: ['material_vim', 'dracula']
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

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx-pretty
let g:vim_jsx_pretty_highlight_close_tag = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" rust.vim
let g:rustfmt_autosave = 1

" ack.vim
let g:ackprg = 'ag --vimgrep --hidden --ignore .git'

" fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:fzf_colors = {
  \ 'bg+': ['bg', 'CursorLine'],
  \ 'hl': ['fg', 'Function'],
  \ 'hl+': ['fg', 'Function'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'prompt': ['fg', 'Statement'],
  \ 'info': ['fg', 'Comment'],
  \ 'marker': ['fg', 'Statement'],
  \ 'gutter': ['bg', 'CursorLine'],
  \ 'border':  ['bg', 'ColorColumn'],
\ }

" === General settings ===

set encoding=utf-8

" Keyboard/Mouse
set backspace=indent,eol,start
set mouse=a " Enable mouse in terminal Vim
if !has('nvim')
  set ttymouse=xterm2 " Set codes being sent by mouse
endif

" Use OS's clipboard
" https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
set clipboard^=unnamed,unnamedplus

" Visuals
if has('termguicolors')
  set termguicolors " True colors
else
  set t_Co=256
endif

" Options include: ['material', 'dracula']
colorscheme material
set cursorline " highlight current line - disabled in Vim for performance reasons

" Numbers
set number
set relativenumber

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

" Remove trailing whitespace
function! RemoveTrailingWhitespace()
  if (s:isremovingwhitespace == 1)
    let l = line('.')
    let c = col('.')
    %s/\s\+$//e
    call cursor(l, c)
  endif
endfun

autocmd BufWritePre * call RemoveTrailingWhitespace()

" Disable numbers in Neovim terminal buffers
if has('nvim')
  autocmd TermOpen * setlocal nonumber norelativenumber
endif

" === Key mappings ===

let mapleader=';'
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

" Clear search highlighting
nnoremap <silent> <Leader>c :noh<CR>

" Neovim specific keybindings
if has('nvim')
  " Exit terminal mode
  tnoremap <C-[> <C-\><C-n>
endif

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" fzf.vim
map <C-p> :FZF<CR>
nnoremap <C-k> :Ag<CR>

" coc.nvim
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Toggle paste mode
set pastetoggle=<F6>

" Toggle remove trailing whitespace
let s:isremovingwhitespace = 1

function! ToggleRemoveTrailingWhitespace()
  let s:isremovingwhitespace = !s:isremovingwhitespace
  echo 'Remove trailing whitespace toggled ' . (s:isremovingwhitespace ? 'on' : 'off')
endfunc

nnoremap <Leader>tw :call ToggleRemoveTrailingWhitespace()<CR>

" Relative Number Toggle
function! NumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>tn :call NumberToggle()<CR>

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
