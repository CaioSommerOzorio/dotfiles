#!/bin/bash

BG_ALT=$(grep '^background-alt' ~/.config/polybar/config.ini | awk '{print $3}')

workspaces=$(i3-msg -t get_workspaces | jq -r '.[].name')
current=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')

[[ "$current" =~ ^[0-9]+$ ]] || exit 1
current=$((10#$current))

# Keep numeric workspace names and sort them
mapfile -t sorted < <(
    while read -r n; do
        [[ "$n" =~ ^[0-9]+$ ]] && echo "$((10#$n))"
    done <<< "$workspaces" | sort -nu
)

# Select up to 3 workspaces nearest to the current one
mapfile -t selected < <(
    for n in "${sorted[@]}"; do
        echo "$((n > current ? n - current : current - n)) $n"
    done | sort -n | head -n 3 | awk '{print $2}' | sort -n
)

# Print workspaces, highlighting the current one
for n in "${selected[@]}"; do
    if (( n == current )); then
        printf '%%{B%s} %s %%{B-}' "$BG_ALT" "$n"
    else
        printf ' %s ' "$n"
    fi
done
