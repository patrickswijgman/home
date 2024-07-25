return {
  "stevearc/conform.nvim",

  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
    format_on_save = {
      lsp_fallback = true
    },
  }
}
