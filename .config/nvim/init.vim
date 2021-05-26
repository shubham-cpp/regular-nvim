source ~/.config/nvim/plugins.vim

" Basic Setting ----------------- {{{
let g:mapleader=" "
set nu rnu
set mouse=a
set clipboard+=unnamedplus
set laststatus=2
set iskeyword+=-
set formatoptions=tqj
set history=500
filetype plugin indent on
set wildignorecase
set wildmode=longest,list,full
set wildignore='*.out,*.o,*.pyc,*~,*.class,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/venv/*,*/__pycache__/*'
set ignorecase
set smartcase
set tagcase=followscs
set lazyredraw
set showmatch
set undofile
" set whichwrap='b,s,<, >,[,]'
set timeoutlen=500
set noerrorbells
set novisualbell
set foldcolumn=1
set expandtab
set shiftwidth=4
set tabstop=4
set colorcolumn=80
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set scrolloff=8
set cursorline
set textwidth=80
set splitbelow
set splitright
set smartindent
set tags+=./.git/tags
let g:session_directory=stdpath('data') . '/session'
let g:session_autoload="no"
let g:session_autosave="no"
let g:session_command_aliases=1
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
command! -nargs=0 Reload :source ~/.config/nvim/init.vim
let g:neoterm_autoscroll=1
set inccommand=split
let g:formatdef_my_lua='"lua-format"'
let g:formatters_lua = ['my_lua']

" }}}

" Theming -------------------- {{{
set showtabline=2
set noshowmode
set termguicolors

colorscheme challenger_deep

" }}}

" Autocommands ------------------- {{{

augroup Highlight_Yank " {{{
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=100}
    autocmd FileType vim set foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <silent> <F5> :so %<cr>
    au FileType vim,tex let b:autoformat_autoindent=0
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    au TermOpen term://* startinsert
augroup end " }}}

augroup Dynamic_Smartcase " {{{
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup end "}}}

" For Filehandling {{{
augroup File_Reloads
    autocmd!
    autocmd BufWritePost Xresources,Xdefaults !xrdb -load -merge %
    autocmd BufEnter *profile :set filetype=sh
    autocmd BufEnter lfrc :set filetype=fish
    autocmd BufEnter vifmrc :set filetype=vim
    " Automatically deletes all trailing whitespace and newlines at end of file on save.
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritepre * %s/\n\+\%$//e
    " au FocusGained,BufEnter * checktime
augroup end " }}}

augroup Comments " {{{
    autocmd!
    autocmd FileType apache,sxhkdrc setlocal commentstring=#\ %s
    autocmd FileType htmldjango setlocal commentstring=<!--%s-->
    autocmd BufEnter Xresources setlocal commentstring=!\ %s
    autocmd BufEnter template setlocal commentstring=#\ %s
augroup end " }}}

augroup Plugin_Confs "{{{
    autocmd!
    au FileType vim,json let g:argwrap_line_prefix = '\'
    au FileType lua let g:argwrap_line_prefix = ' '
    au BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup end "}}}

" }}}

" Key bindings ----------------- {{{

nnoremap ,w :w!<cr>
inoremap jk <esc>
nnoremap <leader>ct :!ctags -R --tag-relative --extras=+f --exclude=.git,pkg --languages=-sql<cr><cr>
map <silent> <Esc> :noh<cr>
map 0 ^

" Move a line of text using ALT+[jk] --------- {{{
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <M-Down> mz:m+<cr>`z
nmap <M-Up> mz:m-2<cr>`z
vmap <M-Down> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-Up> :m'<-2<cr>`>my`<mzgv`yo`z
" }}}

" Handling the spelling inside vim ----------------{{{
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}

" Copy the Line from the cursor to end of line just like D
nnoremap Y y$
nnoremap <Leader>yp "ayy"ap

" Using the function of D (of normal mode) in insert mode {{{

