-- ~/.config/nvim/lua/settings.lua
--
-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "," -- other options: "\\", ";", 


local opt = vim.opt
--
-- General settings inspired by vim-sensible
opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Relative line numbers

-- tabs
opt.tabstop = 2             -- Tabs are 2 spaces
opt.shiftwidth = 2          -- Indentation width
opt.expandtab = true        -- Convert tabs to spaces

-- display
opt.smartindent = true      -- Enable smart indentation
opt.wrap = false            -- Disable line wrapping
opt.scrolloff = 8           -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8       -- Keep 8 columns visible left/right of cursor
opt.backup = false          -- Disable backup file creation
opt.writebackup = false     -- Disable backup when writing
opt.swapfile = false        -- Disable swap files
opt.undofile = true         -- Enable persistent undo
opt.incsearch = true        -- Incremental search
opt.hlsearch = true         -- Highlight search results
opt.ignorecase = true       -- Ignore case in search patterns
opt.smartcase = true        -- Override ignorecase if pattern contains caps
opt.splitright = true       -- Vertical splits open to the right
opt.splitbelow = true       -- Horizontal splits open below
opt.updatetime = 300        -- Faster update time (default is 4000ms)


-- Sensible defaults for clipboard and mouse
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.mouse = "a"              -- Enable mouse for all modes

opt.cursorline = true
opt.autoread = true
opt.showcmd = true

