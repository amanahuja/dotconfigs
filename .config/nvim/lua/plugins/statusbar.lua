
-- status bar stuff
--
-- others: 
-- Didn't really like mini.statusline
-- see also { 'itchyny/lightline.vim' },
--
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
      options = {
        theme = "gruvbox",
        --fmt = string.lower(),
      globalstatus = true, 
      },
      -- +-------------------------------------------------+
      -- | A | B | C                             X | Y | Z |
      -- +-------------------------------------------------+
      sections = {
        -- This defines the bottom lualine bar
        lualine_b = {'diff', 'diagnostics'},   -- moved "branch" to tabline
        },
      tabline = {
        -- tabline is at the top!
        lualine_c = {{'filename', path = 3}},  -- Double braces + space around =
        lualine_x = {'branch'},
        lualine_z = {'tabs'},
      },
      winbar = {
      },
      inactive_winbar = {
      }
      })  -- closes setup
  end
  }
