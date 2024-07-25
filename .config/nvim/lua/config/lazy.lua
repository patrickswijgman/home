require "lazy".setup {
  spec = "plugins",
  change_detection = {
    enabled = false,
  },
  ui = {
    -- Disable icons as the terminal does not use a powerline/nerd font.
    icons = {
      cmd = "",
      config = "",
      event = "",
      favorite = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "",
      loaded = " ",
      not_loaded = " ",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      list = {
        "",
        "",
        "",
        "",
      },
    },
  },
}
