return {
    "ibhagwan/fzf-lua",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local fzf = require("fzf-lua")

      -- setup config for fzf-lua
      fzf.setup({
        -- profile baseline
        {"fzf-vim", "telescope"},
        
        -- config here, tbd. See :help fzf-lua-configuration
        -- 
         
        file_ignore_patterns = { "%.ajson$" },
        
        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
          },        
          -- 
        }, 
      })
    end,
}
