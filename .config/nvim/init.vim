call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

call plug#end()

let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 50

let g:airline_powerline_fonts = 1
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#coc#show_coc_status = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

colorscheme gruvbox

filetype plugin on
syntax on

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

set updatetime=300

set termguicolors

nnoremap <silent> <leader>rl :source $MYVIMRC <bar> :nohl <bar> :echo "Reloaded vim config"<CR>
nnoremap <silent> <leader>gs :GFiles?<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ef :NERDTreeFind<CR>
nnoremap <silent> <leader>or :call CocActionAsync('runCommand', 'editor.action.organizeImport') <bar> :echo "Organized imports"<CR>

nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <C-n> :nohl<CR>
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-S-p> :CocCommand<CR>

nnoremap <silent> <C-h> :bprevious<CR>
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-w> :bdelete<CR>

nnoremap <C-S-j> <C-w><C-j>
nnoremap <C-S-k> <C-w><C-k>
nnoremap <C-S-l> <C-w><C-l>
nnoremap <C-S-h> <C-w><C-h>
nnoremap <C-S-e> :NERDTreeFocus<CR>

map <C-/> <Plug>NERDCommenterToggle<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :call CocActionAsync('doHover')<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> <leader>a <Plug>(coc-codeaction-selected)
vmap <silent> <leader>a <Plug>(coc-codeaction-selected)

inoremap <silent><expr> <C-space> coc#refresh()

nnoremap <F2> <Plug>(coc-rename)

map q <Nop>

execute "luafile ~/.config/nvim/treesitter-config.lua"

autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd BufEnter *.env* :setlocal filetype=properties
