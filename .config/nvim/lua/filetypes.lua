-- set filetype for dotenv files, e.g. .env, .env.development, etc
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = ".env*",
  command = "set filetype=conf"
})

-- set filetype for config files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*/kanshi/config", "*/mako/config", "*/swaylock/config" },
  command = "set filetype=conf"
})
