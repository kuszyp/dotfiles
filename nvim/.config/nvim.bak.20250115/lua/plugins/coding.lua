return {
  --[[
  -- https://github.com/hrsh7th/nvim-cmp
  --
  -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
  -- Codeium cmp source
  --
  --]]

  --  {
  --    "nvim-cmp",
  --    optional = true,
  --    dependencies = { "codeium.nvim" },
  --    opts = function(_, opts)
  --      table.insert(opts.sources, 1, {
  --        name = "codeium",
  --        group_index = 1,
  --        priority = 100,
  --      })
  --    end,
  --  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- override nvim-cmp and add cmp-emoji
  --]]
  --{
  --  "hrsh7th/nvim-cmp",
  --  dependencies = { "hrsh7th/cmp-emoji" },
  --  ---@param opts cmp.ConfigSchema
  --  opts = function(_, opts)
  --    table.insert(opts.sources, { name = "emoji" })
  --  end,
  --},

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- https://github.com/hrsh7th/nvim-cmp
  --
  -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external 
  -- repositories and "sourced".
  --
  -- optional cmp integration with supermaven
  --]]
  --{
  --  "hrsh7th/nvim-cmp",
  --  optional = true,
  --  dependencies = { "supermaven-nvim" },
  --  opts = function(_, opts)
  --    if vim.g.ai_cmp then
  --      table.insert(opts.sources, 1, {
  --        name = "supermaven",
  --        group_index = 1,
  --        priority = 100,
  --      })
  --    end
  --  end,
  --},

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- Use <tab> for completion and snippets (supertab)
  --]]
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --{
  --  "saghen/blink.compat",
  --  opts = {},
  --  version = not vim.g.lazyvim_blink_main and "*",
  --},

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]

  --[[
  -- Disable completion in certain context, such as comments
  --]]

  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      local cmp = require("cmp")
      cmp.setup({
        preselect = cmp.PreselectMode.None,
        enabled = function()
          -- disable completion in comments
          local context = require("cmp.config.context")

          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
          end
        end,
      })
    end,
  },

  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
  --[[ ------------------------------------------------------------------------------------------------------------- ]]
}
