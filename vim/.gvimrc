" Font
set guifont=Inconsolata-dz\ for\ Powerline:h12

" Colors
colorscheme hybrid_material

" Airline
let g:airline_theme='hybrid'

" Relative numbers in normal mode
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Line space
set linespace=1

" Disable bold fonts
set t_md=

" Hide scrollbars
set guioptions-=r
set guioptions-=L

" Disable dialog popups
set guioptions+=c

" Config
:set cursorline
