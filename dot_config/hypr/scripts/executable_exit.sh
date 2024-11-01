#!/bin/bash

menu_cmd='bemenu -p 󰯉 -i -c -W 0.5 -H 30 --hp 5 --fn JetBrainsMono Nerd Font Mono -B 2'

menu_items="Reload\nShutdown\nReboot"

selected=$(echo -e "$menu_items" | $menu_cmd)

echo "$selected"

case $selected in
    Reload)
        hyprctl reload
        ;;
    Shutdown)
        hyprctl notify 1 2000 "rgb(ff0000)" "  Shutting down... "
        shutdown now
        ;;
    Reboot)
        hyprctl notify 1 2000 "rgb(00ff00)" "  Rebooting... "
        reboot
        ;;
    *)
        exit 1
        ;;
esac
