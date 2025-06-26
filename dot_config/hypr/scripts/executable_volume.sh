#!/bin/bash

send_vol_notification() {
    hyprctl dismissnotify # dismiss all notifications
    local volume=$(wpctl get-volume @DEFAULT_SINK@)
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low "󰕾  ${volume} %"
}

# Change the volume
case $1 in
    up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        send_vol_notification
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        send_vol_notification
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        send_vol_notification
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac
