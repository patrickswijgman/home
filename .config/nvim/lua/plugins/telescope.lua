return {
  "nvim-telescope/telescope.nvim",

  branch = "0.1.x",

  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          },
        },
      }
    })

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<C-p>", function() builtin.find_files({ hidden = true }) end)
    vim.keymap.set("n", "<C-b>", function() builtin.buffers() end)
    vim.keymap.set("n", "<C-f>", function()
      builtin.grep_string({ search = vim.fn.input("Grep > "), hidden = true })
    end)
  end
}
