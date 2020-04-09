#!/bin/sh
# simple script to test and record WiFi signal strength in CSV file
# currently it works with your connected SSID

function measure() {
	measurement=$(iwconfig | grep Signal)
    link="${measurement#*=}"
    signal="${link#*=}"
    link="${link%/*}"
    signal="${signal% *}"

    return 1
}

function test() {
    read -p "Enter filename: " filename
    echo "distance,link_quality,signal_strength" >> "$filename"
    while : 
    do
    	read -p "Distance: " entry
    	if [ "$entry" = "" ]; then
    		break
    	fi
    	measure
    	echo "$entry,$link,$signal" >> "$filename"
        echo "Link Quality = $link/70, Signal Strength = $signal dBm"
    done
}

# main
test