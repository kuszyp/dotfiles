return {
  --[[
  -- https://github.com/akinsho/bufferline.nvim
  --]]
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      if (vim.g.colors_name or ""):find("catppuccin") then
        opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
      end
    end,
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/s1n7ax/nvim-window-picker
  --
  -- This plugins prompts the user to pick a window and returns the window id of the picked window
  --]]
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },

  --[[
  --
  --]]

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
      },
    },
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/nvim-lualine/lualine.nvim
  --
  -- A blazing fast and easy to configure Neovim statusline written in Lua
  -- Default LazyVim setup left for reference
  --]]

  --  {
  --    "nvim-lualine/lualine.nvim",
  --    optional = true,
  --    event = "VeryLazy",
  --    opts = function(_, opts)
  --      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
  --    end,
  --  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/nvim-lualine/lualine.nvim
  --
  -- A blazing fast and easy to configure Neovim statusline written in Lua
  --
  -- Optional lualine integration with supermaven
  --]]
  --  {
  --    "nvim-lualine/lualine.nvim",
  --    optional = true,
  --    event = "VeryLazy",
  --    opts = function(_, opts)
  --      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("supermaven"))
  --    end,
  --  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/folke/noice.nvim
  --
  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
  --]]
  --{
  --  "folke/noice.nvim",
  --  opts = function(_, opts)
  --    vim.list_extend(opts.routes, {
  --      {
  --        filter = {
  --          event = "msg_show",
  --          any = {
  --            { find = "Starting Supermaven" },
  --            { find = "Supermaven Free Tier" },
  --          },
  --        },
  --        skip = true,
  --      },
  --    })
  --  end,
  --},
}
