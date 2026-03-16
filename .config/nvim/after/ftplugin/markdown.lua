vim.opt_local.conceallevel = 1
vim.opt_local.textwidth = 75

-- Folding configuration for markdown headings
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.MarkdownFoldLevel()"
vim.opt_local.foldlevel = 2  -- Start with h1 and h2 sections unfolded, h3+ can be folded

-- Custom fold expression for markdown headings
function _G.MarkdownFoldLevel()
  local line = vim.fn.getline(vim.v.lnum)
  local heading = line:match("^(#+)%s")
  
  if heading then
    return ">" .. #heading
  end
  
  return "="
end
