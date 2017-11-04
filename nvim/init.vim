" .vimrc // nvim/init.vim
"

" Notes
" use :so % or :so $MYVIMRC to reload


" for python and autocomplete plugins
set nocompatible
filetype off
syntax on " vs syntax enable

" ~~~~~~~~~~~ Extensions via vim-plug
" https://github.com/junegunn/vim-plug

call plug#begin()

" Plugins to look into:
" http://vim.wikia.com/wiki/Use_Vim_like_an_IDE
" https://github.com/Shougo/denite.nvim
" vim-jinja

" Aman cheatsheet plugin
Plug '~/dotconfigs/nvim/myhelp'

" ## General / these plugs affect everything
Plug 'tpope/vim-sensible'


" ## FILE NAV & SEARCH
"    https://www.reddit.com/r/vim/comments/wb0t5/commandt_vs_ctrlpvim_vs_fuzzyfinder_go/
"    vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
"    vinegar.vim - extends netrw; first uninstall nerdtree
"    Plug 'https://github.com/tpope/vim-vinegar'
"    fzf w/ fzf-vim. Adds fuzzy search to Ag.

" NERD Tree.
Plug 'https://github.com/scrooloose/nerdtree'

" Ag silver searcher: requires Ag to be installed on system, not maintained
Plug 'https://github.com/rking/ag.vim'


" ## NOTIFICATION AND STATUS
" vim-signify: shows diff in sign column sidebar
Plug 'mhinz/vim-signify'

" vim-airline: lean status/tabline ; may cause vim to run slow
Plug 'vim-airline/vim-airline'


" ## NAVIGATION AND MOTION
" SURROUND -- FOR PARENTS, QUOTES, ETC
Plug 'tpope/vim-surround'

" VIM-SNEAK -- S{CHAR}{CHAR}
Plug 'justinmk/vim-sneak'


" ## PERSISTENCE & SESSION MANAGEMENT
" vim-workspace: sessions + autosave + misc
Plug 'thaerkh/vim-workspace'


" ## CODING STUFF
" look into async lint checks on neovim
" compare autocomplete : jedi and rope and YCM

" Plug 'python-mode/python-mode'
Plug 'python-mode/python-mode', {'branch': 'develop'}

" YouCompleteMe - requires install step
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Code Browsing ; requires ctags and ctags file
Plug 'https://github.com/vim-scripts/taglist.vim'

" ## TESTING AND TDD
" Plug 'janko-m/vim-test'

" ## COLOR SCHEMES / THEMES

" Solarized -- don't use this.
" See original repo: http://ethanschoonover.com/solarized

" gruvbox
Plug 'morhetz/gruvbox'

" other color schemes
Plug 'raphamorim/lucario'

call plug#end()

" ~~~~~~~~~~~~~
" Plugin configurations -- run after plugins load

" reenable file type
" useful for python mode and code complete
filetype plugin indent on

" Python-mode settings

"let g:pymode_python = 'python3'

" Lint checker: ignore E731 : named lambdas [pep8]
let g:pymode_lint_ignore = "E731"

" choose b/w rope docs and pydocs
let g:pymode_doc = 0
"let g:pymode_doc_bind = 'K'
let g:pymode_rope_show_doc_bind = 'K'

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.ipynb$']

" Taglist options
let Tlist_GainFocus_On_ToggleOpen = 1


" vim-workspace options
let g:workspace_autosave_always = 0

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
colorscheme gruvbox
set background=dark

" ~~~~~~~~~~~ Keymappings
" <A-key> alt-commands | <C-key> control commands
" tnoremap: terminal mode,

" see also defaults in vim-sensible, if enabled
" See :map and :verbose nmap CMD

" makes working with terminal mode easier
" https://neovim.io/doc/user/nvim_terminal_emulator.html
" terminal mode
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
" normal mode
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" ~~~~~~~~~~commands custom #AA

" see :help :DiffOrig
command! DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_
	\ | diffthis | wincmd p | diffthis

" Leader custom mappings | see :help mapleader
" Use Space. Note: avoid conflict with tmux prefix
" if using space don't use innoremap else delays on space
let mapleader = " "
set timeoutlen=500

" CHAR | RESULT
" v    | open MYVIMRC for editing
" V    | reload MYVIMRC
nnoremap <leader>v :tabe ~/dotconfigs/nvim/myhelp/doc/myhelp.txt<CR>:vsp $MYVIMRC<CR>
nnoremap <leader>V :so $MYVIMRC<CR>
" l    | next tab
nnoremap <leader>l :tabn<CR>
" 5    | insert date (format YYYY-MM-DD DAY)
" %    | insert datetime
nnoremap <leader>5 "=strftime('%Y-%m-%d %a')<CR>P
nnoremap <leader>% "=strftime('%c')<CR>P
" p    | paste from system clipboard
" y    | yank to system clipboard
nnoremap <leader>p "+p
vnoremap <leader>y "+y
vnoremap <leader>d "+d
" F    | Toggle NERDTree
nnoremap <leader>F <Esc>:NERDTreeToggle<CR>
" T    | Toggle Taglist
nnoremap <leader>T <Esc>:TlistToggle<CR>
" C    | set alternate colorsheme setting
nnoremap <leader>C <Esc>:colo gruvbox<CR>
" =    | align current paragraph
nnoremap <leader>= =ip
" z    | toggle fold
nnoremap <leader>z za
" e    | defition for python object (use K for docs)
let g:pymode_rope_goto_definition_bind = '<leader>e'
let g:ycm_key_detailed_diagnostics = '<leader>ycm'

" ~~~~~~~~~~~~~
" Other settings and mappings

" Incremental command preview
set inccommand=split

" mods python-mode default to relative numbering
set relativenumber

set shiftwidth=4 " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4 " an hard TAB displays as 4 columns
set expandtab " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround " round indent to multiple of 'shiftwidth'
set autoindent " align the new line indent with the previous line
