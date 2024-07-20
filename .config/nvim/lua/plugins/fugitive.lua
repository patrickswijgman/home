return {
  "tpope/vim-fugitive",

  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

    -- open merge conflict diff split window for current file
    -- ]c will go to the next merge conflict
    -- [c will go to the previous merge conflict
    vim.keymap.set("n", "<leader>gv", function() vim.cmd.Gvdiffsplit { bang = true } end)

    -- when in a merge conflict diff split window
    vim.keymap.set("n", "<leader>gu", function() vim.cmd.diffget { args = { "//2" } } end)
    vim.keymap.set("n", "<leader>gh", function() vim.cmd.diffget { args = { "//3" } } end)
  end
}
