#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='xclip -selection clipboard'
PS1='\u@\h [\W]\n\$ '
alias cls="clear && printf '\e[3J'"
. /etc/os-release
osname=${NAME,,}
cowsay bros using ${osname// linux/} btw

install_date=$(stat -c %Y / 2>/dev/null)
current_date=$(date +%s)
age_days=$(((current_date - install_date) / 86400))

echo "System age: $age_days days"
