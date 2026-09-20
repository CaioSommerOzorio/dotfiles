#!/bin/bash

# THIS WILL REMOVE YOUR PREVIOUS CONFIGURAITONS
rsync -av --delete ./.config/* ~/.config/
