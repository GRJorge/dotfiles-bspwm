#!/bin/bash

theme="~/.config/rofi/wifi/theme.rasi"

wifiSave=$(nmcli --fields "NAME,TYPE" connection show | grep "wifi" | sed 's/ wifi/ /g') 
wifiList=$(nmcli --fields "SSID" device wifi list)

stateWifi=$(nmcli --fields "WIFI" g | sed 1d)

if [ $stateWifi = "activado" ]; then
	chosenNet=$(printf "$wifiSave\n睊 Desactivar Wifi\n Buscar redes\n Eliminar una red\n Ver contraseña" | rofi -dmenu -i -p "爵 Wifi Menu" -theme $theme)
elif [ $stateWifi = "desactivado" ]; then
	chosenNet=$(printf "直 Activar Wifi" | rofi -dmenu -i -p "爵 Wifi Menu" -theme $theme)
fi


if [[ $chosenNet = "睊 Desactivar Wifi" ]]; then
	nmcli radio wifi off
elif [[ $chosenNet = "直 Activar Wifi" ]]; then
	nmcli radio wifi on
elif [[ $chosenNet = " Buscar redes" ]]; then
	chosenNetNot=$(printf "$wifiList" | rofi -dmenu -i -p "爵 Wifi Selection" -theme $theme)
	password=$(rofi -dmenu -p " Contraseña: " -theme $theme)
	nmcli device wifi connect $chosenNetNot password $password
elif [[ $chosenNet = " Eliminar una red" ]]; then
	chosenNetDelete=$(printf "$wifiSave" | rofi -dmenu -i -p " Borrar red" -theme $theme)
	nmcli connection delete $chosenNetDelete
elif [[ $chosenNet = " Ver contraseña" ]]; then
	viewPassword=$(nmcli device wifi show-password)
	viewPass=$(printf "$viewPassword" | rofi -dmenu -i -p " Ver contraseña" -theme $theme)
else
	nmcli device wifi connect $chosenNet
fi
