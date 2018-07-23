let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" load all the plugins
execute pathogen#infect()

let g:netrw_list_hide='.*\.swp$,.*\.un~,\.git/*'
let g:jsx_ext_required = 0
let g:github_enterprise_urls = ['https://github.comcast.com']

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<C-P>'
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = 'node_modules\|\.git\/\|cache\|**/bower_components'

" https://github.com/liuchengxu/vim-better-default
let g:vim_better_default_persistent_undo=1
let g:vim_better_default_tabs_as_spaces=1

" execute all of the plugins
" so they can be overridden if necessary
runtime! plugin/default.vim

set binary
set eol
set diffopt=vertical

set background=dark
colo nord

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

" call GitGutter when writing to a buffer
autocmd BufWritePost * GitGutter

set conceallevel=2

set linebreak
set path=.,,*
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.swp,*.un~,*/vendor/*,*/cache/*,*/node_modules/*,.git/*
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" highlight code issues
" long lines
match ErrorMsg '\%>120v.\+'
" whitespace line endings
match ErrorMsg '\s\+$'

" file explorer stuff
" at directory of current file
nnoremap <Leader>ee :Ex<CR>
" in split at directory of current file
nnoremap <Leader>es :Se<CR>
" in vertical split at directory of current file
nnoremap <Leader>ev :Vex<CR>

" clojure/vim-fireplace stuff
nnoremap <Leader>fr :Require<CR>
nnoremap <Leader>fe :Eval<CR>
nnoremap <Leader>fl :Last<CR>
nnoremap <Leader>fc :Cljfmt<CR>

" diff stuff
nnoremap <Leader>dp :diffput<CR>
vnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>dg :diffget<CR>
vnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>du :diffupdate<CR>

" git/vim-figutive stuff
nnoremap <Leader>gfs :Gwrite<CR>

nnoremap <Leader>p :CtrlP<CR>

" buffer stuff
" close all buffers
nnoremap <Leader>bx :%bw<CR>
nnoremap <Leader>bb :buffers<CR>

" no more arrow keys <gasp>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" don't copy overwritten selection when pasting
vnoremap p "_dP

au BufRead,BufNewFile Dockerfile* setfiletype Dockerfile

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" autoreload ~/.vimrc when changed
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
