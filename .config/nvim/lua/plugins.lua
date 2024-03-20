require("lazy").setup({
  { 'sainnhe/everforest', priority = 1000 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x' },
  { 'preservim/nerdtree', lazy = true, cmd = { "NERDTreeFind", "NERDTreeExplore" } },
  { 'tpope/vim-fugitive' },
  { 'neoclide/coc.nvim', branch = 'release' },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'NvChad/nvim-colorizer.lua' },
},
{
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      lazy = "",
    },
  },
})

vim.cmd.colorscheme('everforest');
