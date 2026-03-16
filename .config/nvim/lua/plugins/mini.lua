local miniclue = require('mini.clue')

-- useful ref
-- https://github.com/echasnovski/mini.nvim/discussions/36
--
return {
  require('mini.ai').setup(),
  require('mini.surround').setup(),
  require('mini.jump').setup(),
  require('mini.operators').setup(),
  require('mini.bracketed').setup(),
  require('mini.indentscope').setup(),
  require('mini.bufremove').setup(),

  require('mini.starter').setup(),

  require('mini.icons').setup(),
  
 
  -- disabled
  -- 
  -- require('mini.statusline').setup(),
  -- require('mini.files').setup(),
  -- require('mini.pairs').setup(),

  -- requires config

  require('mini.clue').setup( {
    -- https://github.com/echasnovski/mini.nvim/blob/main/doc/mini-clue.txt
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },

      -- mini.bracketed 

      { mode = 'n', keys = '[' },
      { mode = 'n', keys = ']' },
      { mode = 'x', keys = '[' },
      { mode = 'x', keys = ']' },

    },

    clues = {
      -- Enhance this by adding descriptions for <Leader> mapping groups
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      -- miniclue.gen_clues.registers({show_contents = true}),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),
    },

    window = {
      -- delay default is 1000
      delay = 100,
      config = {
        width = 'auto',
        border = "rounded",
      },
    },
    -- delay = {
    --   trigger = 100, -- Time (ms) before showing clue window
    --   keys = 500,    -- Time (ms) before hiding clue window after keys are pressed
    -- },
  })
}
