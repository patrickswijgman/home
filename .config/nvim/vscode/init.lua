local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

if vim.g.vscode then
    local vscode = require('vscode')

    vim.notify = vscode.notify

    vim.keymap.set("n", "q", "<Nop>")
    vim.keymap.set("n", "<Esc>", ":nohl<CR>", { silent = true, remap = true })
    vim.keymap.set("n", "<leader>h", function() vscode.action("workbench.action.focusLeftGroup") end)
    vim.keymap.set("n", "<leader>j", function() vscode.action("workbench.action.focusBelowGroup") end)
    vim.keymap.set("n", "<leader>k", function() vscode.action("workbench.action.focusAboveGroup") end)
    vim.keymap.set("n", "<leader>l", function() vscode.action("workbench.action.focusRightGroup") end)
    vim.keymap.set("n", "<S-h>", function() vscode.action("workbench.action.previousEditorInGroup") end)
    vim.keymap.set("n", "<S-l>", function() vscode.action("workbench.action.nextEditorInGroup") end)
    vim.keymap.set("n", "cd", function() vscode.action("editor.action.rename") end)
    vim.keymap.set("n", "ga", function() vscode.action("editor.action.quickFix") end)
    vim.keymap.set("n", "gd", function() vscode.action("editor.action.revealDefinition") end)
    vim.keymap.set("n", "gr", function() vscode.action("editor.action.referenceSearch.trigger") end)
    vim.keymap.set("n", "gt", function() vscode.action("editor.action.goToTypeDefinition") end)
    vim.keymap.set("n", "]d", function() vscode.action("editor.action.marker.next") end)
    vim.keymap.set("n", "[d", function() vscode.action("editor.action.marker.prev") end)
end

require("lazy").setup({
    spec = {
        {
            "bkad/CamelCaseMotion",
            init = function()
                vim.g.camelcasemotion_key = '<leader>'
            end
        },
        {
            "tpope/vim-surround"
        }
    },
})
