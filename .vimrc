execute pathogen#infect()
syntax enable
set background=light
colorscheme solarized

au BufNewFile,BufRead *.ejs set filetype=jst

filetype plugin indent on
set nowrap
set autoindent
set backspace=indent,eol,start
set path=.,,*
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.swp,*/vendor/*,*/cache/*,*/node_modules/*

let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

nnoremap <f6> :tabp<return>
nnoremap <f7> :tabe 
nnoremap <f8> :tabn<return>
nnoremap te :tabe<space>
