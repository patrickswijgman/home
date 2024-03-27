local telescope = require("telescope.builtin")

-- Telescope
vim.keymap.set("n", "<C-p>", function() telescope.find_files({ hidden = true }) end)
vim.keymap.set("n", "<C-f>", function() telescope.live_grep({ hidden = true }) end)
vim.keymap.set("n", "<C-g>", function() telescope.grep_string({ hidden = true }) end)
vim.keymap.set("n", "<C-b>", function() telescope.buffers() end)

-- Conquer of Completion
local opts = { silent = true }
vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", opts)
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", opts)
vim.keymap.set("n", "<leader>or", function() vim.fn.CocActionAsync("runCommand", "editor.action.organizeImport") end, opts)
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", opts)
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", opts)
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", opts)
vim.keymap.set("n", "gt", "<Plug>(coc-type-definition)", opts)
vim.keymap.set("n", "gr", "<Plug>(coc-references)", opts)
vim.keymap.set("n", "gh", function() vim.fn.CocActionAsync("doHover") end, opts)

local opts = { silent = true, nowait = true, expr = true }
vim.keymap.set("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
vim.keymap.set("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
vim.keymap.set("i", "<C-d>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
vim.keymap.set("i", "<C-u>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
vim.keymap.set("v", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
vim.keymap.set("v", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)

vim.keymap.set("i", "<C-space>", "coc#refresh()", opts)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- NERDTree
vim.keymap.set("n", "<C-e>", vim.cmd.NERDTreeFind)
vim.keymap.set("n", "<leader>e", vim.cmd.NERDTreeToggle)

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-q>", "<C-w>q")

-- disabled
vim.keymap.set("n", "q", "<Nop>");
