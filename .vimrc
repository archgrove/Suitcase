" Install other plugins via Vundle
set nocompatible
filetype off
let mapleader = ","

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Easymotion
Plugin 'easymotion/vim-easymotion'

" Nerdtree
Plugin 'scrooloose/nerdtree'
map <Leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" Supertab
Plugin 'ervandew/supertab'

" Vim/TMux Navigator (uniform navigation between TMux and VI<)
Bundle 'christoomey/vim-tmux-navigator'

" Surround
Plugin 'tpope/vim-surround'

call vundle#end()

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

inoremap jj <ESC>

" Smart search (lower case search terms are case-insensitive)
set ignorecase
set smartcase

" Change the label highlight; red and orange are too similar for me
hi label ctermfg=2
