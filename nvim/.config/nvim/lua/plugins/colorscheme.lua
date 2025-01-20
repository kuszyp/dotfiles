return {
  -- Shorteded Github Url
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato",
    transparent_background = false,
  },
  config = function()
    vim.cmd.colorscheme "catppuccin-macchiato"
  end
}
