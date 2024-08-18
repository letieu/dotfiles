#!/bin/bash

menu_cmd='bemenu -p  -i -c -W 0.6 -H 30 --hp 5 --fn JetBrainsMono Nerd Font Mono -B 2'

# Display loading message
echo -e "Loading..." | $menu_cmd &

# Get battery status
battery=$(acpi -b | awk '{print $4}' | tr -d ',')

# Get current date
current_date=$(date +"%Y-%m-%d")

# Get current time
current_time=$(date +"%H:%M:%S")

# Get IP address
ip_address=$(ip -o -4 addr show up primary scope global | awk '{print $4}' | cut -d/ -f1)

# Get network name
network_name=$(nmcli -t -f active,ssid dev wifi | grep -E '^yes' | cut -d: -f2)

# Combine information with Nerd Font icons
status="  $current_time \n   $current_date \n    $battery \n     $network_name \n   $ip_address"

# Kill the loading message and display the actual status
pkill -f "$menu_cmd"

echo -e "$status" | $menu_cmd
