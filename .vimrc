" load all the plugins
call plug#begin('~/.vim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

Plug 'haishanh/night-owl.vim'

Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-better-default'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'tpope/vim-jdaddy', { 'for': ['json', 'javascript'] }

Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'reasonml-editor/vim-reason-plus', {
      \ 'for': 'reason',
      \ 'do': 'curl -LJO https://github.com/jaredly/reason-language-server/releases/latest/download/rls-macos.zip; unzip ~/.vim/plugged/vim-reason-plus/rls-macos.zip',
      \ }

Plug 'jparise/vim-graphql', { 'for': ['javascript', 'graphql'] }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'neo4j-contrib/cypher-vim-syntax', { 'for': ['javascript', 'cypher'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

call plug#end()

"https://stackoverflow.com/questions/7000960/in-vim-why-doesnt-my-mouse-work-past-the-220th-column
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

let g:netrw_list_hide='.*\.swp$,.*\.un~,\.git/*'
let g:jsx_ext_required = 0
let g:github_enterprise_urls = ['https://github.comcast.com']

" https://github.com/liuchengxu/vim-better-default
let g:vim_better_default_persistent_undo=1
let g:vim_better_default_tabs_as_spaces=1

" fzf
set rtp+=/usr/local/opt/fzf

set binary
set eol
set diffopt=vertical

" https://github.com/airblade/vim-gitgutter#when-signs-take-a-few-seconds-to-appear
set updatetime=100

" set background=dark
colo night-owl

" enable spell checking for git commits
autocmd FileType gitcommit setlocal spell

" open a cwindow for results whenever grep is run
autocmd QuickFixCmdPost *grep* cwindow

" call GitGutter when writing to a buffer
autocmd BufWritePost * GitGutter

set conceallevel=2
set linebreak
set path=.,,*
set wildignore+=*/tmp/*,*.swp,*.un~,*/vendor/*,*/cache/*,*/node_modules/*,.git/*

let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'xml': ['xmllint'],
\ 'json': ['jq'],
\ 'sh': ['shfmt'],
\ 'javascript': ['eslint', 'standard'],
\ 'javascript.jsx': ['eslint', 'standard'],
\ }

" https://github.com/reasonml-editor/vim-reason-plus
let g:LanguageClient_serverCommands = {
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'reason': ['~/.vim/plugged/vim-reason-plus/rls-macos/reason-language-server'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ }
let g:LanguageClient_rootMarkers = {
      \ 'javascript': ['jsconfig.json'],
      \ 'javascript.jsx': ['jsconfig.json'],
      \ }

" enable autocomplete
let g:deoplete#enable_at_startup = 1

" close the autocomplete preview buffer on selection
autocmd CompleteDone * pclose

" highlight code issues
" long lines
match ErrorMsg '\%>120v.\+'
" whitespace line endings
match ErrorMsg '\s\+$'

" file explorer stuff
" at directory of current file
nnoremap <Leader>ee :Explore<CR>
" in split at directory of current file
nnoremap <Leader>es :Sexplore<CR>
" in vertical split at directory of current file
nnoremap <Leader>ev :Vexplore<CR>

" git/vim-figutive stuff
nnoremap <Leader>gfs :Gwrite<CR>

" nnoremap <Leader>fc gg=G``z.

" nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>p :Files<CR>

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
nnoremap <Leader>ll :lopen<CR>
nnoremap <Leader>lc :lclose<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprevious<CR>

" buffer stuff
" close all buffers
" nnoremap <Leader>bx :%bw<CR>
nnoremap <Leader>bb :buffers<CR>

" no more arrow keys <gasp>
noremap <Up> :GitGutterPrevHunk<CR>
noremap <Down> :GitGutterNextHunk<CR>
noremap <Left> :ALEPreviousWrap<CR>
noremap <Right> :ALENextWrap<CR>

nmap <silent> <C-k> :GitGutterPrevHunk<CR>
nmap <silent> <C-j> :GitGutterNextHunk<CR>
nmap <silent> <C-h> :ALEPreviousWrap<CR>
nmap <silent> <C-l> :ALEPreviousWrap<CR>

" disable Ex mode
noremap Q <NOP>

" don't copy overwritten selection when pasting
vnoremap p "_dP

" dedupe selected range
command -range Dedupe <line1>,<line2>g/^\(.*\)$\n\1/d

au BufRead,BufNewFile Dockerfile* setfiletype Dockerfile
au BufRead,BufNewFile *\.json\.[0-9]\\\{4\}-[0-9]\\\{2\}-[0-9]\\\{2\}T[0-9]\\\{2\}:[0-9]\\\{2\}:[0-9]\\\{2\}\.[0-9]\\\{3\}Z setfiletype json
au BufRead,BufNewFile *\.xml\.[0-9]\\\{4\}-[0-9]\\\{2\}-[0-9]\\\{2\}T[0-9]\\\{2\}:[0-9]\\\{2\}:[0-9]\\\{2\}\.[0-9]\\\{3\}Z setfiletype xml

function LC_maps()
  if has_key(g:LanguageClient_serverCommands, &filetype)
    " set omnifunc=LanguageClient#complete
    set completefunc=LanguageClient#complete
    set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    let g:LanguageClient_diagnosticsList="Location"
    nnoremap <Leader>fr :call LanguageClient_textDocument_references()<CR>
    vnoremap <Leader>fr :call LanguageClient_textDocument_references()<CR>
    nnoremap <Leader>fc :call LanguageClient_textDocument_formatting()<CR>
    nnoremap <Leader>fh :call LanguageClient_textDocument_hover()<CR>
    vnoremap <Leader>fh :call LanguageClient_textDocument_hover()<CR>
    nnoremap <Leader>fp :call popup_clear()<CR>:pc<CR>
    vnoremap <Leader>fp :call popup_clear()<CR>:pc<CR>
    nnoremap <Leader>fe :call LanguageClient#explainErrorAtPoint()<CR>
    vnoremap <Leader>fe :call LanguageClient#explainErrorAtPoint()<CR>
    nnoremap <Leader>fd :call LanguageClient_textDocument_definition()<CR>
    vnoremap <Leader>fd :call LanguageClient_textDocument_definition()<CR>
  endif
endfunction

autocmd FileType * call LC_maps()

" augroup markdown
"   autocmd!
"   autocmd FileType markdown set spell
" augroup END

augroup quickfix
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END

augroup json
  autocmd!
  autocmd FileType json nnoremap <Leader>fc :ALEFix<CR>
augroup END

augroup xml
  autocmd!
  autocmd FileType xml nnoremap <Leader>fc :ALEFix<CR>
augroup END

augroup javascript
  autocmd!
  autocmd FileType javascript nnoremap <Leader>fc :ALEFix<CR>
  autocmd FileType javascript.jsx nnoremap <Leader>fc :ALEFix<CR>
augroup END

augroup rust
  autocmd!
  autocmd FileType rust let g:autofmt_autosave = 1
  autocmd FileType rust nnoremap <Leader>fc :RustFmt<CR>
augroup END

augroup reasonml
  autocmd!
  autocmd FileType reason set runtimepath+=~/.vim/bundle/LanguageClient-neovim
augroup END

" autoreload ~/.vimrc when changed
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" allow cevim-better-default settings to be overridden
runtime! plugin/default.vim

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
hi Pmenu ctermfg=0 ctermbg=DarkGrey
hi PmenuSel ctermfg=0 ctermbg=230
