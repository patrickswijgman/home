if vim.g.vscode then
    local vscode = require('vscode')

    vim.notify = vscode.notify

    vim.g.mapleader = " "

    vim.keymap.set("n", "q", "<Nop>")
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
