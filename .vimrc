execute pathogen#infect()
syntax enable
set background=dark
colorscheme solarized

au BufNewFile,BufRead *.ejs set filetype=jst

filetype plugin indent on
set nowrap
set autoindent
set backspace=indent,eol,start
set path=.,,*
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/cache/*,*/node_modules/*

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <f6> :tabp<return>
nnoremap <f7> :tabe 
nnoremap <f8> :tabn<return>

