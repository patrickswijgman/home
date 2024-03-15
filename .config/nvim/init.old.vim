call plug#begin()

Plug 'sainnhe/everforest'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

call plug#end()

let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 50

let g:mapleader = "\<Space>"

colorscheme everforest

set cursorline
set cc=120
set number
set scrolloff=9999
set signcolumn=yes
set laststatus=2

set showmatch
set hlsearch
set incsearch

set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set shiftwidth=2

set clipboard=unnamedplus

set noswapfile
set nobackup
set nowritebackup

set splitright
set splitbelow

set updatetime=300

set termguicolors

" Leader key mappings
nnoremap <silent> <leader>or :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <leader>gl :Telescope git_commits<CR>
nnoremap <leader>gc :Telescope git_bcommits<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gs :Telescope git_status<CR>

" Control key mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q
nnoremap <silent> <C-n> :nohl<CR>
nnoremap <silent> <C-p> :Telescope find_files hidden=true<CR>
nnoremap <silent> <C-f> :Telescope live_grep hidden=true<CR>
nnoremap <silent> <C-g> :Telescope grep_string hidden=true<CR>
nnoremap <silent> <C-b> :Telescope buffers<CR>
nnoremap <silent> <C-s> :Telescope search_history<CR>
nnoremap <silent> <C-t> :Telescope treesitter<CR>
nnoremap <silent> <C-e> :NERDTreeFocus<CR>
nnoremap <C-/> <Plug>NERDCommenterToggle
vnoremap <C-/> <Plug>NERDCommenterToggle
nnoremap <C-.> <Plug>(coc-codeaction-cursor)
inoremap <expr> <C-space> coc#refresh()
nnoremap <silent> <C-S-p> :CocCommand<CR>
nnoremap <silent> <C-S-e> :NERDTreeFind<CR>

" Function key mappings
nnoremap <F2> <Plug>(coc-rename)

" Other mappings
nnoremap gd <Plug>(coc-definition)
nnoremap gy <Plug>(coc-type-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-references)
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>
nnoremap [g <Plug>(coc-diagnostic-prev)
nnoremap ]g <Plug>(coc-diagnostic-next)

map q <Nop>

execute "luafile ~/.config/nvim/telescope.lua"
execute "luafile ~/.config/nvim/treesitter.lua"

autocmd BufEnter *.env* :setlocal filetype=properties

