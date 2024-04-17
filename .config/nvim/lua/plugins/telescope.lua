return {
  "nvim-telescope/telescope.nvim",

  branch = "0.1.x",

  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local actions = require "telescope.actions"

    require "telescope".setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
      }
    }

    local builtin = require "telescope.builtin"

    -- Files and searching
    vim.keymap.set("n", "<C-e>", function() builtin.find_files { hidden = true } end)
    vim.keymap.set("n", "<C-p>", function() builtin.git_files() end)
    vim.keymap.set("n", "<C-b>", function() builtin.buffers() end)
    vim.keymap.set("n", "<C-g>", function() builtin.grep_string { hidden = true } end)

    vim.keymap.set("n", "<C-f>", function()
      vim.ui.input({ prompt = "Grep > " }, function(input)
        if input == nil then
          return
        end
        builtin.grep_string { search = input, hidden = true }
      end)
    end)

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
  end
}
