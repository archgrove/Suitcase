" Install other plugins via Pathogen
call pathogen#infect()

" Syntax highlighting, plugins and indentation on!
syntax on
filetype plugin on
filetype indent on

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
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
