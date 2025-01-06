
-- Lua configs
-- stored in folder .config/nvim/lua
require("settings")

-- package manager
require("config.lazy")

-- plugins config
require("plugins")

-- custom functions (loading these after plugins)
require("config.custom_func")

-- key mappings
require("keymaps")

-- color scheme and theme stuff
-- require("theme")
--
--

-- LSP configuration with Mason 
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Mason setup
mason.setup()

-- Mason LSPConfig setup
mason_lspconfig.setup({
    ensure_installed = { "pyright" }, -- Automatically install pyright
})

-- Configure Pyright with LSPConfig
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic", -- Options: off, basic, strict
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
    on_attach = function(client, bufnr)
        -- LSP-specific keymaps
        local bufmap = function(mode, lhs, rhs, desc)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
        end

        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition")
        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "Find References")
        bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation")
        bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol")
        bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action")
    end,
})
