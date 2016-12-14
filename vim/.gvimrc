" Font
set guifont=Hack:h12
set macthinstrokes " Render font with thin strokes

" Colors
colorscheme hybrid

" vim-hybrid
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" Airline
let g:airline_theme = 'hybrid'

" Relative numbers in normal mode
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber

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
