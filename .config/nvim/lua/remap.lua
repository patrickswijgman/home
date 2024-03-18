local telescope = require('telescope.builtin')

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-q>", "<C-w>q")

-- Telescope
vim.keymap.set("n", "<C-p>", function() telescope.find_files({ hidden = true }) end)
vim.keymap.set("n", "<C-f>", function() telescope.live_grep({ hidden = true }) end)
vim.keymap.set("n", "<C-g>", function() telescope.grep_string({ hidden = true }) end)
vim.keymap.set("n", "<C-b>", function() telescope.buffers() end)

-- Conquer of Completion
vim.keymap.set("n", "<leader>ca", '<Plug>(coc-codeaction-cursor)')
vim.keymap.set("n", "<leader>rn", '<Plug>(coc-rename)')
vim.keymap.set("n", "<leader>or", function() vim.fn.CocActionAsync('runCommand', 'editor.action.organizeImport') end, { silent = true })
vim.keymap.set("i", "<leader>ac", 'coc#refresh()', { expr = true })
vim.keymap.set("n", "[g", '<Plug>(coc-diagnostic-prev)')
vim.keymap.set("n", "]g", '<Plug>(coc-diagnostic-next)')
vim.keymap.set("n", "gd", '<Plug>(coc-definition)')
vim.keymap.set("n", "gr", '<Plug>(coc-references)')
vim.keymap.set("n", "gh", function() vim.fn.CocActionAsync('doHover') end, { silent = true })

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- NERDTree
vim.keymap.set("n", "<C-e>", vim.cmd.NERDTreeFind)
vim.keymap.set("n", "<leader>e", vim.cmd.NERDTreeExplore)

-- disabled
vim.keymap.set("n", "q", "<Nop>");
