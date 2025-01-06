-- ~/.config/nvim/lua/keymaps.lua

local map = vim.keymap.set

-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Reload config
map("n", "<leader>V", ":so $MYVIMRC<CR>", { desc = "Reload Neovim config" })

-- Buffer and tab navigation
map("n", "<leader>l", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>B", "<C-^>", { desc = "Alternate file" })
-- FZF fb
--
-- Insert commonly used: date and datetime
map("n", "<leader>.5", function() vim.api.nvim_put({ os.date("%Y-%m-%d %a") }, "c", true, true) end, { desc = "Insert date (YYYY-MM-DD DAY)" })
map("n", "<leader>.d", function() vim.api.nvim_put({ os.date("%c") }, "c", true, true) end, { desc = "Insert datetime" })

-- Search
map("n", "<leader>g", ":FzfLua live_grep<CR>", { desc = "Search text (live grep)" })
map("n", "<leader>G", ":FzfLua grep_cword<CR>", { desc = "Search for word under cursor" })

-- File search
map("n", "<leader>F", ":FzfLua files<CR>", { desc = "Search files with FzfLua" })

-- Folding
map("n", "<leader>z", "za", { desc = "Toggle fold" })

-- Arglist navigation
map("n", "<leader>[", ":cprevious<CR>", { desc = "Previous item in arglist" })
map("n", "<leader>]", ":cnext<CR>", { desc = "Next item in arglist" })

-- Loclist navigation
map("n", "<leader>{", ":lprevious<CR>", { desc = "Previous item in loclist" })
map("n", "<leader>}", ":lnext<CR>", { desc = "Next item in loclist" })

-- plugins mapping
-- #####

-- autosave toggle
map("n", "<leader>ps", ":ASToggle<CR>", { desc = "Toggle Autosave" })

-- FZF
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Search in files (live grep)" })
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "Find recent files" })
map("n", "<leader>fp", "<cmd>FzfLua git_files<CR>", { desc = "Find Git files (project)" })
map("n", "<leader>fc", "<cmd>FzfLua commands<CR>", { desc = "Command palette" })
map("n", "<leader>fm", "<cmd>FzfLua marks<CR>", { desc = "Marks" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>FzfLua resume<CR>", { desc = "Resume search" })

-- FZF + LSP
map("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "LSP definitions" })
map("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP references" })
map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })

-- FZFLua Git
  -- map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Git commits" })
  -- map("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Git branches" })
  -- map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Git status" })
  -- FZFLua Git w/ LSP (if you're using FZF-Lua's LSP integration)
  -- map("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP implementations" })

-- Quickfix: Quicker.nvim
vim.keymap.set("n", "<leader>q", 
  function()
    require("quicker").toggle()
  end, { desc = "Toggle quickfix", })

vim.keymap.set("n", "<leader>l", function()
  require("quicker").toggle({ loclist = true })
end, { desc = "Toggle loclist", })

-- Daily note
-- #####

-- Jump to today's note
-- alternative format demo:
local custom_func = require("config.custom_func")
map('n', '<leader>t', function() custom_func.jump_daily_note() end, { noremap = true, silent = true })

-- Jump to today's note
-- map('n', '<leader>t', function() require('config.custom_func').jump_daily_note('') end, { desc = "Jump to today's daily note", silent = true })

-- Jump to the previous note
map('n', '<M-Left>', function() require('config.custom_func').jump_daily_note('backward') end, { desc = "Jump to the previous daily note", silent = true })
map('n', '<leader>tj', function() require('config.custom_func').jump_daily_note('backward') end, { desc = "Jump to the previous daily note", silent = true })
map('n', '<leader>tp', function() require('config.custom_func').jump_daily_note('backward') end, { desc = "Jump to the previous daily note", silent = true })

-- Jump to the next note
map('n', '<M-Right>', function() require('config.custom_func').jump_daily_note('forward') end, { desc = "Jump to the next daily note", silent = true })
map('n', '<leader>tk', function() require('config.custom_func').jump_daily_note('forward') end, { desc = "Jump to the next daily note", silent = true })
map('n', '<leader>tn', function() require('config.custom_func').jump_daily_note('forward') end, { desc = "Jump to the next daily note", silent = true })

