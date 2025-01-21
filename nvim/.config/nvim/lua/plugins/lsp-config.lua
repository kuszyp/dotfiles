return {
  {
    "williamboman/mason.nvim",
    config = function()
      -- setup mason with default properties
      require("mason").setup()
    end,
  },

  -- setup lsp config utilizes mason to automatically ansure lsp servers you want installed are installed
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- ensire that we have lua language server, typescript language server, java language server, and java test language server installed
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "jdtls" },
      })
    end,
  },

  -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      -- ensure the java debug adapter is installed
      require("mason-nvim-dap").setup({
        ensure_installed = { "java-debug-adapter", "java-test" },
      })
    end,
  },

  -- utility plugin for configuring the java language server for us
  {
    "mfussenegger/nvim-jdtls",
    dependencies = {

    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- get access to the lspconfig plugins functions
      local lspconfig = require("lspconfig")

      -- setup the lua language server
      lspconfig.lua_ls.setup({})

      -- setup the typescript language server
      lspconfig.ts_ls.setup({})

      -- set vim motion for <space> + c + h to show code documentation about the code the cursor is currently over if available
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
      -- set vim motion for <space> + c + d to go where the code/variable under the cursor was defined
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
      -- set vim motion for <space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
      vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
      -- set vim motion for <space> + c + r to display references to the code under the cursor
      vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode Goto [R]eferences" })
      -- set vim motion for <space> + c + i to display implementations to the code under the cursor
      vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode Goto [I]mplementations" })
      -- set vim motion for <space> + c + <shift>R to smartly rename the code under the cursor
      vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
      -- set vim motion for <space> + c + <shift>D to go to where code/object was declared in the project (class file)
      vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
    end,
  },
}
