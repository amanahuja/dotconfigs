-- ~/.config/nvim/lua/plugins/init.lua
-- add any plugins that don't need extra configuration, 
-- so perhaps a dedicated file is not necessary. 

return {
 
  -- TODO
  -- luarocks / hererocks / lua 5.1 / nvim-cmp

  -- common dependency luarocks
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  
  -- common dependency plenary.nvim 
  -- { "nvim-lua/plenary.nvim", },

  -- Packages -- snacks.nvim and Mini.nvim
  -- see https://github.com/omerxx/dotfiles/blob/master/nvim/lua/plugins/lazy.lua
  { 'echasnovski/mini.nvim', version = false },
  
  -- movement
  -- ==

  -- workflow: obsidian, workspace, snippets
  { 'chentoast/marks.nvim', event = "VeryLazy", opts = {}, },

  -- undo history visualizer
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" }
    },
    -- config = function()
    --   vim.g.undotree_SetFocusWhenToggle = 1  -- Focus undotree when opened
    --   vim.g.undotree_WindowLayout = 2        -- Layout option
    -- end
  },

  -- autosave and worksessions
  {
    -- plugin: auto-save.nvim
    -- src: https://github.com/pocco81/auto-save.nvim
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      execution_message = {
        message = function() -- message to print on save
          return ""
        end,
      },
    },
  },
  
  -- git, AI and integration stuf
  -- ==

	{ "tpope/vim-fugitive", event = "VeryLazy",  },
	{ "lewis6991/gitsigns.nvim", event = "VeryLazy",  },
  { 'mhinz/vim-signify' }, 
  
 
  -- cosmetics, themes and color schemes
  -- ==

  -- { 'danilamihailov/beacon.nvim' }, 
  
  
  -- gruvbox, lucario. Don't use solarized
  { "folke/tokyonight.nvim", },
  { "morhetz/gruvbox", name="morhetz-gruvbox",  },
  -- { ""}.
  { "raphamorim/lucario", },

  { "gruvbox-community/gruvbox", 
    name="gruvbox", 
    lazy = false, 
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end
  },

}

