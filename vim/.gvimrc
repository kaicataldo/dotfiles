" Font
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
set macthinstrokes " Render font with thin strokes

" Colors
colorscheme hybrid_material

" Airline
let g:airline_theme='hybrid'

" Relative numbers in normal mode
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Line space
set linespace=4

" Disable bold fonts
set t_md=

" Hide scrollbars
set guioptions-=r
set guioptions-=L

" Disable dialog popups
set guioptions+=c

" Config
:set cursorline
