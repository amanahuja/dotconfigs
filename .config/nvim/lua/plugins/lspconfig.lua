-- ~/.config/nvim/lua/plugins/lspconfig.lua
return {
  { "neovim/nvim-lspconfig" }, -- core LSP support

  {
    "williamboman/mason.nvim", -- LSP installer
    config = function()
      require("mason").setup()
    end,
  },

  -- {
  --   "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and LSPConfig
  --   dependencies = { "neovim/nvim-lspconfig" },
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = { "pyright" }, -- Ensure pyright is installed
  --     })
  --   end,
  -- },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
      })

      -- Use modern vim.lsp.config API (Neovim 0.11+)
      -- Automatically starts pyright when Python files are opened
      vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      }
      
      -- Enable pyright for Python files
      vim.lsp.enable("pyright")
    end,
  },

}
-- 
-- -- Python LSP
-- lspconfig.pyright.setup({})
-- 
-- -- TypeScript/JavaScript LSP
-- lspconfig.tsserver.setup({})
-- 
-- -- HTML LSP
-- lspconfig.html.setup({})
