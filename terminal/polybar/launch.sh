#!/usr/bin/env bash

killall -q polybar

# background: 44pt
# entry: 12pt
# space: 4pt

polybar -r timebackground &
polybar -r workspacebackground &
polybar -r cpubackground &
polybar -r rambackground &
polybar -r batterybackground &
polybar -r volumebackground &
polybar -r meterbackground &

sleep 0.1

polybar -r timeheader &
polybar -r time &
polybar -r timefooter &

polybar -r workspaceheader &
polybar -r workspaces &
polybar -r workspacefooter &

polybar -r cpuheader &
polybar -r cpu &
polybar -r cpufooter &

polybar -r ramheader &
polybar -r ram &
polybar -r ramfooter &

polybar -r batteryheader &
polybar -r battery &
polybar -r batteryfooter &

polybar -r volumeheader &
polybar -r volume &
polybar -r volumefooter &

polybar -r meterheader &
polybar -r meter &
polybar -r meterfooter &
