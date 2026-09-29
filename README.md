# Monochrome Theme
This is a mostly monochrome theme with some shades of warm yellow made by myself.

This repository contains my dotfiles and scripts for both i3 and niri. The keybinds and behaviour remains the same for both window managers.

Make sure you have the following installed:

#### General
- nvim
- kitty
- rofi

#### i3 specific
- i3
- polybar
- picom

#### niri specific
- niri
- waybar

## Installation
To install, clone this repository:

`git clone https://github.com/CaioSommerOzorio/dotfiles`

Then give permissions to the `setup.sh` script and run it:
```
```chmod +x setup.sh && ./setup.sh```

**WARNING**: This script will replace your config files, so make a backup if necessary.


The script will copy all configurations regardless of the chosen window manager, so feel free to delete the ones you don't need.

You will need to manually update your `.bashrc`

## Additional configurations
The font used is: NotoSans-Regular.ttf: "Noto Sans" "Regular"

You may also want to configure polybar/waybar to look for your specific music player.

Polybar/waybar also requires network information so make sure it's referencing the correct network interface.

VimTeX uses zathura pdf viewer and the following LaTeX packages:
- texlive-latex 2026.1-1
- texlive-latexextra 2026.1-1
- texlive-latexrecommended 2026.1-1
