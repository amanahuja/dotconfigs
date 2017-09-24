
" for python and autocomplete plugins
set nocompatible
filetype off
syntax on " vs syntax enable

" ~~~~~~~~~~~ Keymappings
" see also defaults in vim-sensible

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

" ## General / these plugs affect everything
Plug 'tpope/vim-sensible'

" ## Sidebars and status bars
Plug 'https://github.com/scrooloose/nerdtree' 
" others: 
" vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" vinegar.vim - extends netrw; first uninstall nerdtree
" Plug 'https://github.com/tpope/vim-vinegar'

" vim-signify: shows diff in sign column sidebar
Plug 'mhinz/vim-signify'

" vim-airline: lean status/tabline
" WARNING: might cause things to slow down
Plug 'vim-airline/vim-airline'

" ## Search and motion 
" Ag silver searcher: requires Ag to be installed on system
" this plugin no longer maintained
Plug 'https://github.com/rking/ag.vim'
" See instead: fzf w/ fzf-vim. Adds fuzzy search to Ag. 

" vim-sneak -- s{char}{char}
Plug 'justinmk/vim-sneak'

" ## Persistence & Session Management
" vim-workspace: sessions + autosave + misc
Plug 'thaerkh/vim-workspace'

" ## Coding stuff
" Plug 'python-mode/python-mode' 
Plug 'python-mode/python-mode', {'branch': 'develop'}
" look into async lint checks on neovim

" code completion engine for vim
" YouCompleteMe - activated? requires install step
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" compare autocomplete : jedi and rope and YCM

" Code Browsing
" required: sudo apt-get install exuberant-ctags 
Plug 'https://github.com/vim-scripts/taglist.vim'

" Testing and TDD
" Plug 'janko-m/vim-test'

" ~~ color schemes / Themes ~~

" Solarized
" See original repo: http://ethanschoonover.com/solarized
Plug 'https://github.com/altercation/vim-colors-solarized.git'
" Plug 'https://github.com/frankier/neovim-colors-solarized-truecolor-only'

" gruvbox
Plug 'morhetz/gruvbox'

" other color schemes
Plug 'raphamorim/lucario'

" Plugins to look into: 
" http://vim.wikia.com/wiki/Use_Vim_like_an_IDE 
" https://github.com/Shougo/denite.nvim
" TODO: vim-jinja

call plug#end()

" ~~~~~~~~~~~~~
" Plugin configurations -- run after plugins load

" Python-mode settings

" Lint checker
" E731 : named lambdas [pep8]
let g:pymode_lint_ignore = "E731"
"let g:pymode_python = 'python3'

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" reenable file type
" for python mode and code complete
filetype plugin indent on

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.ipynb$']

" ~~~~~~~~~~~~~
" scheme and themes configuration

" solarized options
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let g:solarized_termcolors=256
"set termguicolors
"set background=light  " or dark
"set t_co=16
"colorscheme solarized

" gruvbox options
" set termguicolors
" let g:gruvbox_italic=1
" colorscheme gruvbox

" ~~~~~~~~~~~~~
" Other settings and mappings

" Incremental command preview
set inccommand=split

