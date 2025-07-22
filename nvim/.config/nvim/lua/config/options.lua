-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--[[
-- Custom options
--
-- colorcolumn and wrapping long lines
--]]

-- set to `true` to follow the main branch
-- you need to have a working rust toolchain to build the plugin
-- in this case.
vim.g.lazyvim_blink_main = false

-- custom shell
vim.g.shell = "fish"

local opt = vim.opt

-- Size of an indent
opt.shiftwidth = 2
-- Number of spaces tabs count for
opt.tabstop = 2
-- Vertical line indicating text length.
-- To display many lines put numbere separated by coma (,)
opt.colorcolumn = "120"
-- Enable highlight of the current column
opt.cursorcolumn = true
opt.textwidth = 120
opt.wrapmargin = 0
-- Disable/Enable line wrap
opt.wrap = true
-- Wrap lines at convenient points
opt.linebreak = true
-- Try to display whitecharacters
--opt.list = true
--opt.listchars = 'tab:» ,lead:•,trail:•'
--opt.listchars = 'eol:↵,trail:~,tab:>-,nbsp:␣'
--opt.listchars = 'tab:→ ,trail:•,nbsp:␣'

-- LSP  Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
--vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
--vim.g.lazyvim_python_ruff = "ruff"

-- Set filetype to `bigfile` for files larger than 1.5 MB
-- Only vim syntax will be enabled (with the correct filetype)
-- LSP, treesitter and other ft plugins will be disabled.
-- mini.animate will also be disabled.
-- vim.g.bigfile_size = 1024 * 1024 * 1.5 -- 1.5 MB
