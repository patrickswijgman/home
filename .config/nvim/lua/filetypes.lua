-- set filetype for dotenv files, e.g. .env, .env.development, etc
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".env*",
  command = "set filetype=config"
})

-- set filetype for config files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*/mako/config", "*/swaylock/config" },
  command = "set filetype=config"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*/kanshi/config",
  command = "set filetype=swayconfig"
})
