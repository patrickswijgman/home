return {
  "tpope/vim-fugitive",

  cmd = { "Git", "G" },

  keys = {
    { "<leader>gs", vim.cmd.Git },

    -- Open merge conflict diff split window for current file
    -- ]c will go to the next merge conflict
    -- [c will go to the previous merge conflict
    { "<leader>gv", function() vim.cmd.Gvdiffsplit { bang = true } end },
    { "<leader>gu", function() vim.cmd.diffget { args = { "//2" } } end },
    { "<leader>gh", function() vim.cmd.diffget { args = { "//3" } } end },
  }
}
