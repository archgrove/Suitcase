" Install other plugins via Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Easymotion (move within file easily)
Plugin 'easymotion/vim-easymotion'

" Nerdtree
Plugin 'scrooloose/nerdtree'
map <Leader>t :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" Supertab (tab completion based on file)
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"

" Vim/TMux Navigator (uniform navigation between TMux and VI<)
Bundle 'christoomey/vim-tmux-navigator'

" Surround (surround text with, e.g., quotes or tags)
Plugin 'tpope/vim-surround'

" Airline (status line upgrades)
Plugin 'vim-airline/vim-airline'

" CtrlP (fuzzy file opening)
Plugin 'ctrlpvim/ctrlp.vim'

" Open CtrlP with Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Prevent CtrlP from looking in node_modules
let g:ctrlp_custom_ignore = '.*node_modules.*'

" Better Ruby support
Bundle 'vim-ruby/vim-ruby'

" Better Elixir support
Plugin 'elixir-lang/vim-elixir'

" Better Go support
Plugin 'fatih/vim-go'

call vundle#end()

syntax on
filetype plugin on
filetype indent on

" Leader to ,
let mapleader = ","

" Tabs to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2

set autoindent
set showcmd

" Remap arrow keys to avoid temptation
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>

inoremap jj <ESC>

" Smart search (lower case search terms are case-insensitive)
set ignorecase
set smartcase
" Don't leave search results highlighted after search mode is left
set nohlsearch

" Change the label highlight; red and orange are too similar for me
hi label ctermfg=2

" Split separator sucks; remove the colour and make it continuous
set fillchars+=vert:│
hi VertSplit ctermfg=White ctermbg=Black guifg=fg

" Neovim specific
if has('nvim')
  " Escape terminal with the leader then escape
  tnoremap <leader><Esc> <C-\><C-n>

  " Allow window motions from terminal splits
  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  " Auto-enter insert mode when entering a terminal buffer
  autocmd BufWinEnter,WinEnter term://* startinsert

  function TripleSplit()
    vsplit
    wincmd l
    split
    wincmd j
    terminal
  endfunction

  nmap <c-s> :call TripleSplit()<CR>
endif

" Add a visual indicate of column 80
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
