" .vimrc // nvim/init.vim >>> echo $VIM
" >>> echo $MYVIMRC
" >>> echo $XDG_CONFIG_HOME

" Notes
" use :so % or :so $MYVIMRC to reload

" for python and autocomplete plugins
set nocompatible
filetype off
syntax on " vs syntax enable

" set python 
" disable python 2 support or set it. 
" let g:python_host_prog = '/usr/bin/python2'
let g:loaded_python_provider = 0
let g:python3_host_prog = '/home/aman/anaconda3/bin/python'

" Vim Plug {{{

call plug#begin()

" Plugins to look into:
"     List of plugins (general):
"         https://github.com/mhinz/vim-galore/blob/master/PLUGINS.md
"     http://vim.wikia.com/wiki/Use_Vim_like_an_IDE
"     vim-jinja
"     fzf, commmand T, ctrlp, fzf-vim, ag+fzf, others
"     reddit.com/r/vim/comments/wb0t5/commandt_vs_ctrlpvim_vs_fuzzyfinder_go/
"     nerdtree, netrw, vinegar

" Aman cheatsheet plugin -- see <leader>+v
Plug '~/dotconfigs/nvim/myhelp'
Plug 'tpope/vim-sensible'
Plug 'thaerkh/vim-workspace'
" see also which-key as cheat

" ## NAVIGATION AND SIDEBARS
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree'
" Plug 'mileszs/ack.vim'

" ## NOTIFICATION AND STATUS
" Note: Powerline replaced by airline. Lightline is simpler still
"Plug 'mhinz/vim-signify'
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'chentoast/marks.nvim'

" ## CODING STUFF
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'honza/vim-snippets'  " common snippets library, no engine
Plug 'tpope/vim-fugitive'  " git integration, along with coc-git and signify
" Plug 'puremourning/vimspector'   " Graphical debugging
" Plug 'liuchengxu/vista.vim'      " code navigation and ctags
" Plug 'SirVer/ultisnips' " snippets engine, not sure if this is needed
" Treesitter is not currently activated, see https://github.com/nvim-treesitter/nvim-treesitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
" See also "LSP" section below. 

" ## Integration with Obsidian
" Add vimwiki, configure it and set some markdown options
" See notes in Obsidian to set this up proporly, not done yet.
" also using coc-markdownlint
" Plug 'vimwiki/vimwiki'

" ## COLOR SCHEMES / THEMES
" gruvbox, lucario. Don't use solarized
Plug 'morhetz/gruvbox'
Plug 'raphamorim/lucario'

" ## non essential accessories
Plug 'mhinz/vim-startify'
Plug 'danilamihailov/beacon.nvim'

Plug 'liuchengxu/vim-which-key'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Disabled plugins;
" Python mode conflicts with ale?
"   taglist needs research, ctags
"   Plug 'python-mode/python-mode', {'branch': 'develop'}
"   Plug 'janko-m/vim-test'
"   Plug 'https://github.com/vim-scripts/taglist.vim' replaced by Vista

" I   ... ntellisense and LSP -- linting and code completion
"   LSP is now the best option (2023) -- see https://github.com/python-lsp/python-lsp-server
"   ... 
"   Compare autocomplete: coc.nvim, deoplete+jedi-python, ncm2, YCM
"   Deoplete good option if no LSP. YCM and ALE strong but replaced by Coc
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } --> if no LSP
"   Plug 'deoplete-plugins/deoplete-jedi'  code completion with deoplete
"   Plug 'w0rp/ale' replaced by Coc for linting

" Syntax highlighting
"   Plug 'davidhalter/jedi-vim  -- Jedi to be replaced by coC.nvim
"   Plug 'numirias/semshi', {'do': 'UpdateRemotePlugins'}

call plug#end()
" }}}

" Plugin Configurations {{{
" also remember to check :CocConfig for coc
source $HOME/.config/nvim/plug-config/coc.vim

source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/plug-config/beacon.vim
source $HOME/.config/nvim/plug-config/vista.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/snippets.vim
source $HOME/.config/nvim/plug-config/which-key.vim

" experimental -- lua plugin configs
" lua require('testlua')
lua require('marks-setup')

" inactive
" source $HOME/.config/nvim/plug-config/vimwiki.vim
" source $HOME/.config/nvim/plug-config/workspace.vim
" source $HOME/.config/nvim/plug-config/w0rp-ale.vim
" source $HOME/.config/nvim/plug-config/pymode.vim
" source $HOME/.config/nvim/plug-config/deoplete.vim
" source $HOME/.config/nvim/plug-config/ack.vim
" source $HOME/.config/nvim/plug-config/nerdtree.vim
" source $HOME/.config/nvim/plug-config/airline.vim
" }}}

