" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" To install
" :PlugInstall
call plug#begin(stdpath('data') . 'plugged')

"Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NoahTheDuke/vim-just'
Plug 'udalov/kotlin-vim'
Plug 'gberenfield/cljfold.vim'


" initialize plugin system
call plug#end()

colorscheme dracula

" One past the end
set virtualedit=onemore

let g:airline_powerline_fonts = 1

" use system clipboard
set clipboard=unnamed

" Disable python2 support
let g:loaded_python_provider = 0
let g:python3_host_prog = "/opt/homebrew/bin/python3"

" 4 space tabs
set tabstop=4


set number
