return {
  "neoclide/coc.nvim",

  branch = "release",

  build = ":CocUpdate",

  config = function()
    local opts = { silent = true }

    vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", opts)
    vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", opts)
    vim.keymap.set("n", "<leader>or", function()
      vim.fn.CocActionAsync("runCommand", "editor.action.organizeImport")
    end, opts)
    vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-prev)", opts)
    vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-next)", opts)
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", opts)
    vim.keymap.set("n", "gt", "<Plug>(coc-type-definition)", opts)
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", opts)
    vim.keymap.set("n", "gh", function()
      vim.fn.CocActionAsync("doHover")
    end, opts)

    ---@diagnostic disable-next-line: redefined-local
    local opts = { silent = true, nowait = true, expr = true }

    vim.keymap.set("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
    vim.keymap.set("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
    vim.keymap.set("i", "<C-d>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
    vim.keymap.set("i", "<C-u>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
    vim.keymap.set("v", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
    vim.keymap.set("v", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
    vim.keymap.set("i", "<C-space>", "coc#refresh()", opts)
  end
}
