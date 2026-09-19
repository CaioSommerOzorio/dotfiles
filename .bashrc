#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\u@\h [\W]\n\$ '
alias cls='clear'
alias c='xclip -selection clipboard'
alias tap='xinput set-prop "ELAN1200:00 04F3:309F Touchpad" "libinput Tapping Enabled" 1'
alias audio='pactl load-module module-native-protocol-tcp port=4656 listen=0.0.0.0 auth-anonymous=true'
export PATH=$PATH:/home/undefined/.spicetify
