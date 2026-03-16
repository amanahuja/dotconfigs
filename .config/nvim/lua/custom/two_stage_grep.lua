-- Two-stage grep: progressive narrowing with fzf-lua
-- See custom_fzf_twostagegrep.md for documentation

local M = {}

-- Launch a live_grep that can be narrowed with <C-n>
M.two_stage_grep = function(opts)
  opts = opts or {}
  
  local fzf = require("fzf-lua")
  
  -- Custom action for <C-n>: narrow to current results
  local actions = require("fzf-lua.actions")
 
  -- Narrow action: handles selected items or current item
  local function narrow_action(selected, o)

    -- If nothing provided, we can't narrow
    if not selected or #selected == 0 then
      print("No results to narrow")
      return
    end

    -- Extract unique file paths from selected results
    local files, seen = {}, {}
    local path = require("fzf-lua.path")

    for _, entry in ipairs(selected) do
      local f = path.entry_to_file(entry, o).path
      if f and not seen[f] then
        seen[f] = true
        table.insert(files, vim.fn.fnamemodify(f, ":p")) 
      end
    end

    if #files == 0 then
      print("No files to narrow to")
      return
    end

    vim.schedule(function()
      M.two_stage_grep({
        prompt = ("Narrowed (%d files)> "):format(#files),
        search_paths = files, 
      })
    end)
  end

  -- Merge with user options
  local final_opts = vim.tbl_deep_extend("force", {
    prompt = opts.prompt or "Search in Files> ",
    silent = true,

    keymap = {
      fzf = {
        -- Enter: always select all visible and narrow
        ["enter"] = "select-all+accept",
        ["ctrl-6"] = "select-all+accept", -- Same as Enter
      },
    },

    actions = {
      -- Default action: narrow to the items passed in
      ["default"] = narrow_action,
      -- Ctrl-o: open file directly instead of narrowing
      ["ctrl-o"] = actions.file_edit,
    },
  }, opts)
  
  fzf.live_grep(final_opts)
end

return M
