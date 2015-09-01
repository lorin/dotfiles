" :PlugInstall to install
call plug#begin('~/.vim/plugged')
" plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'quanganhdo/grb256'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'guns/vim-clojure-static'
Plug 'csexton/trailertrash.vim'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-commentary'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'xingchaoet/TLAPlus'
Plug 'digitaltoad/vim-jade'
Plug 'derekwyatt/vim-scala'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()


" configs
syntax on
colorscheme grb256

"
" sets
"


" Don't need vi compatibility
set nocompatible

set encoding=utf-8

" word wrap
set textwidth=80
" disabled for now
"set formatoptions+=ta
set formatoptions-=t


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

" Code folding
set foldmethod=syntax
set nofoldenable
" Set a high fold level so it doesn't fold by default
set foldlevel=10

"
" File type fun
"


" .ftl is html
au BufRead,BufNewFile *.ftl set filetype=html

" fold by indent in html
autocmd BufNewFile,BufReadPost *.ftl setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.html setl foldmethod=indent nofoldenable


"
" lets
"

let mapleader = " "

" airline
let g:airline_powerline_fonts = 1
" show tabline at the top
let g:airline#extensions#tabline#enabled = 1

let &t_te="\<Esc>]50;CursorShape=2\x7"

" ctrlp: don't descend into build directory
let g:ctrlp_custom_ignore = {
   \ 'dir': '\v[\/]build$',
   \ }

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

" toggle relative numbers
nnoremap <leader>n :set relativenumber! relativenumber?<CR>
nnoremap <C-n> :set relativenumber! relativenumber?<CR>

" Jump to ctag
nnoremap <leader>. :CtrlPTag<cr>
"
" commands (?)
"

com! Vimrc tabnew | e ~/.nvimrc
com! Zshrc tabnew | e ~/.zshrc

" jsonlint
" npm install jsonlint -g
com! JSON %!jsonlint

"
" abbrevations
"

cabbrev vimrc Vimrc
cabbrev nvimrc Vimrc
cabbrev Tr TrailerTrim
cabbrev ag Ag

