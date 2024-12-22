-- ~/.config/nvim/lua/plugins/init.lua

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
        -- "windwp/nvim-ts-rainbow", -- Add rainbow functionality
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
        rainbow = {
            enable = true,
            disable = { "html" },
            extended_mode = false,
            max_file_lines = nil,
        },
        indent = { enable = true },    -- Enable Treesitter-based indentation
      })
    end,

  },

  { "neovim/nvim-lspconfig" }, -- core LSP support

  {
        "williamboman/mason.nvim", -- LSP installer
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and LSPConfig
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "pyright" }, -- Ensure pyright is installed
            })
        end,
    },

  -- file explorer, etc
  -- ==
  {
    "nvim-tree/nvim-tree.lua",
    -- requires = "nvim-tree/nvim-web-devicons", -- Optional: for file icons
    dependencies = "nvim-tree/nvim-web-devicons", -- Optional: for file icons
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
          -- config here, tbd
      })
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
  -- { 'itchyny/lightline.vim' },
  {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("lualine").setup({
        options = {
          theme = "gruvbox",
          --fmt = string.lower(),
        },
      })
    end
  },
  { 'chentoast/marks.nvim' },
 
  -- color scheme
  -- ==
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

