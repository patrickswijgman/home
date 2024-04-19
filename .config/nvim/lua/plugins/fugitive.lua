return {
  "tpope/vim-fugitive",

  keys = {
    { "<leader>gs", vim.cmd.Git },

    -- open merge conflict diff split window for current file
    -- ]c will go to the next merge conflict
    -- [c will go to the previous merge conflict
    { "<leader>gv", function() vim.cmd "Gvdiffsplit!" end },

    -- when in a merge conflict diff split window
    { "gu",         function() vim.cmd "diffget //2" end }, -- upstream
    { "gh",         function() vim.cmd "diffget //3" end }, -- head
  }
}
