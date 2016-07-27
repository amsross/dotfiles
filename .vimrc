execute pathogen#infect()
syntax enable
set t_ut=
set clipboard=unnamed
set mouse=nvr
set number
set relativenumber
set binary
set eol
set foldmethod=indent
set foldlevelstart=99
" keep 5 lines between the cursor and the bottom
set scrolloff=5
set diffopt=vertical

let tmateenv=$TMATEENV
if tmateenv == "1"
  set background=dark
  colorscheme delek
else
  set background=dark
  colorscheme solarized
endif

" enable powerline
if executable("powerline")
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
  let g:Powerline_symbols = 'fancy'
  set encoding=utf-8
  set laststatus=2
  set t_Co=256
  set fillchars+=stl:\ ,stlnc:\
  set term=xterm-256color
  set termencoding=utf-8
endif

" enable jst syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=jst

" enable spell checking for git commits
autocmd FileType gitcommit setlocal spell

" open a cwindow for results whenever grep is run
autocmd QuickFixCmdPost *grep* cwindow

filetype plugin indent on
set nowrap
let &showbreak = '↳ '
set autoindent
set backspace=indent,eol,start
set path=.,,*
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/cache/*,*/node_modules/*,.git/*
set tabstop=2
set shiftwidth=2
set expandtab

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-P>'
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = 'node_modules\|.git\|cache\|bower_components'

" window size changes
nnoremap <C-w>> :15winc ><CR>
nnoremap <C-w>< :15winc <<CR>
nnoremap <C-w>- :15winc -<CR>
nnoremap <C-w>+ :15winc +<CR>

nnoremap te :tabe<space>
" disable Ex mode
nnoremap Q <nop>

" no more arrow keys <gasp>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" comment/uncomment
noremap <Leader>i :normal 0i// <CR>
noremap <Leader>u :normal 03x<CR>

" autoreload ~/.vimrc when changed
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" persistent undo
" http://amix.dk/blog/post/19548
if version >= 703
	set undodir=~/.vim/undodir
	set undofile
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
