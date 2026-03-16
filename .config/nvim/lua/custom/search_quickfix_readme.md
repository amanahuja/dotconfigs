# Quickfix File Search Workflow

## Overview

A custom fzf-lua feature that enables searching within files already collected in the quickfix list. Use any method to populate quickfix, then search only within those specific files.

## The Workflow

1. **Populate**: Use any search tool to populate quickfix (`:grep`, `:vimgrep`, LSP references, etc.)
2. **Review**: Check results with `:copen` to see collected files
3. **Search**: Press `<leader>fq` → opens `live_grep` searching only files in quickfix
4. **Refine**: Type search terms, see results only from quickfix files
5. **Navigate**: Press `<Enter>` to open file, or `<C-q>` to send to quickfix

## Use Cases

- Search within LSP "Find References" results
- Refine results from a broad `:grep` or `:vimgrep` search
- Search within files from previous search sessions (quickfix persists)
- Combine with other vim tools that populate quickfix (git grep, make, linters, etc.)

## Implementation Details

### How It Works

The `SearchQuickfix` function:
1. Reads all items from the current quickfix list
2. Extracts unique file paths via buffer numbers (`nvim_buf_get_name`)
3. Launches `live_grep` with `filespec` parameter limiting search to those files
4. Handles file paths with spaces via shell escaping

### Key Mapping

- `<leader>fq`: Search within quickfix files

## Comparison with Two-Stage Grep

**Quickfix approach**: Use external tools to filter files → search within those files
**Two-stage grep**: Filter files via fzf grep results → search within filtered files

Both achieve similar goals through different workflows. The quickfix approach integrates with vim's broader ecosystem, while two-stage grep stays entirely within fzf-lua.
