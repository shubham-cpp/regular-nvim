call plug#begin(stdpath('data') . '/plugged')

" Adds fuzzy finding in nvim ----------------- {{{

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'

" }}}

" Autocompletion and other good stuff ---------- {{{

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" }}}

" Icons Statusline and Colors {{{

Plug 'kyazdani42/nvim-web-devicons'
Plug 'itchyny/lightline.vim'

" }}}

" Commenting Plugin, Making words,lines,etc wrap around brackets,quotes,etc better {{{

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'FooSoft/vim-argwrap'

" }}}

" Themes   ------------------------ {{{

" Plug 'glepnir/oceanic-material'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" }}}

" Motions {{{

Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'

" }}}

" Plugins that does the donkey work {{{

Plug 'svermeulen/vim-subversive'
Plug 'Chiel92/vim-autoformat'
Plug 'tommcdo/vim-lion'

" }}}

" Better Synatx Highlighting in Vim {{{
Plug 'sheerun/vim-polyglot'
Plug 'euclidianAce/BetterLua.vim'

" }}}

" Few additional IDE features that it Love {{{

Plug 'voldikss/vim-floaterm'

" }}}

call plug#end()
