call plug#begin()

Plug 'sainnhe/everforest'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
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

nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<bar>:nohl<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>ef :NERDTreeFind<CR>
nnoremap <leader>cc <Plug>NERDCommenterToggle<CR>
vnoremap <leader>cc <Plug>NERDCommenterToggle<CR>

nnoremap <leader>or :call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <leader>a  <Plug>(coc-codeaction-selected)
vnoremap <leader>a  <Plug>(coc-codeaction-selected)
nnoremap <leader>ac <Plug>(coc-codeaction-cursor)
nnoremap <leader>as <Plug>(coc-codeaction-source)
nnoremap <leader>qf <Plug>(coc-fix-current)
nnoremap <leader>re <Plug>(coc-codeaction-refactor)
nnoremap <leader>r  <Plug>(coc-codeaction-refactor-selected)
vnoremap <leader>r  <Plug>(coc-codeaction-refactor-selected)
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap gd <Plug>(coc-definition)
nnoremap gy <Plug>(coc-type-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-references)
nnoremap gh :call CocActionAsync('doHover')<CR>
nnoremap [g <Plug>(coc-diagnostic-prev)
nnoremap ]g <Plug>(coc-diagnostic-next)

inoremap <expr> <C-space> coc#refresh()

nnoremap <C-n> :nohl<CR>

map q <Nop>

execute "luafile ~/.config/nvim/treesitter-config.lua"

autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd BufEnter *.env* :setlocal filetype=properties
