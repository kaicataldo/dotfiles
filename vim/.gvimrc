" Font
set guifont=Hack:h12
set macthinstrokes " Render font with thin strokes

" Colors
colorscheme nova

" Airline
let g:airline_theme = 'nova'

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
