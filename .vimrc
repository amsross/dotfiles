let mapleader = "\<Space>"

" load all the plugins
execute pathogen#infect()

" execute all of the plugins
" so they can be overridden if necessary
runtime! plugin/default.vim

set t_ut=
set binary
set eol
set diffopt=vertical

let tmateenv=$TMATEENV
if tmateenv == "1"
  let g:seoul256_srgb = 1
endif

set background=dark
colo solarized

" enable powerline
if executable("powerline")
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
  let g:Powerline_symbols = 'fancy'
  set fillchars+=stl:\ ,stlnc:\
endif

" enable spell checking for git commits
autocmd FileType gitcommit setlocal spell

" open a cwindow for results whenever grep is run
autocmd QuickFixCmdPost *grep* cwindow

set linebreak
set nolist
let &showbreak = '↳ '
set path=.,,*
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.swp,*.un~,*/vendor/*,*/cache/*,*/node_modules/*,.git/*
set tabstop=2
set shiftwidth=2
set expandtab

let g:netrw_list_hide='.*\.swp$,.*\.un~,\.git/*'
let g:jsx_ext_required = 0
let g:github_enterprise_urls = ['https://github.comcast.com']

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-P>'
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = 'node_modules\|\.git\/\|cache\|**/bower_components'

" diff stuff
nnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>du :diffupdate<CR>

" plugin stuff
nnoremap <Leader>gfs :Gwrite<CR>
nnoremap <Leader>p :CtrlP<CR>

" buffer stuff
" close all buffers
nnoremap <Leader>bx :%bw<CR>
nnoremap <Leader>bb :buffers<CR>

" window stuff
" size changes
nnoremap <Leader>w> :5winc ><CR>
nnoremap <Leader>w< :5winc <<CR>
nnoremap <Leader>w- :5winc -<CR>
nnoremap <Leader>w+ :5winc +<CR>
nnoremap <Leader>w> :5winc ><CR>
nnoremap <Leader>w< :5winc <<CR>
nnoremap <Leader>w- :5winc -<CR>
nnoremap <Leader>w+ :5winc +<CR>
nnoremap <Leader>w <C-w>
nnoremap <Leader>w<bar> <C-w><bar>

" disable Ex mode
nnoremap Q <nop>

" no more arrow keys <gasp>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" don't copy overwritten selection when pasting
vnoremap p "_dP

" autoreload ~/.vimrc when changed
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
