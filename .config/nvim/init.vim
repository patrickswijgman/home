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
nnoremap <silent> <leader>ev :split $MYVIMRC<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<bar>:nohl<bar>:echo "Sourced vim config"<CR>
nnoremap <leader>a  <Plug>(coc-codeaction-selected)
vnoremap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>ac <Plug>(coc-codeaction-cursor)
nnoremap <leader>as <Plug>(coc-codeaction-source)
nnoremap <leader>re <Plug>(coc-codeaction-refactor)
nnoremap <leader>r  <Plug>(coc-codeaction-refactor-selected)
vnoremap <leader>r  <Plug>(coc-codeaction-refactor-selected)
nnoremap <leader>rn <Plug>(coc-rename)
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
nnoremap <silent> <C-p> :Telescope find_files<CR>
nnoremap <silent> <C-f> :Telescope live_grep<CR>
nnoremap <silent> <C-g> :Telescope grep_string<CR>
nnoremap <silent> <C-b> :Telescope buffers<CR>
nnoremap <silent> <C-s> :Telescope search_history<CR>
nnoremap <silent> <C-t> :Telescope treesitter<CR>
nnoremap <silent> <C-e> :NERDTreeFocus<CR>
nnoremap <silent> <C-y> :NERDTreeFind<CR>
nnoremap <C-/> <Plug>NERDCommenterToggle
inoremap <expr> <C-space> coc#refresh()
nnoremap <silent> <C-S-p> :CocCommand<CR>

" Other mappings
nnoremap gd <Plug>(coc-definition)
nnoremap gy <Plug>(coc-type-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-references)
nnoremap <silent> gh :call CocActionAsync('doHover')<CR>
nnoremap [g <Plug>(coc-diagnostic-prev)
nnoremap ]g <Plug>(coc-diagnostic-next)

map q <Nop>

execute "luafile ~/.config/nvim/treesitter-config.lua"

autocmd BufEnter *.env* :setlocal filetype=properties

