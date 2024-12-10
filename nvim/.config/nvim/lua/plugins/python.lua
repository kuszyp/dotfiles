return {

  --[[
  -- https://github.com/nvim-neotest/neotest
  --
  -- A framework for interacting with tests within NeoVim
  --]]

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
    },
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/hrsh7th/nvim-cmp
  --
  -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
  --]]
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
    end,
  },

  --[[
  -- https://github.com/mfussenegger/nvim-dap
  --
  -- nvim-dap is a Debug Adapter Protocol client implementation for Neovim. nvim-dap allows you to:
  -- Launch an application to debug
  -- Attach to running applications and debug them
  -- Set breakpoints and step through code
  -- Inspect the state of the application
  --]]

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
    -- stylua: ignore
    keys = {
      { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
      { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
    },
      config = function()
        if vim.fn.has("win32") == 1 then
          require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/Scripts/pythonw.exe"))
        else
          require("dap-python").setup(LazyVim.get_pkg_path("debugpy", "/venv/bin/python"))
        end
      end,
    },
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/jay-babu/mason-nvim-dap.nvim
  --
  -- mason-nvim-dap bridges mason.nvim with the nvim-dap plugin - making it easier to use both plugins together
  --]]
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      handlers = {
        python = function() end,
      },
    },
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
}
