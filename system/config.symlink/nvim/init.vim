" vim-plug
" To install
" :PlugInstall
call plug#begin(stdpath('data') . 'plugged')

"Plug 'dag/vim-fish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'as': 'dracula' }

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
let g:python3_host_prog = "/usr/local/bin/python3"
