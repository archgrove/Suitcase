" Tabs to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2

set autoindent
set showcmd

" Remap arrow keys to avoid temptation
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Latex-Suite configuration bits
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'


