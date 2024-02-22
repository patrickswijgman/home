require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
})

vim.api.nvim_set_hl(0, "@type.qualifier.typescript", { link = "GruvboxRed" })
vim.api.nvim_set_hl(0, "@type.builtin.typescript", { link = "GruvboxYellow" })
vim.api.nvim_set_hl(0, "@constructor.typescript", { link = "GruvboxBoldGreen" })
vim.api.nvim_set_hl(0, "@boolean.typescript", { link = "GruvboxOrange" })
vim.api.nvim_set_hl(0, "@constant.typescript", { link = "@variable" })
vim.api.nvim_set_hl(0, "@variable.builtin.typescript", { link = "GruvboxPurple" })
