return {
  "preservim/nerdtree",

  cmd = {
    "NERDTreeToggle",
    "NERDTreeFind",
  },

  keys = {
    { "<C-e>",     vim.cmd.NERDTreeFind, },
    { "<leader>e", vim.cmd.NERDTreeToggle, },
  },

  init = function()
    vim.g.NERDTreeShowHidden = true
    vim.g.NERDTreeWinSize = 50
    vim.g.NERDTreeCascadeSingleChildDir = false
    vim.g.NERDTreeMinimalUI = true
    vim.g.NERDTreeAutoDeleteBuffer = true
  end
}
