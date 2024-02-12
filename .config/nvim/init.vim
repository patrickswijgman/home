call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'mattn/emmet-vim'

call plug#end()

let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 64

let g:airline_powerline_fonts = 1
let g:airline_detect_spell = 0
let g:airline_detect_spelllang = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

filetype plugin on
syntax on

set cc=120
set number
set relativenumber
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

set spell
set spelllang=en_us

set noswapfile
set nobackup
set nowritebackup

set updatetime=300

set termguicolors

colorscheme sonokai

nnoremap <silent> <leader>rl :source $MYVIMRC <bar> :nohl <bar> :echo "Reloaded vim config"<CR>
nnoremap <silent> <leader>ee :NERDTreeFocus<CR>
nnoremap <silent> <leader>ef :NERDTreeFind<CR>
nnoremap <silent> <leader>gs :GFiles?<CR>
nnoremap <silent> <leader>gl :Commits<CR>

nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-n> :nohl<CR>
nnoremap <silent> <C-h> :bprevious<CR>
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-w> :bdelete<CR>

map <leader>cc <plug>NERDCommenterToggle<CR>

nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)
nmap <silent> gh :call ShowDocumentation()<CR>

nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)

nmap <leader>rn <plug>(coc-rename)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocActionAsync('format')

command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

