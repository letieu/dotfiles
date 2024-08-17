#!/bin/bash

send_vol_notification() {
    hyprctl dismissnotify # dismiss all notifications
    local volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
    hyprctl notify -1 2000 "rgb(ff0000)" " 󰕾 : ${volume} "
}

send_mute_notification() {
    local muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no' | head -1)
    if [ "$muted" == "yes" ]; then
        hyprctl notify -1 2000 "rgb(ff0000)" "  󰖁 Muted  "  # Nerd Font icon for mute
    else
        hyprctl notify -1 2000 "rgb(00ff00)" "  󰕾 On  "  # Nerd Font icon for unmute
    fi
}

# Change the volume
case $1 in
    up)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        send_vol_notification
        ;;
    down)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        send_vol_notification
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        send_mute_notification
        ;;
    *)
        echo "Usage: $0 {up|down|mute}"
        exit 1
        ;;
esac
