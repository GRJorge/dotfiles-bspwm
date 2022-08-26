#!/bin/bash

chosen=$(printf "\n\n\n" | rofi -dmenu -i -p "Screenshot" -theme ~/.config/rofi/screenshot/theme.rasi)

case "$chosen" in
	"") sleep 0.3 
		flameshot gui;;
	"") flameshot screen ;;
	"") flameshot full ;;
	"") flameshot config;;
	*) exit 1 ;;
esac
