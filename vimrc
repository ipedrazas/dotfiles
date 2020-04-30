syntax enable
syntax on

set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber 
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Show the filename in the window titlebar
set title
" Always show status line
set laststatus=2

" Autoclose [, {, "
imap [ []<left>
imap {<cr> {<cr>}<esc>O


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

call plug#end()

set termguicolors
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

