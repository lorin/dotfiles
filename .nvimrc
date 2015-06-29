" :PlugInstall to install
call plug#begin('~/.vim/plugged')
" plugins
Plug 'tpope/vim-surround'
Plug 'quanganhdo/grb256'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'guns/vim-clojure-static'
Plug 'csexton/trailertrash.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-commentary'

call plug#end()


" configs
syntax on
colorscheme grb256

"
" sets
"


" Don't need vi compatibility
set nocompatible

" Highlight current line
set cursorline

" mouse scrolling
set mouse=a

" Use system clipboard
set clipboard=unnamed

" line numbering
set number

" Needed for airline to show
set laststatus=2

"
" tabs
"
" insert 4 spaces when hiting tab
set expandtab
set tabstop=4
" number of spaces four indent
set shiftwidth=4

" allow switching buffers with unsaved file
set hidden


"
" lets
"

let mapleader = ","

" airline
let g:airline_powerline_fonts = 1
" show tabline at the top
let g:airline#extensions#tabline#enabled = 1

let &t_te="\<Esc>]50;CursorShape=2\x7"

" Recommended by https://github.com/guns/vim-clojure-static
filetype plugin indent on
"
" remaps
"


" Copy the directory name to clipboard
noremap <leader>d :let @+ = expand("%")<cr>
" Full directory
noremap <leader>D :let @+ = expand("%:p")<cr>

" Cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>


"
" commands (?)
"

com! Vimrc tabnew | e ~/.nvimrc
com! Zshrc tabnew | e ~/.zshrc

"
" abbrevations
"

" I prefer :vimrc to Vimrc
cabbrev vimrc Vimrc
cabbrev nvimrc Vimrc
cabbrev Tr TrailerTrim