inoremap <C-Del> <C-\><C-O>D
inoremap <C-D> <C-\><C-O>dw
inoremap <C-u> <C-\><C-O>d0
inoremap <C-k> <C-\><C-O>d$
inoremap <C-z> <C-\><C-O>u
inoremap <C-a> <C-\><C-O>^
inoremap <C-e> <C-\><C-O>$
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" }}}

vmap > >gv
vmap < <gv

nnoremap <F3> :Autoformat<cr>
nnoremap <leader>/ :Commentary<CR>
xnoremap <leader>/ :Commentary<CR>
nnoremap <M-/> "ayy"aP:Commentary<cr>j

" For handling Search and replace
nnoremap <silent> ,s :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> ,s "sy:let @/=@s<CR>cgn
" Remember to remove after uninstalling coc
nnoremap <M-e> :CocCommand explorer<CR>

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <S-Left>   :tabp<cr>
nnoremap <S-Right>  :tabn<cr>
map <leader>cd <cmd>cd %:p:h<cr>:pwd<cr>
nnoremap <leader>v v$
"To resize vertical splits
nnoremap <silent> <M-=> :exe "vertical resize +10"<CR>
nnoremap <silent> <M--> :exe "vertical resize -10"<CR>
nnoremap <Leader>e      :edit <C-r>=expand("%:p:h")<cr>/
nnoremap <Leader>te     :tabedit <C-r>=expand("%:p:h")<cr>/
nnoremap <Leader>tv     :vnew <C-r>=expand("%:p:h")<cr>/
nnoremap <silent> ,a :ArgWrap<CR>

" }}}

" Plugins setting --------------- {{{

" Quick Scope ---------------- {{{
let g:qs_highlight_on_keys=[ 'f', 'F', 't', 'T' ]
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
" }}}

" Fzf ---------------------- {{{
let g:fzf_action={'alt-enter':'tab split','ctrl-x':'split','ctrl-v':'vsplit'}
nnoremap <silent> <C-p> <cmd>Files<cr>
nmap \\ <cmd>BLines<cr>
nmap ?? <cmd>Rg <Space><cr>
if executable('rg')
    set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
endif
let g:fzf_history_dir="~/.local/share/fzf-history"
let g:fzf_tags_command="ctags -R --tag-relative --extras=+f --exclude=.git,pkg,nodemodules,venv --languages=-sql<cr><cr>"
command! -bang Nvim call fzf#vim#files(stdpath('config'), fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)
" }}}

" Subversive setting {{{

nmap x <plug>(SubversiveSubstitute)
nmap xx <plug>(SubversiveSubstituteLine)
nmap X <plug>(SubversiveSubstituteToEndOfLine)
" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>
" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>

" }}}

" Sneak ---------------------- {{{

let g:sneak#label=1
let g:sneak#use_ic_scs=1
let g:sneak#s_next=1
map <silent> gS <Plug>Sneak_,
map <silent> gs <Plug>Sneak_,;
" Change the colors
" highlight Sneakguifg=blackguibg=#00C7DF ctermfg=black ctermbg=cyan
" highlight SneakScopeguifg=redguibg=yellow ctermfg=red ctermbg=yellow
" }}}

" FloatTerm --------------- {{{
let g:floaterm_keymap_toggle='<F1>'
let g:floaterm_keymap_next='<Leader>ff'
let g:floaterm_keymap_prev='<Leader>fp'
let g:floaterm_keymap_new='<Leader>fn'
let g:floaterm_keymap_kill='<Leader>fk'
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.7
let g:floaterm_height=0.7
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_autohide=1

if executable('lf')
    command! FMFloatermNew lf
    nmap <Leader>fl :FM<CR>
endif

" }}}

" Lightline {{{

hi! Folded guifg=white guibg=#100e23
hi! ColorColumn guibg=#313131

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }
" }}}

" }}}

" Source Aditional Files -------- {{{
source ~/.config/nvim/mcoc.vim

" }}}
