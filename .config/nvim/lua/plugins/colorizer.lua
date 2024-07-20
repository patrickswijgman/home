return {
  "NvChad/nvim-colorizer.lua",

  config = function()
    require "colorizer".setup {
      filetypes = { "typescript", "javascript", "css", "html", "config", "swayconfig", "dosini" },

      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = false,       -- "Name" codes like Blue or blue
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        AARRGGBB = false,    -- 0xAARRGGBB hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        mode = "background", -- Set the display mode.
        tailwind = true,     -- Enable tailwind colors
        always_update = false
      },
    }
  end
}
