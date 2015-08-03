execute pathogen#infect()
syntax enable
set t_ut=
set background=dark
colorscheme solarized

au BufNewFile,BufRead *.ejs set filetype=jst
" enable spell checking for git commits
autocmd FileType gitcommit setlocal spell

" close vim if only nerdtree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

filetype plugin indent on
set nowrap
set showbreak=↪
set autoindent
set backspace=indent,eol,start
set path=.,,*
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/cache/*,*/node_modules/*,.git/*
set tabstop=2 shiftwidth=2 expandtab

let NERDTreeShowHidden=1
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-P>'
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = 'node_modules\|.git\|cache\|bower_components'

nnoremap <f6> :tabp<return>
nnoremap <f7> :tabe 
nnoremap <f8> :tabn<return>
nnoremap te :tabe<space>
" disable Ex mode
nnoremap Q <nop>

map <C-n> :NERDTreeToggle<CR>

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
