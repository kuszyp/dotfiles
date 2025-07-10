return {
  --[[
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavor = "macchiato",
      transparent_background = false,
    }
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  ]]--

  {
  "rebelot/kanagawa.nvim",
    lazy = true,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave"
    }
  },
}
