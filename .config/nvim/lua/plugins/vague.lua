return {
  "vague2k/vague.nvim",

  lazy = false,
  priority = 1000,

  init = function()
    vim.cmd.colorscheme "vague"
  end,

  config = function()
    require "vague".setup {
      transparent = false, -- don't set background
      style = {
        -- "none" is the same thing as default. But "italic" and "bold" are also valid options
        comments = "italic",
        conditionals = "none",
        functions = "none",
        keywords = "none",
        headings = "bold", -- markdown headings
        operators = "none",
        keyword_return = "none",
        strings = "none",
        variables = "none",
      }
    }
  end
}
