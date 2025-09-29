return {
  --[[
  --
  -- CATPPUCCIN THEME
  --
  --]]
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

  {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.special.bufferline").get_theme()
      end
    end,
  },
  --[[ END CATPPUCCIN THEME ]]--

  --[[
  --
  -- KANAGAWA THEME
  --
  --]]
  --[[
  {
  "rebelot/kanagawa.nvim",
    lazy = true,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon"--"kanagawa-dragon" --"kanagawa-wave"
    }
  },
  ]]--
  --[[ END KANAGAWA THEME ]]--

  --[[
  --
  -- TOKYONIGHT THEME
  --
  --]]
  --[[
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
      --colorscheme = "tokyonight-storm",
      --colorscheme = "tokyonight-day",
      --colorscheme = "tokyonight-moon",
    },
  },
  --]]
  --[[ END TOKYONIGHT THEME ]]--
}
