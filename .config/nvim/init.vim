call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme gruvbox

" Use system clipboard for yanking and pasting
set clipboard=unnamedplus

" Indent settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap

" Search settings (don't highlight and do incremental search)
set nohlsearch
set incsearch

" Always show at least n lines above and below the cursor
set scrolloff=8

" Make sure the proper colors are used
set termguicolors

" Show line numbers
set nu

" Swap file (backup) settings
set updatetime=50
set noswapfile
set nobackup

" Show a ruler at 80 characters
set colorcolumn=80

" Keybindings
map q <Nop>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg<CR>
