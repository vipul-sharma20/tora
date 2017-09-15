#!/bin/bash

HOST=""
MAC_ADDRESS=""

case $1 in
    -m|--mac)
        MAC_ADDRESS="$2"
        shift
        ;;
    connect)
        echo "Connecting device to speaker."
        ssh $HOST '
        pulseaudio --kill
        pulseaudio -D
        echo -e "power on\nconnect ${MAC_ADDRESS} \nquit" | bluetoothctl
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
