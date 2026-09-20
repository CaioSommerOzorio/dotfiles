# Monochrome Theme
This is a mostly monochrome theme with some shades of yellow completely made by myself.

It is primarily meant to be used on Arch, but it should work on any distro that can run the following:
- nvim
- polybar
- kitty
- picom
- rofi
- i3

## Installation
To install, clone this repository:

`git clone https://github.com/CaioSommerOzorio/dotfiles`

Then give permissions to the `setup.sh` script and run it:
`chmod +x setup.sh && ./setup.sh`

**WARNING**: This script will replace your config files, so make a backup if necessary.

You will need to manually update your `.bashrc`

## Additional configurations
The font used is: NotoSans-Regular.ttf: "Noto Sans" "Regular"

If you want the music tracker on the bar to work, either change `polybar/config.ini` to match your music player, or install spotifast from the AUR, which I use.

Polybar may also require network configuration so make sure it's referencing the correct network interface.

VimTeX uses zathura pdf viewer and the following LaTeX packages:
- texlive-latex 2026.1-1
- texlive-latexextra 2026.1-1
- texlive-latexrecommended 2026.1-1
