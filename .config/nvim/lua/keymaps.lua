-- ~/.config/nvim/lua/keymaps.lua

local map = vim.keymap.set

-- File Explorer
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Reload config
map("n", "<leader>V", ":so $MYVIMRC<CR>", { desc = "Reload Neovim config" })

-- Buffer and tab navigation
-- CONFLICT w/ loclist map("n", "<leader>l", ":tabn<CR>", { desc = "Next tab" })
-- map("n", "<leader>b", ":tabn<CR>", { desc = "Next tab" })
map("n", "<leader>b", ":bnext<CR>", { desc = "Next buffer" })
-- ALTERNATE map("n", "<leader>b", "<C-^>", { desc = "Alternate file" })
-- map("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
-- FZF fb
--
-- Insert commonly used: date and datetime
map("n", "<leader>.5", function() vim.api.nvim_put({ os.date("%Y-%m-%d %a") }, "c", true, true) end, { desc = "Insert date (YYYY-MM-DD DAY)" })
map("n", "<leader>.d", function() vim.api.nvim_put({ os.date("%c") }, "c", true, true) end, { desc = "Insert datetime" })


-- Folding
map("n", "<leader>z", "za", { desc = "Toggle fold" })

-- Better navigation with centering
map("n", "<C-d>", "<C-d>zz", { desc = "Page down, then center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Page up, then center" })
map("n", "n", "nzzzv", { desc = "Next search result, center and unfold" })
map("n", "N", "Nzzzv", { desc = "Previous search result, center and unfold" })

-- Visual mode line movement (replaces default J=join lines, K=man page lookup)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Collect selection into /tmp/gather_info_nvim_YYYYMMDD.md
map("v", "<leader>cc", function()
  require("custom.collect").collect_selection()
end, { desc = "Collect selection to /tmp/gather_info_nvim_YYYYMMDD.md" })

-- Arglist navigation
map("n", "<leader>[", ":cprevious<CR>", { desc = "Previous item in arglist" })
map("n", "<leader>]", ":cnext<CR>", { desc = "Next item in arglist" })

-- Loclist navigation
map("n", "<leader>{", ":lprevious<CR>", { desc = "Previous item in loclist" })
map("n", "<leader>}", ":lnext<CR>", { desc = "Next item in loclist" })

-- plugins mapping
-- #####

-- autosave toggle
map("n", "<leader>ps", ":ASToggle<CR>", { desc = "Toggle Autosave" })

-- FZF - search
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Search in files (live grep)" })
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "Find recent files" })
map("n", "<leader>fp", "<cmd>FzfLua git_files<CR>", { desc = "Find Git files (project)" })
map("n", "<leader>fc", "<cmd>FzfLua commands<CR>", { desc = "Command palette" })
map("n", "<leader>fm", "<cmd>FzfLua marks<CR>", { desc = "Marks" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>FzfLua resume<CR>", { desc = "Resume search" })
map("n", "<leader>fG", ":FzfLua grep_cword<CR>", { desc = "Search for word under cursor" })

-- Custom search functions
map("n", "<leader>fq", function() require("custom.search_quickfix").search_quickfix() end, { desc = "Search within quickfix results" })
-- disabled not working: map("n", "<leader>fn", function() require("custom.two_stage_grep").two_stage_grep() end, { desc = "Search in Files (two-stage grep)" })

-- FZF + LSP
map("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "LSP definitions" })
map("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP references" })
map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>lS", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", { desc = "Workspace symbols (live)" })

-- LSP (native, buffer-local - set via autocmd)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    
    -- Standard navigation
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to Definition" })) -- Note: also <leader>ld (FzfLua)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))
    
    -- LSP actions (v prefix for "view")
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, vim.tbl_extend("force", opts, { desc = "Workspace Symbols" })) -- Note: also <leader>lS (FzfLua)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Actions" }))
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "References" })) -- Note: also <leader>lr (FzfLua)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename Symbol" }))
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show Diagnostics" }))
    
    -- Diagnostic navigation
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous Diagnostic" }))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next Diagnostic" }))
    
    -- Signature help (insert mode)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature Help" }))
  end,
})

-- FZFLua Git
  -- map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Git commits" })
  -- map("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Git branches" })
  -- map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Git status" })
  -- FZFLua Git w/ LSP (if you're using FZF-Lua's LSP integration)
  -- map("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP implementations" })

-- Quickfix: Quicker.nvim
vim.keymap.set("n", "<leader>q", 
  function()
    require("quicker").toggle()
  end, { desc = "Toggle quickfix", })

vim.keymap.set("n", "<leader>l", function()
  require("quicker").toggle({ loclist = true })
end, { desc = "Toggle loclist", })

-- Obsidian
-- #####
map("n", "<leader>tf", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Obsidian quick switch" })

-- Daily note
-- #####

vim.keymap.set("n", "gt", function()
  local path = vim.fn.expand("<cfile>")
  if path == "" then
    print("No file under cursor")
    return
  end

  -- Adjust this to your vault name if needed
  local vault = "monolith"

  -- URL-encode a bit (very minimal)
  local function url_encode(str)
    str = str:gsub(" ", "%%20")
    str = str:gsub("#", "%%23")
    str = str:gsub("%%", "%%%%")
    return str
  end

  local url = "obsidian://open?path=" .. url_encode(path) .. "&vault=" .. url_encode(vault)

  vim.fn.jobstart({ "xdg-open", url }, { detach = true })
end, { desc = "Open md url in obsidian", silent = true })


-- Jump to today's note
-- alternative format demo:
local mono_nav = require("custom.monolith_navigation")
map('n', '<leader>tt', function() mono_nav.jump_daily_note() end, { noremap = true, silent = true })

-- Jump to today's note
-- map('n', '<leader>t', function() require('config.monolith_navigation').jump_daily_note('') end, { desc = "Jump to today's daily note", silent = true })

-- Jump to the previous note
map('n', '<M-Left>', function() mono_nav.jump_daily_note('backward') end, { desc = "Jump to the previous daily note", silent = true })
map('n', '<leader>tj', function() mono_nav.jump_daily_note('backward') end, { desc = "Jump to the previous daily note", silent = true })
map('n', '<leader>tp', function() mono_nav.jump_daily_note('backward') end, { desc = "Jump to the previous daily note", silent = true })

-- Jump to the next note
map('n', '<M-Right>', function() mono_nav.jump_daily_note('forward') end, { desc = "Jump to the next daily note", silent = true })
map('n', '<leader>tk', function() mono_nav.jump_daily_note('forward') end, { desc = "Jump to the next daily note", silent = true })
map('n', '<leader>tn', function() mono_nav.jump_daily_note('forward') end, { desc = "Jump to the next daily note", silent = true })


-- Speech to text using justfile command "just -g ppt"
map('n', '<leader>tv', function()
  local buf = vim.api.nvim_create_buf(false, true)

  local width  = math.floor(vim.o.columns * 0.6)
  local height = 10
  local row    = math.floor((vim.o.lines - height) / 2)
  local col    = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen("just -g ptt", {
    on_exit = function()
      vim.api.nvim_win_close(win, true)
      vim.schedule(function()
        local lines = vim.fn.readfile("/tmp/text.txt")
        if #lines > 0 then
          local pos = vim.api.nvim_win_get_cursor(0)
          vim.api.nvim_buf_set_text(0, pos[1] - 1, pos[2], pos[1] - 1, pos[2], lines)
        end
      end)
    end,
  })

  vim.cmd("startinsert")
end, { desc = "Speech-to-text (push-to-talk)" })


