# Dotfiles Cheatsheet (Sharanga)

## Setup Summary

Dotfiles are managed using a **bare git repo** at `~/.dotfiles`.
The working tree is `~` (home directory).
Remote: `git@github.com:amanahuja/dotconfigs.git` (branch: `main`)

The `dotfiles` alias is defined in `~/.bashrc`:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Files are **opt-in** - only explicitly added files are tracked.
Untracked files are hidden from status output by default.

---

## Common Commands

### See tracked files
```bash
dotfiles ls-files ~
```
> Must be run from `~` or with `~` as argument.

### Check status
```bash
dotfiles status
```

### Add a file to tracking
```bash
dotfiles add ~/.config/nvim/init.lua
```

### Commit changes
```bash
dotfiles commit -m "description of change"
```

### Push to remote
```bash
dotfiles push
```

### Pull from remote
```bash
dotfiles pull
```

### See commit history
```bash
dotfiles log --oneline
```

### See what changed in last commit
```bash
dotfiles show --stat HEAD
```

### Diff uncommitted changes
```bash
dotfiles diff
```

---

## Notes

- Edit config files in their normal locations (`~/.config/nvim/`, `~/.bashrc`, etc.)
- Run `dotfiles add <file>` and `dotfiles commit` when you want to snapshot changes
- `dotfiles status` only shows already-tracked files with changes (untracked files are hidden)
- This cheatsheet is itself tracked: `~/.config/dotfiles-cheatsheet.md`
