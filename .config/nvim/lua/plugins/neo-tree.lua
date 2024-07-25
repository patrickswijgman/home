return {
  "nvim-neo-tree/neo-tree.nvim",

  branch = "v3.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },

  lazy = false,

  keys = {
    { "<C-e>", vim.cmd.Neotree },
  },

  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    enable_git_status = false,
    enable_diagnostics = false,
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    default_component_configs = {
      container = {
        enable_character_fade = true
      },
      indent = {
        indent_size = 4,
        with_markers = false,
        with_expanders = false, -- if nil and file nesting is enabled, will enable expanders
      },
      icon = {
        folder_closed = "-",
        folder_open = ">",
        folder_empty = " ",
        default = "",
      },
      modified = {
        symbol = "[+]",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "", -- this can only be used in the git_status source
          renamed   = "", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      },
      -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
      file_size = {
        enabled = true,
        required_width = 64, -- min width of window required to show this column
      },
      type = {
        enabled = true,
        required_width = 122, -- min width of window required to show this column
      },
      last_modified = {
        enabled = true,
        required_width = 88, -- min width of window required to show this column
      },
      created = {
        enabled = true,
        required_width = 110, -- min width of window required to show this column
      },
      symlink_target = {
        enabled = false,
      },
    },
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          ".git",
          "node_modules",
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        always_show_by_pattern = { -- uses glob style patterns
          --".env*",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
      follow_current_file = {
        enabled = false,                      -- This will find and focus the file in the active buffer every time
        leave_dirs_open = false,              -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
      group_empty_dirs = false,               -- when true, empty folders will be grouped together
      hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree
      use_libuv_file_watcher = false,         -- This will use the OS level file watchers to detect changes instead of relying on nvim autocmd events.
      window = {
        position = "current",
      },
    },
  },

  init = function()
    -- disable netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end
}
