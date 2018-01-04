" Font
set guifont=Operator\ Mono\ SSm\ Book:h15

" Relative numbers in normal mode
set relativenumber
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
autocmd FocusLost * set norelativenumber
autocmd FocusGained * set relativenumber

" Line space
set linespace=3

" Disable bold fonts
set t_md=

" Hide scrollbars
set guioptions-=r
set guioptions-=L

" Disable dialog popups
set guioptions+=c

" Config
set cursorline

" for lightline-bufferline
set guioptions-=e
