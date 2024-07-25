-- set the <leader> key to space
vim.g.mapleader = " "

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-q>", "<C-w>q")

-- yank and paste using system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- disabled keybindings
vim.keymap.set("n", "q", "<Nop>");
vim.keymap.set("n", "Q", "<Nop>");
