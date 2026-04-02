# Aman's dotfiles

Personal backup and sync of configuration. 
* My dotfiles are managed with a **bare git repository**, with `$HOME` as the working tree.
* This approach requires no symlinks. 
* Config files live in their normal locations. 
* Files must be explicitly added, so nothing is accidentally committed.

## Setup

```bash
git init --bare ~/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config status.showUntrackedFiles no
dotfiles remote add origin git@github.com:amanahuja/dotconfigs.git
```

## Using the alias 

Add the alias to `~/.bashrc` or `~/.bash_aliases` to persist it across sessions:

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.bashrc
source ~/.bashrc
```

The alias makes `dotfiles` behave exactly like `git`, but scoped to my home directory and bare repo. 
* bonus: I can run it from any directory, which is handy

Examples: 
```
# Track a new file
dotfiles add ~/.config/alacritty/alacritty.toml

# Commit and push
dotfiles commit -m "update alacritty config"
dotfiles push

# See all tracked files
dotfiles ls-files ~
```

## Why this approach

- No symlinks to manage or break
- Files stay in their standard locations
- Explicit opt-in tracking — secrets and private configs are never accidentally added
- Works with standard git tooling
