local telescope = require('telescope.builtin')

vim.g.mapleader = " "

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h");
vim.keymap.set("n", "<C-j>", "<C-w>j");
vim.keymap.set("n", "<C-k>", "<C-w>k");
vim.keymap.set("n", "<C-l>", "<C-w>l");

-- Telescope
vim.keymap.set("n", "<C-p>", function() telescope.find_files({ hidden = true }) end)
vim.keymap.set("n", "<C-f>", function() telescope.live_grep({ hidden = true }) end)
vim.keymap.set("n", "<C-g>", function() telescope.grep_string({ hidden = true }) end)
vim.keymap.set("n", "<C-b>", function() telescope.buffers() end)
vim.keymap.set("n", "<C-t>", function() telescope.treesitter() end)

-- Conquer of Completion
vim.keymap.set("n", "<C-.>", '<Plug>(coc-codeaction-cursor)')
vim.keymap.set("n", "<C-S-p>", vim.cmd.CocCommand)
vim.keymap.set("n", "<F2>", '<Plug>(coc-rename)')
vim.keymap.set("n", "[g", '<Plug>(coc-diagnostic-prev)')
vim.keymap.set("n", "]g", '<Plug>(coc-diagnostic-next)')
vim.keymap.set("n", "gd", '<Plug>(coc-definition)')
vim.keymap.set("n", "gr", '<Plug>(coc-references)')
vim.keymap.set("n", "gh", function() vim.fn.CocActionAsync('doHover') end)
vim.keymap.set("n", "<leader>or", function() vim.fn.CocActionAsync('runCommand', 'editor.action.organizeImport') end)
vim.keymap.set("i", "<C-space>", 'coc#refresh()', { expr = true })

-- NERDTree
vim.keymap.set("n", "<C-e>", vim.cmd.NERDTreeExplore)

-- NERDCommenter
vim.keymap.set({"n", "v"}, "<C-/>", '<Plug>NERDCommenterToggle')

-- disabled
vim.keymap.set("n", "q", "<Nop>");
