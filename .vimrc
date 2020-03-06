" load all the plugins
call plug#begin('~/.vim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'liuchengxu/vim-better-default'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'reasonml-editor/vim-reason-plus', { 'for': 'reason' }

Plug 'jparise/vim-graphql', { 'for': ['javascript', 'graphql'] }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'neo4j-contrib/cypher-vim-syntax', { 'for': ['javascript', 'cypher'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

call plug#end()

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

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

" fzf
set rtp+=/usr/local/opt/fzf

set binary
set eol
set diffopt=vertical

set background=dark
colo slate

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

" https://github.com/reasonml-editor/vim-reason-plus
let g:LanguageClient_serverCommands = {
      \ 'reason': ['~/reason-language-server/reason-language-server.exe'],
      \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1

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

" diff stuff
nnoremap <Leader>dp :diffput<CR>
vnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>dg :diffget<CR>
vnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>du :diffupdate<CR>

" git/vim-figutive stuff
nnoremap <Leader>gfs :Gwrite<CR>

nnoremap <Leader>fc gg=G``z.

nnoremap <Leader>p :CtrlP<CR>

" next error
nnoremap ]e :cn<CR>
nnoremap <Leader>cn :cn<CR>
" previous error
nnoremap [e :cp<CR>
nnoremap <Leader>cp :cp<CR>
" open quickfix window
nnoremap <Leader>cw :cw<CR>
" close quickfix window
nnoremap <Leader>cc :cclose<CR>

" location list movement
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprevious<CR>

" buffer stuff
" close all buffers
nnoremap <Leader>bx :%bw<CR>
nnoremap <Leader>bb :buffers<CR>

" no more arrow keys <gasp>
noremap <Up> :GitGutterPrevHunk<CR>
noremap <Down> :GitGutterNextHunk<CR>
noremap <Left> :bprevious<CR>
noremap <Right> :bnext<CR>

" disable Ex mode
noremap Q <NOP>

" don't copy overwritten selection when pasting
vnoremap p "_dP

au BufRead,BufNewFile Dockerfile* setfiletype Dockerfile

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
  " clojure/vim-fireplace stuff
  autocmd FileType clojure nnoremap <Leader>ft :RunTests<CR>
  " nnoremap <Leader>ft :call fireplace#session_eval('(clojure.test/run-tests (symbol (str (clojure.string/replace (ns-name *ns*) #"-test$" "") "-test")))')<CR>
  autocmd FileType clojure nnoremap <Leader>fr :Require<CR>
  autocmd FileType clojure nnoremap <Leader>fe :Eval<CR>
  autocmd FileType clojure vnoremap <Leader>fe :Eval<CR>
  autocmd FileType clojure nnoremap <Leader>fl :Last<CR>
  autocmd FileType clojure nnoremap <Leader>fc :Cljfmt<CR>
augroup END

augroup markdown
  autocmd!
  autocmd FileType markdown set spell
augroup END

augroup reason_ml
  autocmd!
  autocmd FileType reason let g:ctrlp_custom_ignore = $ctrlp_custom_ignore . 'lib/[jb]s'
  autocmd FileType reason set runtimepath+=~/.vim/bundle/LanguageClient-neovim
augroup END

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    set completefunc=LanguageClient#complete
    set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    let g:LanguageClient_diagnosticsList="Quickfix"
    let g:LanguageClient_selectionUI="fzf"
    nnoremap <Leader>fr :call LanguageClient_textDocument_references()<CR>
    nnoremap <Leader>fc :call LanguageClient_textDocument_formatting()<CR>
    nnoremap <Leader>fh :call LanguageClient_textDocument_hover()<CR>
    vnoremap <Leader>fh :call LanguageClient_textDocument_hover()<CR>
    nnoremap <Leader>fp :pc<CR>
    vnoremap <Leader>fp :pc<CR>
    nnoremap <Leader>fd :call LanguageClient_textDocument_definition()<CR>
    vnoremap <Leader>fd :call LanguageClient_textDocument_definition()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()

" autoreload ~/.vimrc when changed
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
