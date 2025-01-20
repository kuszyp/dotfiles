return {
  {
    "nvim-telescope/telescope.nvim",
    -- pull a specific version of the plugin
    -- tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      -- get access to telescope built in functions
      local builtin = require("telescope.builtin")

      -- set a vim motion to <Space> + f + f to search for files by their names
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
      -- set a vim motion to <Space> + f + g to search for files based on text inside of them
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
      -- set a vim motion to <Space> + f + d to search for Code Diagnostics in the current project
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
      -- set a vim motion to <Space> + f + r to resume the previous search
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]inder [R]esume" })
      -- set a vim motion to <Space> + f + . to search for Recent Files
      vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent Files (\".\" for repeat" })
      -- set a vim motion to <Space> + f + b to search Open Buffers
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind Existing [B]uffers" })
    end, 
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- get sccess to telescope navigation functions
      local actions = require("telescope.actions")

      require("telescope").setup({
        -- use ui-select dropdown as our ui
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        },
        -- set keymappings to navigate through items in the telescope io
        mappings = {
          i = {
            -- use <ctrl> + n to go to the next option
            ["<C-n>"] = actions.cycle_history_next,
            -- use <ctrl> + p to go to the previous option
            ["<C-p>"] = actions.cycle_history_prev,
            -- use <ctrl> + j to go to the next preview
            ["<C-j>"] = actions.move_selection_next,
            -- use <ctrl> + k to go to the previous preview
            ["<C-k>"] = actions.move_selection_previous,
          }
        },
        -- load the ui-select extension
        require("telescope").load_extension("ui-select")
      })
    end
  }
}
