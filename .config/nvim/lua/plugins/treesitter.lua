return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  main = "nvim-treesitter.configs",
  opts = {
    -- A list of parser names, or "all"
    ensure_installed = "all",

    highlight = {
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
}
