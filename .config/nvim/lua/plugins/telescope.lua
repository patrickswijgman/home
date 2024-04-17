return {
  "nvim-telescope/telescope.nvim",

  branch = "0.1.x",

  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local actions = require "telescope.actions"

    require "telescope".setup {
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
            ["<esc>"] = actions.close,
            ["<C-down>"] = actions.cycle_history_next,
            ["<C-up>"] = actions.cycle_history_prev,
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

    local builtin = require "telescope.builtin"

    -- Files and searching
    vim.keymap.set("n", "<C-p>", builtin.find_files)
    vim.keymap.set("n", "<C-b>", builtin.buffers)
    vim.keymap.set("n", "<C-g>", builtin.grep_string)
    vim.keymap.set("n", "<C-f>", builtin.live_grep)

    -- LSP
    vim.keymap.set("n", "gd", builtin.lsp_definitions)
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
    vim.keymap.set("n", "gr", builtin.lsp_references)
    vim.keymap.set("n", "gi", builtin.lsp_implementations)
    vim.keymap.set("n", "go", builtin.lsp_document_symbols)
    vim.keymap.set("n", "gy", builtin.lsp_workspace_symbols)
    vim.keymap.set("n", "ge", builtin.diagnostics)

    -- Git
    vim.keymap.set("n", "<leader>gc", builtin.git_bcommits)
    vim.keymap.set("n", "<leader>gC", builtin.git_commits)
    vim.keymap.set("n", "<leader>gb", builtin.git_branches)
    vim.keymap.set("n", "<leader>gS", builtin.git_status)
    vim.keymap.set("n", "<leader>gt", builtin.git_stash)

    -- Other
    vim.keymap.set("n", "<leader>vh", builtin.help_tags)
    vim.keymap.set("n", "<leader>sp", builtin.spell_suggest)
    vim.keymap.set("n", "<leader>km", builtin.keymaps)
  end
}
