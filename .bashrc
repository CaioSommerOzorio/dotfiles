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
