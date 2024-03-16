local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('sainnhe/everforest')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('preservim/nerdtree')
Plug('preservim/nerdcommenter')
Plug('tpope/vim-fugitive')
Plug('neoclide/coc.nvim', { branch = 'release' })
Plug('nvim-treesitter/nvim-treesitter')
Plug('norcalli/nvim-colorizer.lua')

vim.call('plug#end')
