return {
  "stevearc/conform.nvim",

  config = function()
    require "conform".setup {
      -- Define your formatters
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
      -- Set up format-on-save
      format_on_save = {
        lsp_fallback = true
      },
    }
  end
}
