#!/bin/bash

chosen=$(printf "Ingles\nLatam" | rofi -dmenu -p " Teclado" -i -theme ~/.config/rofi/keyboards/theme.rasi)

case "$chosen" in
	"Ingles") setxkbmap us;;
	"Latam") setxkbmap latam;;
	*) exit 1;;
esac
