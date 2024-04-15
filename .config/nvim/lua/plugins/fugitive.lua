return {
  "tpope/vim-fugitive",

  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>gv", function() vim.cmd("Gvdiffsplit!") end)

    vim.keymap.set("n", "g2", function() vim.cmd("diffget //2") end)
    vim.keymap.set("n", "g3", function() vim.cmd("diffget //3") end)
  end
}
