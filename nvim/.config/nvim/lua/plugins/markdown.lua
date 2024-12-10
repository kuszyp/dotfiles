return {

  --[[
  -- https://github.com/nvimtools/none-ls.nvim
  --
  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  --]]
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.diagnostics.markdownlint_cli2,
      })
    end,
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/mfussenegger/nvim-lint
  --
  -- An asynchronous linter plugin for Neovim (>= 0.9.5) complementary to the built-in Language Server Protocol support
  --]]
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      },
    },
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/stevearc/conform.nvim
  --
  -- Lightweight yet powerful formatter plugin for Neovim
  --
  --
  --]]
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      formatters_by_ft = {
        ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      },
    },
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
}
