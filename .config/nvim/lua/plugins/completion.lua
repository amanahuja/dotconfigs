-- See these 
-- https://github.com/epwalsh/dotfiles/blob/main/neovim/lua/plugins/completion.lua
--

return {
  {
    "hrsh7th/nvim-cmp", 
    lazy = true,
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/cmp-buffer",
    },
    opts = {},

    config = function(_, _)
      local cmp = require "cmp"
      cmp.setup {
        completion = {
          autocomplete = false,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
          },
        },
        sources = {
          { name = "buffer", keyword_length = 3, group_index = 1 },
        },
        -- formatting = { },
      }
    end

  }
}

