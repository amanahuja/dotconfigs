-- Search within files listed in quickfix for two-stage search

local M = {}

M.search_quickfix = function()
  local fzf = require("fzf-lua")
  
  -- Get the list of files from quickfix list
  local qf_list = vim.fn.getqflist({title = 0, items = 1})
  local files = {}

  -- Collect file paths from quickfix items
  for _, item in ipairs(qf_list.items) do
    -- Get filename from buffer number
    local filename = nil
    if item.bufnr and item.bufnr > 0 then
      filename = vim.api.nvim_buf_get_name(item.bufnr)
    end
    
    if filename and filename ~= "" then
      -- Convert to absolute path
      local abs_path = vim.fn.fnamemodify(filename, ":p")
      
      -- Check if the file is readable and not already in the list
      if vim.fn.filereadable(abs_path) == 1 and not vim.tbl_contains(files, abs_path) then
        table.insert(files, abs_path)
      end
    end
  end
  
  -- If no files are found, return early
  if #files == 0 then
    print("No valid files in quickfix list.")
    return
  end
  
  -- Escape file paths for shell
  local escaped_files = {}
  for _, file in ipairs(files) do
    table.insert(escaped_files, vim.fn.shellescape(file))
  end
  
  -- Run fzf-lua grep on the collected files
  fzf.live_grep({
    prompt = "Search in Quickfix> ",
    cwd = vim.fn.getcwd(),
    rg_opts = "--column --line-number --no-heading --color=always --smart-case",
    filespec = table.concat(escaped_files, " "),
  })
end

return M
