return {
  "nvim-telescope/telescope.nvim",

  branch = "0.1.x",

  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    { "<C-p>",      require "telescope.builtin".find_files },
    { "<C-b>",      require "telescope.builtin".buffers },
    { "<C-f>",      require "telescope.builtin".live_grep },
    { "<C-g>",      require "telescope.builtin".grep_string },
    { "<C-t>",      require "telescope.builtin".lsp_workspace_symbols },
    { "gd",         require "telescope.builtin".lsp_definitions },
    { "gt",         require "telescope.builtin".lsp_type_definitions },
    { "gr",         require "telescope.builtin".lsp_references },
    { "gi",         require "telescope.builtin".lsp_implementations },
    { "go",         require "telescope.builtin".lsp_document_symbols },
    { "ge",         require "telescope.builtin".diagnostics },
    { "<leader>vh", require "telescope.builtin".help_tags },
    { "<leader>sp", require "telescope.builtin".spell_suggest },
  },

  opts = {
    defaults = {
      -- configure to use ripgrep when searching with grep_string or live_grep
      vimgrep_arguments = {
        "rg",
        "--follow",        -- Follow symbolic links
        "--hidden",        -- Search for hidden files
        "--color=never",   -- Don't use colors, Telescope can't interpret them
        "--no-heading",    -- Don't group matches by each file
        "--with-filename", -- Print the file path with the matched lines
        "--line-number",   -- Show line numbers
        "--column",        -- Show column numbers
        "--smart-case",    -- Smart case search

        -- Exclude some patterns from search
        "--glob=!**/.git/*",
        "--glob=!**/.idea/*",
        "--glob=!**/.vscode/*",
        "--glob=!**/build/*",
        "--glob=!**/dist/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
      },
      mappings = {
        i = {
          ["<esc>"] = require "telescope.actions".close,
          ["<C-down>"] = require "telescope.actions".cycle_history_next,
          ["<C-up>"] = require "telescope.actions".cycle_history_prev,
        },
      },
    },
    pickers = {
      find_files = {
        -- configure to use ripgrep when searching for a file
        find_command = {
          "rg",
          "--files",       -- List all files
          "--hidden",      -- Search for hidden files
          "--sort=path",   -- Ascending sort by path
          "--color=never", -- Don't use colors, Telescope can't interpret them
          "--smart-case",  -- Smart case search

          -- Exclude some patterns from search
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
        },
      },
    },
  }
}
