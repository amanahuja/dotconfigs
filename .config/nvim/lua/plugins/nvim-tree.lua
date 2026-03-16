-- file explorer, etc

return {
  "nvim-tree/nvim-tree.lua",

  dependencies = "nvim-tree/nvim-web-devicons", -- Optional: for file icons

  config = function()
    require("nvim-tree").setup({
      sort_by = "modification_time",
      -- Not yet implemented: sort_reverse = true,
    })
  end,

}
