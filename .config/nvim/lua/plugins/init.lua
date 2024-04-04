return {
  { "sainnhe/everforest",              priority = 1000 },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim",   branch = "0.1.x" },
  { "preservim/nerdtree",              lazy = true,        cmd = { 'NERDTreeFind', 'NERDTreeToggle' } },
  { "tpope/vim-fugitive",              lazy = true,        cmd = { 'Git', 'G' } },
  { "neoclide/coc.nvim",               branch = "release" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "NvChad/nvim-colorizer.lua" },
}
