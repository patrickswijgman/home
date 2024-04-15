return {
  "github/copilot.vim",

  name = "copilot",

  config = function()
    vim.keymap.set("n", "<leader>cp", vim.cmd.Copilot)
  end
}
