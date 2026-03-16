-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  
  -- not sure if this is needed: 
  -- defaults = { lazy = true }.

  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },

  -- rocks stuff. We want to use hererocks to install what we need
  rocks = {
    enabled = true, 
    hererocks = nil, 
  },
  
  -- automatically check for plugin updates
  checker = { 
    enabled = true ,
    -- notify = false
  },
})
