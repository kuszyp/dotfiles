return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = true },
      highlight = { enable = true },
      folds = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "toml",
        "latex",
        "groovy"
      },
    },
  },

  -- Automatically add closing tags for HTML ans JSX
  {
    "windwp/nvim-ts-autotag",
event = "LazyFile",
    opts = {},
  },

}
