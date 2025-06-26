#!/bin/bash

# Function to send a notification
send_notification() {
    local brightness=$(brightnessctl get)
    local max_brightness=$(brightnessctl max)
    local brightness_percent=$((brightness * 100 / max_brightness))

    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "󰃟  ${brightness_percent} %"
}

# Change the brightness
case $1 in
    up)
        brightnessctl set 5%+
        ;;
    down)
        brightnessctl set 5%-
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac

# Send the notification
send_notification
