return {
  "AlexvZyl/nordic.nvim",

  lazy = false,
  priority = 1000,

  opts = {
    -- This callback can be used to override the colors used in the palette.
    on_palette = function(palette) return palette end,
    -- Enable bold keywords.
    bold_keywords = false,
    -- Enable italic comments.
    italic_comments = true,
    -- Enable general editor background transparency.
    transparent_bg = false,
    -- Enable brighter float border.
    bright_border = false,
    -- Reduce the overall amount of blue in the theme (diverges from base Nord).
    reduced_blue = true,
    -- Swap the dark background with the normal one.
    swap_backgrounds = true,
    -- Override the styling of any highlight group.
    override = {},
    -- Cursorline options. Also includes visual/selection.
    cursorline = {
      -- Bold font in cursorline.
      bold = false,
      -- Bold cursorline number.
      bold_number = true,
      -- Available styles: 'dark', 'light'.
      theme = "light",
      -- Blending the cursorline bg with the buffer bg.
      blend = 0.85,
    },
    telescope = {
      -- Available styles: `classic`, `flat`.
      style = "flat",
    },
  },

  init = function()
    vim.cmd.colorscheme "nordic"
  end
}
