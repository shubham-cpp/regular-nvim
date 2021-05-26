# regular-nvim
Neovim configs for regular neovim instead of nightly builds

## Installation
```bash
# First Cloning vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Then clone this repo
git clone https://github.com/shubham-cpp/regular-nvim.git

# Start nvim
nvim +PlugInstall
```
## Highlights

- [fzf.vim](https://github.com/junegunn/fzf.vim) : Make navigation with vim lighting fast
- [coc.nvim](https://github.com/neoclide/coc.nvim) : Autocompletion/Lsp for vim. **Note:** nodejs is a hard dependency
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) : Better Syntax Highlighting for almost all languages
- [lightline](https://github.com/itchyny/lightline.vim) : Provides a minimalistic and highly configurable statusline for (n)vim
- [auto-pairs](https://github.com/jiangmiao/auto-pairs) : Autocomplete brackets,quotes,etc
- [vim-commentary](https://github.com/tpope/vim-commentary) : Probably best Commenting plugin cause configuring is one-liner
- [vim-autoformat](https://github.com/Chiel92/vim-autoformat) : Formatting plugin with , relatively, ease to add custom formatters
- [vim-surround](https://github.com/tpope/vim-surround) : Easily Surround words,lines using vim motions
- [vim-subversive](https://github.com/svermeulen/vim-subversive) : Will changed the way you copy-paste in vim
- [challenger-deep-theme](https://github.com/challenger-deep-theme/vim) : Beautiful Colorscheme
