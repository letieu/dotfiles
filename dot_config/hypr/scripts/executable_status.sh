#!/bin/bash

menu_cmd='bemenu -p  -i -c -W 0.4 -H 30 --hp 5 --fn JetBrainsMono Nerd Font Mono -B 2'

# Get battery status
battery=$(acpi -b | awk '{print $4}' | tr -d ',')

# Get current date
current_date=$(date +"%Y-%m-%d")

# Get current time
current_time=$(date +"%H:%M:%S")

# Combine information with Nerd Font icons
status="  $current_time \n   $current_date \n    $battery "

# Display using bemenu
echo -e "$status" | $menu_cmd
