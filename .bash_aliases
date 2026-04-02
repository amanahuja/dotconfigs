# ~/.bash_aliases: 
# customized; sharable, may commit to public repo
# @aman updated Jan 2026; originally for Sharanga
# Note this file does not include private directories or instructions, those are in ~/bash_private_config

# Classic LS aliases some more ls aliases
alias ll='ls --color=auto -AlhFS'
alias la='ls -A'
alias l='ls -AlFt'
alias ls='ls -A1'
alias ls="ls --color=auto -1h --group-directories-first"

# git aliases. See also aliases in .gitconfig
alias gs='git status'
alias gitlog="git log --oneline | fzf --preview 'git show --name-only {1}'"

## Common operation aliases - 
alias bashconf='nvim -O ~/.bashrc ~/.bash_private_config ~/.bash_aliases && source ~/.bashrc'
alias vimconf='nvim ~/.config/nvim/' 
alias vdiff='nvim -d'
alias vdif='nvim -d'
alias printsyslog='sudo dmesg -T -l err | tail -30 | bat'
alias checksession='echo "xdg_session_type: $XDG_SESSION_TYPE"'

## Managing dotconfigs repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dotlazy='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

## finding and fzf stuff
#

function ff() {
  fd "$@" | fzf --multi --height=80% --preview "bat --style=numbers --color=always --line-range=:100 {}"
}

## these older versions use find: 
# alias ff="find . -type f -not -path './.*/*' | fzf --multi --height=80% --preview 'less {}'"
# alias vizz="find . -type f -not -path './.*/*' | fzf --reverse --multi --preview 'bat --style=numbers --color=always --line-range=:100 {}' | xargs -d '\n' nvim"

# paste clipboard contents, useful when piping contents to LLM. : `clip | ai "ask a question about the clipboard"`
alias clip="xclip -selection clipboard -o"

## ----------- Application helpers -----------------
## 

## global just file for more aliases
alias kmd='just -g'
## spacevim -- not currently being used
alias svim='nvim -u ~/installs_dir/SpaceVim/vimrc'

alias gomise='eval "$(mise activate bash)" && echo "mise activated"'
alias goenv='source .venv/bin/activate'

# experimental alias, not working
# alias frg="rg --ignore .git -l -g '' | fzf --preview 'less {}'"

## Ai and LLM stuff

## start ollama
alias gollama='sudo systemctl start ollama && sudo systemctl status ollama'
alias stopllama='sudo systemctl stop ollama && sudo systemctl status ollama'

# datasette llm 
# config at ~/.config/io.datasette.llm
# see notes in ~/workspace/aider_reference
alias ai="llm"
alias sai="llm cmd "
# alias webai="llm -f 'site:https://someurl.com/article' "what is this article about?"

## aider with my config in the place I awnt it. 
alias runaider='aider --config ~/.config/aider/.aider.conf.yml'

## ----------- fun / utilities -----------------
#

# fun util aliases
alias weather="curl wttr.in/madison?1pqF"
alias forecast="curl wttr.in/madison"

# helper to create an "alert" for long running commands.  Use like so: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## rarely used, mostly here as a reminder
# 
alias ls-services='sudo systemctl list-units --type=service --state=running'

