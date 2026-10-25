return {
  -- 1. install the theme
  {
    "nickkadutskyi/jb.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- 2. tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "jb",
    },
  },
}
