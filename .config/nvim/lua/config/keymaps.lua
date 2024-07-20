-- set the <leader> key to space
vim.g.mapleader = " "

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-q>", "<C-w>q")

-- paste without losing the register
vim.keymap.set({ "n", "v" }, "<leader>p", [["_dP]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete without putting it in the register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- disabled keybindings
vim.keymap.set("n", "q", "<Nop>");
vim.keymap.set("n", "Q", "<Nop>");
