return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      workspaces = {
        {
          name = "monolith",
          path = "/home/aman/obsidian/monolith",
        },
      },

      disable_frontmatter = true,

      picker = {
        name = "fzf-lua",
      },

      completion = {
        nvim_cmp = true,
        min_chars = 0,
      },

      ui = {
        enable = false,
      },
    },

    config = function(_, opts)
      require("obsidian").setup(opts)

      -- Auto-trigger cmp completion in markdown for obsidian link sources
      local cmp = require("cmp")
      cmp.setup.filetype("markdown", {
        completion = {
          autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
        },
        sources = {
          { name = "obsidian",     group_index = 1 },
          { name = "obsidian_new", group_index = 1 },
          { name = "obsidian_tags", group_index = 1 },
          { name = "buffer", keyword_length = 3, group_index = 2 },
        },
      })
    end,
  },
}
