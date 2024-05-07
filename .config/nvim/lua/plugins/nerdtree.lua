return {
  "https://github.com/preservim/nerdtree",

  init = function()
    -- This setting tells vim whether to display hidden files by default.
    vim.g.NERDTreeShowHidden = true
    -- This setting disables the 'Bookmarks' label 'Press ? for help' text
    vim.g.NERDTreeMinimalUI = true
    -- When using a context menu to delete or rename a file you may also want to delete the buffer which is no more valid.
    -- If the setting is not set you will see a confirmation if you really want to delete an old buffer
    vim.g.NERDTreeAutoDeleteBuffer = true
  end,

  config = function()
    local function get_current_path()
      local bufnr = vim.fn.bufnr "%"
      if bufnr ~= 0 then
        -- If a file is open in the buffer, return its directory path
        return vim.fn.expand "%:p:h"
      else
        -- If no file is open in the buffer, return the current working directory
        return vim.fn.getcwd()
      end
    end

    vim.keymap.set("n", "<C-e>", function() vim.cmd.NERDTreeExplore { args = { get_current_path() } } end)
  end
}
