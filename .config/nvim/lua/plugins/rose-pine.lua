return {
  "rose-pine/neovim",

  name = "rose-pine",

  opts = {
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
      migrations = true,         -- Handle deprecated options automatically
    },

    styles = {
      bold = true,
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

    highlight_groups = {
      ["@type"] = { bold = true }
    },
  },

  init = function()
    vim.o.background = "light"
    vim.cmd.colorscheme "rose-pine"
  end
}

-- return {
-- "AlexvZyl/nordic.nvim",

-- lazy = false,
-- priority = 1000,

-- opts = {
--   -- This callback can be used to override the colors used in the palette.
--   on_palette = function(palette) return palette end,
--   -- Enable bold keywords.
--   bold_keywords = false,
--   -- Enable italic comments.
--   italic_comments = true,
--   -- Enable general editor background transparency.
--   transparent_bg = false,
--   -- Enable brighter float border.
--   bright_border = false,
--   -- Reduce the overall amount of blue in the theme (diverges from base Nord).
--   reduced_blue = true,
--   -- Swap the dark background with the normal one.
--   swap_backgrounds = true,
--   -- Override the styling of any highlight group.
--   override = {
--     Delimiter = { italic = false },
--   },
--   -- Cursorline options. Also includes visual/selection.
--   cursorline = {
--     -- Bold font in cursorline.
--     bold = false,
--     -- Bold cursorline number.
--     bold_number = true,
--     -- Available styles: 'dark', 'light'.
--     theme = "light",
--     -- Blending the cursorline bg with the buffer bg.
--     blend = 0.85,
--   },
--   telescope = {
--     -- Available styles: `classic`, `flat`.
--     style = "classic",
--   },
-- },

-- init = function()
--   vim.cmd.colorscheme "nordic"
-- end
-- }
