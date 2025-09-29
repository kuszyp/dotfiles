return {

  --[[
  -- Try to disable code suggestions from lsp
  --]]
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
          enabled = false,
      },
    },
  },
}
