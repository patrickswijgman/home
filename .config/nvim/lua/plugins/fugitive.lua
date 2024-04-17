return {
  "tpope/vim-fugitive",

  cmd = {
    "Git",
    "Gvdiffsplit",
  },

  keys = {
    { "<leader>gs", vim.cmd.Git },
    -- ]c will go to the next merge conflict
    -- [c will go to the previous merge conflict
    { "<leader>gv", function() vim.cmd "Gvdiffsplit!" end },
    { "g2",         function() vim.cmd "diffget //2" end },
    { "g3",         function() vim.cmd "diffget //3" end },
  }
}
