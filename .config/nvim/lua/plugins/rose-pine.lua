return {
  "rose-pine/neovim",

  name = "rose-pine",

  lazy = false,
  priority = 1000,

  opts = {
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = true,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
      migrations = true,         -- Handle deprecated options automatically
    },

    styles = {
      bold = false,
      italic = false,
      transparency = false,
    },

    groups = {
      border = "muted",
      link = "iris",
      panel = "surface",

      error = "love",
      hint = "iris",
      info = "foam",
      note = "pine",
      todo = "rose",
      warn = "gold",

      git_add = "foam",
      git_change = "rose",
      git_delete = "love",
      git_dirty = "rose",
      git_ignore = "muted",
      git_merge = "iris",
      git_rename = "pine",
      git_stage = "iris",
      git_text = "rose",
      git_untracked = "subtle",

      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    },

    -- https://rosepinetheme.com/palette/ingredients/
    highlight_groups = {
      ["Comment"] = { fg = "muted" },
      ["@type"] = { fg = "pine" },
      ["@type.builtin"] = { fg = "pine" },
      ["@constant"] = { fg = "subtle" },
      ["@constant.builtin"] = { fg = "subtle" },
      ["@function.method.call"] = { fg = "rose" },
      ["@variable.parameter"] = { fg = "text" },
    },
  },

  init = function()
    vim.o.background = "light"
    vim.cmd.colorscheme "rose-pine"
  end
}
