return {
  --[[
  -- https://github.com/nvim-java/nvim-java
  --
  -- Just install and start writing public static void main(String[] args).
  --
  -- Caution
  -- You cannot use nvim-java alongside nvim-jdtls. So remove nvim-jdtls before installing this
  --
  -- Tip
  -- You can find cool tips & tricks here https://github.com/nvim-java/nvim-java/wiki/Tips-&-Tricks
  --
  -- Note
  -- If you are facing errors while using, please check troubleshoot wiki https://github.com/nvim-java/nvim-java/wiki/Troubleshooting
  --]]
  --  {
  --    "nvim-java/nvim-java",
  --    config = false,
  --    dependencies = {
  --      {
  --        "neovim/nvim-lspconfig",
  --        opts = {
  --          servers = {
  --            jdtls = {
  --              -- your jdtls configuration goes here
  --            },
  --          },
  --          setup = {
  --            jdtls = function()
  --              require("java").setup({
  --                -- your nvim-java configuration goes here
  --              })
  --            end,
  --          },
  --        },
  --      },
  --    },
  --  },
  --
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[ 
  -- https://github.com/nvim-treesitter/nvim-treesitter
  --
  -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim
  -- and to provide some basic functionality such as highlighting based on it.
  --]]
  --  {
  --    "nvim-treesitter/nvim-treesitter",
  --    opts = {
  --      ensure_installed = { "java" },
  --    },
  --  },
  --
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

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
    optional = true,
    opts = function()
      -- Simple configuration to attach to remote java debug process
      -- Taken directly from https://github.com/mfussenegger/nvim-dap/wiki/Java
      local dap = require("dap")
      dap.configurations.java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      }
    end,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
      },
    },
  },
}
