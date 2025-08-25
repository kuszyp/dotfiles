return {

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavor = "macchiato",
      transparent_background = false,
    }
  },

  --[[
  -- Remove this after installing new daily build version of LazyVim
  -- https://github.com/LazyVim/LazyVim/issues/6355
  --]]
  {
		"catppuccin/nvim",
		opts = function(_, opts)
			local module = require("catppuccin.groups.integrations.bufferline")
			if module then
				module.get = module.get_theme
			end
			return opts
		end,
	},

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

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

}
