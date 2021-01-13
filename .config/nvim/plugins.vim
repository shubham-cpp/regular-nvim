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
Plug 'unblevable/quick-scope'

" }}}

" Themes   ------------------------ {{{

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'glepnir/oceanic-material'

" }}}

Plug 'justinmk/vim-sneak'

" Plugins that does the donkey work {{{

Plug 'svermeulen/vim-subversive'
Plug 'Chiel92/vim-autoformat'
Plug 'tommcdo/vim-lion'

" }}}

" Better Synatx Highlighting in Vim {{{
Plug 'sheerun/vim-polyglot'
" " Additional Polyglot Setting for various filetypes
Plug 'bfrg/vim-cpp-modern'
Plug 'tbastos/vim-lua'
Plug 'vim-python/python-syntax'
Plug 'pboettch/vim-cmake-syntax'
Plug 'georgewitteman/vim-fish'
Plug 'arzg/vim-sh'
Plug 'sheerun/html5.vim'
Plug 'gutenye/json5.vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'euclidianAce/BetterLua.vim'

" }}}

" Few additional IDE features that it Love {{{

Plug 'voldikss/vim-floaterm'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}

" }}}

call plug#end()
