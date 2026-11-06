#!/bin/bash

current=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')

echo "$current"
