# This file loaded by .bashrc

# some more ls aliases
alias ls='ls -F --color' #AA +dd
alias ld='ls -d */' 
alias lt='ls -alF --sort=extension'
alias ll='ls -Flat'
alias la='ls -A'
alias l='ls -CF'

# AA Aliases
alias nospace="rename -e 's/ /_/g;' -e 's/,/_/g;' -e 'y/A-Z/a-z/;'"
alias wallpaper='python /home/aman/wallpaper_roulette/set_wallpaper.py'
alias battery='upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"'
alias installedapps="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias dir='ls -lha'
alias ff='nautilus .'
alias dua='du -hsx * | sort -h'
