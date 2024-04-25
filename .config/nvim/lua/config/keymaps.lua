-- set the <leader> key to space
vim.g.mapleader = " "

-- buffer navigation
vim.keymap.set("n", "<C-m>", vim.cmd.bnext)
vim.keymap.set("n", "<C-n>", vim.cmd.bprev)

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-q>", "<C-w>q")

-- open explorer
-- % creates a file
-- R renames a file
-- mt assign the "target directory" used by the move and copy commands
-- mf marks a file or directory. Any action that can be performed on multiple files depend on these marks
-- mc copy the marked files in the target directory
-- mm move the marked files to the target directory
-- mx runs an external command on the marked files
-- D deletes a file or an empty directory
-- d creates a directory
-- vim.keymap.set("n", "<leader>e", vim.cmd.Explore)

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
