let g:pathogen_disabled = []

" Disable a bunch of plugins to figure out what's going on
"call add(g:pathogen_disabled, 'trailertrash.vim')
"call add(g:pathogen_disabled, 'vim-yankstack')
" call add(g:pathogen_disabled, 'riv.vim')
call add(g:pathogen_disabled, 'python-mode')

execute pathogen#infect()
syntax on
filetype plugin indent on

" Workaround for Ruby slowness with syntax highlighting
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1

" Don't need vi compatibility
set nocompatible

"Write the old file out when switching between files.
set autowrite

" File types
" .rabl is ruby
au BufNewFile,BufRead *.rabl setlocal ft=ruby

" 2 tabs for html, ruby, and coffeescript
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype r setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype tla setlocal ts=2 sts=2 sw=2

" fold by indent in cofeescript
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" fold by indent in python
autocmd BufNewFile,BufReadPost *.py setl foldmethod=indent nofoldenable

" fold by indent in yml
autocmd BufNewFile,BufReadPost *.yml setl foldmethod=indent nofoldenable

" Don't autocomment .vimrc or .zshrc
autocmd FileType vim setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType zsh setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" .json is json
au BufRead,BufNewFile *.json set filetype=json
" Show quotes in json content
let g:vim_json_syntax_conceal = 0

" .yml is ansible
au BufRead,BufNewFile *.yml set filetype=ansible

" Templates for new file
au BufNewFile *.py 0r ~/.vim/py.skel
au BufNewFile *.html 0r ~/.vim/html.skel

" Handle tabs properly in makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

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
let g:airline#extensions#hunks#enabled=0

" Open tagbar on the left
let g:tagbar_left = 1

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

let mapleader = ","

" fold with space
nnoremap <space> za
vnoremap <space> zf

" Jump to definition
nnoremap <leader>. :CtrlPTag<cr>
" Copy the directory name to clipboard
noremap <leader>d :let @+ = expand("%")<cr>
" Full directory
noremap <leader>D :let @+ = expand("%:p")<cr>

" Close the buffer without losing the split
nmap <leader>b :Bclose<CR>

" Cycle through buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" open the current file
noremap <leader>o :!open %<cr>

map ,, <C-^>

" Highlight current line
set cursorline


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
" Comment out for now, since it breaks Ag
" au QuickFixCmdPre * write

let g:SuperTabDefaultCompletionType = "context"

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Code folding
set foldmethod=syntax
set nofoldenable
" Set a high fold level so it doesn't fold by default
set foldlevel=10

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

" I prefer :ag to :Ag
cabbrev ag Ag

" I prefer :rake to Rake
cabbrev rake Rake

" I prefer :vimrc to Vimrc
cabbrev vimrc Vimrc

cabbrev Tr TrailerTrim
cabbrev Trim TrailerTrim

" JSONlint
com! JSON %!jsonlint

com! Vimrc tabnew | e ~/.vimrc
com! Zshrc tabnew | e ~/.zshrc

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" mustache abbreviations
" https://github.com/mustache/vim-mustache-handlebars

let g:mustache_abbreviations = 1

" test current file with rspec
map ,t :wa\|:!./bin/rspec --fail-fast %<cr>
map ,T :wa\|:execute ":!./bin/rspec " . expand('%') . ":" . line('.')<CR>

" Don't auto-fold in RST files
let g:riv_fold_auto_update = 0

" Zap search highlights on C-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l)

" Don't auto-start instant markdown
let g:instant_markdown_autostart = 0

" From Damien Conway
" https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc

"====[ Show when lines extend past column 80 "]================================>-<=====================

" highlight ColorColumn ctermbg=magenta

" function! MarkMargin (on)
"     if exists('b:MarkMargin')
"         try
"             call matchdelete(b:MarkMargin)
"         catch /./
"         endtry
"         unlet b:MarkMargin
"     endif
"     if a:on
"         let b:MarkMargin = matchadd('ColorColumn', '\%82v', 100)
"     endif
" endfunction

" augroup MarkMargin
"     autocmd!
"     autocmd  BufEnter  *       :call MarkMargin(1)
"     autocmd  BufEnter  *.vp*   :call MarkMargin(0)
" augroup END
