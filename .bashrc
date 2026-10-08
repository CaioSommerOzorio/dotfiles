#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias c='xclip -selection clipboard'
PS1='\u@\h [\W]\n\$ '
alias cls="printf '\033[2J\033[3J\033[1;1H'"
. /etc/os-release
osname=${NAME,,}
cowsay bros using ${osname// linux/} btw
