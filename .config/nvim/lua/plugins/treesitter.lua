-- ~/.config/nvim/lua/plugins/treesitter.lua
--
-- Migrated to nvim-treesitter `main` branch API (required for Neovim 0.12+).
-- The old `require("nvim-treesitter.configs").setup({...})` pattern is gone.
-- Highlighting, indent, and parser install are now handled separately below.
--
-- NOTE: markdown / markdown_inline highlighting is intentionally disabled.
-- Re-enable by adding them to the FileType autocmd patterns below.
-- See log_nvim_changes.md for context.

return {

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- main branch required for Neovim 0.12+
    lazy = false, -- lazy-loading is NOT supported on the main branch
    build = ":TSUpdate",
    config = function()
      -- Install parsers (replaces ensure_installed / auto_install)
      require("nvim-treesitter").install({
        "python",
        "vim", "lua",
        "javascript",
        "html", "css", "json",
        "markdown", "markdown_inline",
        "yaml",
      })

      -- Highlighting (replaces highlight = { enable = true })
      -- markdown and markdown_inline are excluded intentionally for now
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "vim", "lua", "javascript", "html", "css", "json", "yaml" },
        callback = function(args)
          vim.treesitter.start(args.buf)
        end,
      })

      -- Indentation (replaces indent = { enable = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python", "vim", "lua", "javascript", "html", "css", "json", "yaml" },
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- incremental_selection (<C-space> / <bs> keymaps) was removed in the
      -- main branch rewrite and has no built-in replacement. Dropped.
    end,
  },

  -- Auto-close / auto-rename HTML and JSX tags
  -- Must be set up independently (nvim-treesitter.configs integration deprecated)
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },

  -- Rainbow bracket / delimiter coloring
  -- Standalone plugin; hooks into FileType automatically with zero config
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },

}
