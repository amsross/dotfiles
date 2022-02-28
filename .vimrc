" load all the plugins
call plug#begin('~/.vim/plugged')

Plug 'sainnhe/sonokai'

Plug 'airblade/vim-gitgutter'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" https://github.com/junegunn/fzf.vim#example-rg-command-with-preview-window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

set binary
set eol
set diffopt=vertical

" https://github.com/airblade/vim-gitgutter#when-signs-take-a-few-seconds-to-appear
set updatetime=100

" enable spell checking for git commits
autocmd FileType gitcommit setlocal spell

" open a cwindow for results whenever grep is run
autocmd QuickFixCmdPost *grep* cwindow

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
nnoremap <Leader>r :RG<CR>

" location list movement
nnoremap <Leader>ll :lopen<CR>
nnoremap <Leader>lc :lclose<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprevious<CR>

" buffer stuff
" close all buffers
" nnoremap <Leader>bx :%bw<CR>
nnoremap <Leader>bb :buffers<CR>

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

autocmd FileType xml nnoremap <Leader>fc <Plug>(coc-format)
autocmd FileType xml vnoremap <Leader>fc <Plug>(coc-format)
autocmd FileType rescript nnoremap <Leader>fc :RescriptFormat<CR>
autocmd FileType rescript vnoremap <Leader>fc :RescriptFormat<CR>

" allow cevim-better-default settings to be overridden
runtime! plugin/default.vim

set shiftwidth=2
set tabstop=2
set softtabstop=2
set norelativenumber
set number

" set background=dark
colo sonokai

" " https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
" hi Pmenu ctermfg=Black ctermbg=DarkGrey ctermul=Yellow
" hi PmenuSel ctermfg=Blue ctermbg=LightGrey ctermul=Yellow
" hi PmenuSbar ctermfg=Red ctermbg=Red ctermul=Red
" hi PmenuThumb ctermfg=Red ctermbg=Red ctermul=Red

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <C-h> <Plug>(coc-diagnostic-prev)
nmap <C-l> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> <Leader>fh :call <SID>show_documentation()<CR>
vnoremap <silent> <Leader>fh :call <SID>show_documentation()<CR>
nmap <Leader>fd <Plug>(coc-definition)
nmap <Leader>ft <Plug>(coc-type-definition)
nmap <Leader>fi <Plug>(coc-implementation)
nmap <Leader>fr <Plug>(coc-references)
nnoremap <Leader>fc <Plug>(coc-format)
vnoremap <Leader>fc <Plug>(coc-format)

augroup formatters
  autocmd!
	autocmd FileType javascript.jsx nnoremap <silent> <Leader>fc :call CocAction('runCommand', 'eslint.executeAutofix')<CR>
	autocmd FileType javascript.jsx vnoremap <silent> <Leader>fc :call CocAction('runCommand', 'eslint.executeAutofix')<CR>
	autocmd FileType typescript nnoremap <silent> <Leader>fc :call CocAction('runCommand', 'eslint.executeAutofix')<CR>
	autocmd FileType typescript vnoremap <silent> <Leader>fc :call CocAction('runCommand', 'eslint.executeAutofix')<CR>
	autocmd FileType json nnoremap <silent> <Leader>fc :Format<CR>
	autocmd FileType json vnoremap <silent> <Leader>fc :Format<CR>
augroup END


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,javascript.jsx,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline=%<%f\ %h%m%r\ %{coc#status()}%{get(b:,'coc_current_function','')}%=%-14.(%l,%c%V%)\ %P
" set statusline=%<%f\ %h%m%r\ %{coc#status()}%{get(b:,'coc_diagnostic_info',{})}%=%-14.(%l,%c%V%)\ %P

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent> <Leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <Leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <Leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <Leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <Leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <Leader>cp  :<C-u>CocListResume<CR>
