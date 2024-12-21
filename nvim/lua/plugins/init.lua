-- ~/.config/nvim/lua/plugins/init.lua

return {
  -- treesitter 
  -- ==
  { 
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",

    opts = {
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
      },
      indent = { enable = true },    -- Enable Treesitter-based indentation
    }

  },

  -- LSP and completion
  -- ==
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp", enabled = false }, -- Autocompletion plugin
  -- { "" }, 

  -- file explorer, etc
  -- ==
  {
    "nvim-tree/nvim-tree.lua",
    requires = "nvim-tree/nvim-web-devicons", -- Optional: for file icons
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  
  {
    -- FZF
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  }, 


  -- movement
  -- ==
	{ "tpope/vim-surround" },
  {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},

      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },

  },

  -- workflow: obsidian, workspace, snippets
  -- ==
  -- "epwalsh/obsidian.nvim" requires dependency plenary.nvim ?
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  
  -- git, AI and integration stuf
  -- ==
	{ "tpope/vim-fugitive" },
  { 'mhinz/vim-signify' }, 
  { 'itchyny/lightline.vim' },
  { 'chentoast/marks.nvim' },
 
  -- color scheme
  -- ==
  -- gruvbox, lucario. Don't use solarized
  { "folke/tokyonight.nvim", },
  { "gruvbox-community/gruvbox", name="gruvbox", },
  { "morhetz/gruvbox", name="morhetz-gruvbox",  },
  -- { ""}.
  { "raphamorim/lucario", },

}


-- other syntax
-- require ("plugins.treesitter")
-- return {
  -- Treesitter
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function()
--       require("plugins.treesitter")
--     end,
--   },
