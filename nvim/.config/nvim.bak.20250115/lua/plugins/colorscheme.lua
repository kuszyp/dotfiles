return {

  --[[
  -- https://github.com/catppuccin/nvim
  --]]
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      --flavour = "macchiato", -- frappe, macchiato, mocha, latte
      flavour = "macchiato", -- frappe, macchiato, mocha, latte
      --transparent_background = true,
      transparent_background = false,
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },

  --{
  --  "catppuccin",
  --  opts = {
  --    integrations = { blink_cmp = true },
  --  },
  --},

  --[[
  -- Colorscheme | LazyVim
  --]]
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
