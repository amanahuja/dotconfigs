# Custom FZF Two-Stage Grep Workflow

## Overview

A custom fzf-lua feature that enables progressive filtering through a two-stage grep process. The first stage filters files by content, the second stage searches within those filtered files.

## The Workflow

1. **Start**: Normal `live_grep` → type "foo bar", see results interactively
2. **Narrow**: Press `<Enter>` → extract matching files from current visible results, start NEW `live_grep` on just those files
3. **Search**: Type "radical", see results only from filtered files
4. **Collect**: Press `<C-q>` → send to quickfix (existing fzf-lua feature)
5. **Work**: Use existing quickfix workflow in vim

## Use Cases

- Find files with specific tags/frontmatter, then search for content within them
- Find files that reference a person/topic, then locate specific information
- Progressive narrowing of search corpus in large codebases or note collections

## Implementation Details

### Behavior: Option B (Filtered Results)

When `<Ctrl-6>` is pressed, it takes **all files from currently displayed results** (after filtering), consistent with fzf-lua's existing `<C-q>` behavior.

**Example:**
1. Type "foo bar" → 100 matches in 20 files
2. Refine to "foo bar baz" → 10 matches in 3 files  
3. Press `<Enter>` → new grep searching only those 3 visible files
4. Type "radical" → find matches in just those 3 files
5. Press `<C-q>` → send final results to quickfix

### Recursive Narrowing

The feature can be used recursively - you can press `<Enter>` multiple times to progressively narrow your search through multiple stages.

## Configuration

Custom keymaps added to fzf-lua:
- `<Enter>`: Narrow search to all visible results (select-all + launch new live_grep)
- `<C-o>`: Open file directly (no narrowing)
- `<C-q>`: Send results to quickfix (existing fzf-lua feature)
- `<Ctrl-6>`: Alternative keybinding for narrow (same as Enter)
- `<C-n>` / `<C-p>`: Navigate up/down (preserved, standard vim navigation)
- `<Tab>`: Toggle selection (preserved, for quickfix workflow)