" Scheme and theme {{{

" ~~~~~~~~~~~~~
" scheme and themes configuration

" gruvbox options
" set termguicolors
" let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

" }}}

" Custom Keymappings {{{

" <A-key> alt-commands | <C-key> control commands
" tnoremap: terminal mode,

" see also defaults in vim-sensible, if enabled
" See :map and :verbose nmap CMD

" use alt-nav {h,j,k,l} to nav windows
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

" }}}

" Custom commands #AA {{{

" see :help :DiffOrig
command! DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_
	\ | diffthis | wincmd p | diffthis

" }}}

function! JumpDailyNote()
  let fname = strftime("%Y-%m-%d") . ".md"
  exe ":e /home/aman/notes/monolith/daily/" . fname
endfunction

nmap <leader>t :call JumpDailyNote()<CR>


" Leader custom mappings {{{
" See :help mapleader | Use Space.
" Note: avoid conflict with tmux prefix
let mapleader = " "

" if using space don't use innoremap else delays on space
set timeoutlen=500

" CHAR | RESULT
" v    | open MYVIMRC for editing
nnoremap <leader>v :tabe $MYVIMRC<CR>
" V    | reload MYVIMRC
"nnoremap <leader>v :tabe ~/dotconfigs/nvim/myhelp/doc/myhelp.txt<CR>:vsp $MYVIMRC<CR>
nnoremap <leader>V :so $MYVIMRC<CR>
" l    | next tab, alternate file, buffer list
nnoremap <leader>l :tabn<CR>
nnoremap <leader>B <C-^>
nnoremap <leader>b :Buffer<CR>
" 5    | insert date (format YYYY-MM-DD DAY)
nnoremap <leader>5 "=strftime('%Y-%m-%d %a')<CR>P
" %    | insert datetime
nnoremap <leader>% "=strftime('%c')<CR>P
" G    | Search with Rg
nnoremap <silent><leader>g <Esc>:Rg<CR>
nnoremap <silent><leader>G <Esc>:Ag<CR>
" f   | NERDTreeToggle
nnoremap <silent><leader>f <Esc>:NERDTreeToggle<CR>
" F   | Search Files with Fzf
nnoremap <silent><leader>F <Esc>:Files<CR>
" =    | align current paragraph
nnoremap <leader>= =ip
" z    | toggle fold
nnoremap <leader>z za
" []\  | nav for loclist, useful for ale lint nav
nnoremap <leader>[ :lprevious<CR>
nnoremap <leader>] :lnext<CR>
nnoremap <leader>\ :lopen<CR>
" {} | nav for arglist, useful for fzf -> arglist
nnoremap <leader>{ :previous<CR>
nnoremap <leader>} :wnext<CR>

"old
" T    | Toggle Taglist
" disabled nnoremap <leader>T <Esc>:TlistToggle<CR>
" p    | paste from system clipboard
" y    | yank to system clipboard
"nnoremap <leader>p "+p
"vnoremap <leader>y "+y
"vnoremap <leader>d "+d
" ycm  |
" let g:ycm_key_detailed_diagnostics = '<leader>ycm'
" e    | defition for python object (use K for docs)
" override by coc explorer let g:pymode_rope_goto_definition_bind = '<leader>e'
" d for vsp gd (go to definition)
" disabled see coc config for <leader> gd
" nnoremap <leader>d :only<bar>vsplit<CR>gd
" C    | set alternate colorsheme setting
" nnoremap <leader>C <Esc>:colo gruvbox<CR>

" }}}

" Other settings and mappings {{{
"
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" May not be relevant after vim 7
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" For buffer unsaved changes
set hidden

" to allow case insensitive search when string is lowercase
set ignorecase
set smartcase

" Incremental command preview
set inccommand=split

" default to relative numbering
" set relativenumber
set number

" clipboard
set clipboard+=unnamedplus

" mods python-mode 
" moved these to ~/.config/vim/after/

set nowrap
" }}}

"" " v i m :foldmethod=marker:foldlevel=0
set foldmethod=marker
set foldlevel=0

" Notes on runtimepath -- order of search for runtimefiles
" see :help $VIMRUNTIME 
"
" 1. user home .vim
" 3. $VIMRUNTIME
" 5. user home "after" folder: 
" 
"
" Global marks -- stored in the ShaDa file 
" V - this file
"
