return {
  "preservim/nerdtree",

  init = function()
    vim.g.NERDTreeShowHidden = true
    vim.g.NERDTreeWinSize = 50
    vim.g.NERDTreeCascadeSingleChildDir = false
    vim.g.NERDTreeMinimalUI = true
    vim.g.NERDTreeAutoDeleteBuffer = true
  end,

  config = function()
    vim.keymap.set("n", "<C-e>", vim.cmd.NERDTreeFind)
    vim.keymap.set("n", "<leader>e", vim.cmd.NERDTreeToggle)
  end
}
