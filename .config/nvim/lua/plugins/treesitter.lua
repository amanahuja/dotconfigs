-- ~/.config/nvim/lua/plugins/treesitter.lua
-- 
--

return {

  -- LSP and completion
  -- ==
  { 
    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "HiPhish/rainbow-delimiters.nvim", -- Rainbow brackets
    },
    
    -- Treesitter config
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        ensure_installed = { 
          "python", 
          "vim", "lua", "javascript", 
          "html", "css", "json", 
          "markdown", "markdown_inline", "yaml", 
        }, 
        sync_install = true,
        auto_install = true, 
        highlight = { -- Enable syntax highlighting
          enable = true,

          -- AA TEMP disabled b/c md syntax sucks right now
          disable = function(lang, bufnr)
            return lang == "markdown" or lang == "markdown_inline"
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
              init_selection = "<C-space>",
              node_incremental = "<C-space>",
              scope_incremental = false,
              node_decremental = "<bs>",
          },
        },
        --   -- testing this: 
        --   incremental_selection = {
        --     enable = true,
        --     keymaps = {
        --       init_selection = "gnn",
        --       node_incremental = "grn",
        --       scope_incremental = "grc",
        --       node_decremental = "grm",
        --     },
        --   },
        indent = { enable = true },    -- Enable Treesitter-based indentation
      })
    end,

  },
}


