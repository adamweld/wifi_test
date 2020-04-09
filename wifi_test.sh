#!/bin/bash
# simple script to test and record WiFi signal strength in CSV file
# currently it works with your connected SSID

function setup() {
    # use ifconfig to find interface names
    # confirm connection to network
    # die if not connected
    # interface="$ifconfig | grep XXX"
    interface="wlxec086b1e55e3"
    return 1
}

function measure() {
    # use iwlist or iswonfig to return performance values
	#iwlist wlxec086b1e55e3 scan | grep Signal
    #strength="${sudo iwlist $interface scanning | grep Signal}"
    #iw newer - iw wlan0 station dump | grep 'signal avg:' iwinfo - doesn't have link quality??
    # iwconfig $interface | grep Link Quality

	measurement="${iwconfig | grep Signal}"
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
    	echo "${entry},${link},${signal}" >> "$filename"
    done
}

# main
setup
test