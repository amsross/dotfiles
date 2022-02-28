" load all the plugins
call plug#begin('~/.vim/plugged')

Plug 'sainnhe/sonokai'

Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-better-default'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'branch': 'main', 'for': 'toml' }
Plug 'tpope/vim-jdaddy', { 'for': ['json', 'javascript', 'typescript'] }
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['javascript', 'typescript'] }

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'rescript-lang/vim-rescript', { 'for': 'rescript' }
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

call coc#add_extension(
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-reason',
      \ 'coc-rescript',
      \ 'coc-xml'
      \)

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

nmap <silent> <C-k> :GitGutterPrevHunk<CR>
nmap <silent> <C-j> :GitGutterNextHunk<CR>

" disable Ex mode
noremap Q <NOP>

" don't copy overwritten selection when pasting
vnoremap p "_dP

" dedupe selected range
command -range Dedupe <line1>,<line2>g/^\(.*\)$\n\1/d

au BufRead,BufNewFile Dockerfile* setfiletype Dockerfile
au BufRead,BufNewFile *\.json\.[0-9]\\\{4\}-[0-9]\\\{2\}-[0-9]\\\{2\}T[0-9]\\\{2\}:[0-9]\\\{2\}:[0-9]\\\{2\}\.[0-9]\\\{3\}Z setfiletype json
au BufRead,BufNewFile *\.xml\.[0-9]\\\{4\}-[0-9]\\\{2\}-[0-9]\\\{2\}T[0-9]\\\{2\}:[0-9]\\\{2\}:[0-9]\\\{2\}\.[0-9]\\\{3\}Z setfiletype xml

augroup rust
  autocmd!
  autocmd FileType rust let g:autofmt_autosave = 1
  autocmd FileType rust nnoremap <Leader>fc :RustFmt<CR> :update<CR>
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

" set background=dark
colo sonokai

" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
hi Pmenu ctermfg=0 ctermbg=DarkGrey
hi PmenuSel ctermfg=0 ctermbg=230
