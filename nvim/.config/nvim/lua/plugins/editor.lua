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
}
