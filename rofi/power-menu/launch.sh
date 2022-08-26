#!/bin/bash

chosen=$(printf "⏻\n\n" | rofi -dmenu -i -d "Power Menu" -theme ~/.config/rofi/power-menu/theme.rasi)

case "$chosen" in
	"⏻") poweroff ;;
	"") reboot ;;
	"") dm-tool lock ;;
	*) exit 1 ;;
esac
