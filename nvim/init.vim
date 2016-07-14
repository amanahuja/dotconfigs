
" for python and autocomplete plugins
set nocompatible
filetype off
syntax on " vs syntax enable

" for solarized theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light  " or dark

" ~~~~~~~~~~~ Keymappings
" see also defaults in sensible

" these make working with terminal mode easier
" https://neovim.io/doc/user/nvim_terminal_emulator.html
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" ~~~~~~~~~~~ Extensions via vim-plug
" https://github.com/junegunn/vim-plug

call plug#begin()
" defaults via tpope: https://github.com/tpope/vim-sensible
Plug 'tpope/vim-sensible'

" python-mode
Plug 'klen/python-mode' 

" code completion engine for vim
" compare autocomplete : jedi and rope and YCM
Plug 'Valloric/YouCompleteMe'
" is ycm activated? requires install step
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Plug 'https://github.com/altercation/vim-colors-solarized.git'
" vim-colors-solarized
Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only'

" Sidebars
" look at others? 
Plug 'https://github.com/scrooloose/nerdtree' 

" Code Browsing
" required: sudo apt-get install exuberant-ctags 
Plug 'https://github.com/vim-scripts/taglist.vim'

" Plugins to look into: 
" http://vim.wikia.com/wiki/Use_Vim_like_an_IDE 
" TODO: vim-jinja
" TODO: ag search silver
"

call plug#end()

" ~~~~~~~~~~~~~
" after plugins load

" Python-mode settings

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" for python mode and code complete
filetype plugin indent on

" scheme and themes
colorscheme solarized
