#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/apps.rasi"

# Links
terminal=""
files=""
editor=""
browser=""
music=""

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music"

chosen="$(echo -e "$options" | $rofi_command -p "más usadas" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
		if [[ -f /usr/bin/kitty ]]; then
			kitty &
		else
			msg "Terminal no encontrada"
		fi
        ;;
    $files)
		if [[ -f /usr/bin/pcmanfm ]]; then
			pcmanfm &
		else
			msg "Explorador de archivos no encontrado"
		fi
        ;;
    $editor)
		if [[ -f /usr/bin/nvim ]]; then
			nvim &
		else
			msg "Editor no encontrado"
		fi
        ;;
    $browser)
		if [[ -f /usr/bin/firefox ]]; then
			firefox &
		else
			msg "Navegador no encontrado"
		fi
        ;;
    $music)
		if [[ -f /usr/bin/lxmusic ]]; then
			lxmusic &
		else
			msg "Reproductor de música no encontrado"
		fi
        ;;
esac
