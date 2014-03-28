execute pathogen#infect()
syntax on
filetype plugin indent on

" Needed for airline to show
set laststatus=2
set clipboard=unnamed
colorscheme grb256
set number
" Set git gutter to same color as line number column
highlight clear SignColumn
set encoding=utf-8
set textwidth=80
let g:airline_powerline_fonts = 1

" Soft tabs of length 4
set tabstop=4
set shiftwidth=4
set expandtab
" Start nerdtree if no other files open
"autocmd vimenter * if !argc() | NERDTree | endif
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(obj-.*|doc/html)',
  \ 'file': '\v.\.(png|html)$',
  \ }

" Only do case-sensitive searches if caps in
" the search string
" otherwise, need to add \C to search string
set ignorecase
set smartcase

" Jump to definition
nnoremap <leader>. :CtrlPTag<cr>

" Copy the directory name to clipboard
noremap <leader>d :let @* = expand("%")<cr>
" Full directory
noremap <leader>D :let @* = expand("%:p")<cr>

" Highlight current line
set cursorline

" Eat trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" Don't show whitespace notices
let g:airline_detect_whitespace=0

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


" Save files before make
" http://stackoverflow.com/a/8583273/742
au QuickFixCmdPre * write

let g:SuperTabDefaultCompletionType = "context"

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Code folding
set foldmethod=syntax
set nofoldenable

" Show tabline at the top
let g:airline#extensions#tabline#enabled = 1

" Incremental search
" set incsearch

" mouse scrolling
" I turn this off so that I can select properly
" with the mouse
" set mouse=a

" split right by default
set splitright

" \p for older paste, \P for newer paste
" https://github.com/maxbrunsfeld/vim-yankstack#configuration
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Use gmake
:set makeprg=/usr/local/Cellar/make/4.0/bin/make
