# This file loaded by .bashrc
# These aliases are public on github
# Additional aliases and local shortcuts are in .bash_private_config

# some more ls aliases
alias ls='ls -F --color' #AA +dd
alias la='ls -A'
alias l='ls -CF'
# directories and tree
# simpler: alias ld='ls -d */' 
# alias ld="ls -ld */ | cut -f1 -d'/'"
alias ld='tree -daC -L 1'
alias dir='tree -ldha -L 2'
# sorted by date 
alias lt='ls -Flat'    
alias ll='ls -alF --sort=extension'

# common aliases
alias ..='cd ..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ff='nautilus .'
alias dua='du -hsx * | sort -h'

# AA Aliases
alias nospace="/usr/bin/rename -e 's/ /_/g;' -e 's/,/_/g;' -e 'y/A-Z/a-z/;'"
alias wallpaper='python /home/aman/wallpaper_roulette/set_wallpaper.py'
alias battery='upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"'
alias installedapps="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
alias tzdiff="tzdiff -0 -f '%a %R %Z'"

## built ops convenience
## xdg-open "$find -type f | fzf | sed 's/^..//g' | tr -d '\n')
alias open='xdg-open "$(find -type f | fzf)"'

## Fooling around area
_cheatsheethelp(){
	curl -s -L cheat.sh/$@ | less -R
}
alias h='_cheatsheethelp'

alias weather='curl https://wttr.in'
alias moon='curl https://wttr.in/Moon'
alias crypto='curl rate.sx'

alias ffind='find -type f | fzf | sed "s/^..//" | tr -d "\n" | xclip -selection c '
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
