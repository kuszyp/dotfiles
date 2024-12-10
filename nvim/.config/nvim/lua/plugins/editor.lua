return {
  --[[
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  --
  -- Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you, 
  -- including sidebars, floating windows, netrw split style, or all of them at once!
  --]]
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  --[[
  -- https://github.com/folke/todo-comments.nvim
  --
  -- todo-comments is a lua plugin for Neovim >= 0.8.0 to highlight and search for todo comments like TODO, HACK, 
  -- BUG in your code base
  --]]
  {
    "folke/todo-comments.nvim",
    optional = true,
    -- stylua: ignore
    keys = {
      { "<leader>st", function() require("todo-comments.fzf").todo() end, desc = "Todo" },
      { "<leader>sT", function () require("todo-comments.fzf").todo({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
  },

  --[[
  -- https://github.com/folke/trouble.nvim
  --
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you 
  -- solve all the trouble your code is causing.
  --]]
  {
    "folke/trouble.nvim",
    optional = true,
    keys = {
      { "<leader>cs", false },
    },
  },

  --[[
  -- https://github.com/nvim-lualine/lualine.nvim
  --
  -- A blazing fast and easy to configure Neovim statusline written in Lua.
  --]]
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      if not vim.g.trouble_lualine then
        table.insert(opts.sections.lualine_c, {
          "aerial",
          sep = " ", -- separator between symbols
          sep_icon = "", -- separator between icon and symbol

          -- The number of symbols to render top-down. In order to render only 'N' last
          -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
          -- be used in order to render only current symbol.
          depth = 5,

          -- When 'dense' mode is on, icons are not rendered near their symbols. Only
          -- a single icon that represents the kind of current symbol is rendered at
          -- the beginning of status line.
          dense = false,

          -- The separator to be used to separate symbols in dense mode.
          dense_sep = ".",

          -- Color the symbol icons.
          colored = true,
        })
      end
    end,
  },
}
