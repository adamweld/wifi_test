#!/bin/bash
# simple script to test and record WiFi signal strength in CSV file
# currently it works with your connected SSID

function test() {
	#iwlist wlxec086b1e55e3 scan | grep Signal
	strength="value"
}

read -p "Enter filename: " filename
#date > "$filename"
#echo "wifi signal strength test" >> "$filename"
echo "Distance,Signal Strength" >> "$filename"
while : 
do
	read -p "Distance: " entry
	if [ "$entry" = "" ]; then
		break
	fi
	test
	echo "${entry},${strength}" >> "$filename"
done
