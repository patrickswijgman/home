require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all"
  ensure_installed = { 
    "lua", 
    "vim",
    "vimdoc", 
    "fish", 
    "ini",
    "json", 
    "jsonc",
    "yaml",
    "javascript", 
    "typescript", 
    "tsx", 
    "html", 
    "css", 
    "python",
    "go", 
    "rust", 
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
