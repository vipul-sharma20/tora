#!/bin/bash

HOST="<put-raspberry-pi-host-here>"

case $1 in
    -m|--mac)
        MAC_ADDRESS="$2"
        shift
        ;;
    connect)
        echo "Connecting device to speaker."
        ssh $HOST '
        pulseaudio --start
        echo -e "power on\nconnect <put-mac-address-here> \nquit" | bluetoothctl
        '
        ;;
    disconnect)
        echo "Disconnecting device."
        ;;
    *)
        echo "Tora."
        echo $"Usage $0 {connect|disconnect}"
        exit 1
esac
exit 0
