return {
  "neoclide/coc.nvim",

  enabled = false,

  branch = "release",

  build = ":CocUpdate",

  config = function()
    local opts = { silent = true }

    -- Use <c-space> to trigger completion
    vim.keymap.set("i", "<C-space>", "coc#refresh()", opts)

    -- Use `[d` and `]d` to navigate diagnostics
    -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-prev)", opts)
    vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-next)", opts)

    -- GoTo code navigation
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", opts)
    vim.keymap.set("n", "gt", "<Plug>(coc-type-definition)", opts)
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", opts)
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", opts)

    -- Use K to show documentation in preview window
    vim.keymap.set("n", "K", function()
      local cw = vim.fn.expand("<cword>")
      if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command("h " .. cw)
      elseif vim.api.nvim_eval("coc#rpc#ready()") then
        vim.fn.CocActionAsync("doHover")
      else
        vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
      end
    end
    , opts)

    ---@diagnostic disable-next-line: redefined-local
    local opts = { silent = true, nowait = true, expr = true }

    -- Remap <C-d> and <C-u> to scroll float windows/popups, similar to Telescope
    vim.keymap.set("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
    vim.keymap.set("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
    vim.keymap.set("i", "<C-d>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
    vim.keymap.set("i", "<C-u>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
    vim.keymap.set("v", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
    vim.keymap.set("v", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)

    ---@diagnostic disable-next-line: redefined-local
    local opts = { silent = true }

    -- Remap keys for apply code actions at the cursor position
    vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", opts)

    -- Symbol renaming
    vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", opts)

    -- Organize imports of the current buffer
    vim.keymap.set("n", "<leader>or", function()
      vim.fn.CocActionAsync("runCommand", "editor.action.organizeImport")
    end, opts)

    -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "CocGroup",
      command = "silent call CocActionAsync('highlight')",
      desc = "Highlight symbol under cursor on CursorHold"
    })
  end
}
