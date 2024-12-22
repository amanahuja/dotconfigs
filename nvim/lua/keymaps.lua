-- ~/.config/nvim/lua/keymaps.lua

local map = vim.keymap.set
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- plugins mapping
-- #####

-- FZF
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "Find recent files" })
map("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "LSP definitions" })
map("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP references" })
map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })

-- FZFLua 
-- map("n", "<leader>fg", "<cmd>FzfLua git_files<CR>", { desc = "Find Git files" })
-- map("n", "<leader>fr", "<cmd>FzfLua live_grep<CR>", { desc = "Search in files (live grep)" })
-- FZFLua Git
-- map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Git commits" })
-- map("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Git branches" })
-- map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Git status" })
-- FZFLua Git w/ LSP (if you're using FZF-Lua's LSP integration)
-- map("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP implementations" })
-- FZFLua Others
-- map("n", "<leader>cm", "<cmd>FzfLua commands<CR>", { desc = "Command palette" })
-- map("n", "<leader>hk", "<cmd>FzfLua help_tags<CR>", { desc = "Help tags" })
-- map("n", "<leader>mr", "<cmd>FzfLua marks<CR>", { desc = "Marks" })


