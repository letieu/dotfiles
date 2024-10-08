#!/bin/bash

# Get the list of workspaces
workspaces=$(hyprctl workspaces)

# Get the current workspace ID
current_workspace=$(hyprctl activeworkspace | awk '/workspace ID/ {print $3}')

menu_cmd='bemenu -p 󰯉 -i -c -W 0.6 -H 30 --hp 5 --fn JetBrainsMono Nerd Font Mono -B 2'

# Parse the workspaces and format them for dmenu
menu_items=$(echo "$workspaces" | awk -v current="$current_workspace" '
/workspace ID/ {
    if (id) {
        if (id == current) {
            print "[" id "] " title " (" windows ") *"
        } else {
            print "[" id "] " title " (" windows ")"
        }
    }
    id = $3
    title = ""
    windows = 0
}
/lastwindowtitle:/ {
    title = $2
}
/windows:/ {
    windows = $2
}
END {
    if (id) {
        if (id == current) {
            print "[" id "] " title " (" windows ") *"
        } else {
            print "[" id "] " title " (" windows ")"
        }
    }
}')

# sort the workspaces by ID
menu_items=$(echo "$menu_items" | sort -n)

# Show the menu and get the selected workspace
selected=$(echo "$menu_items" | $menu_cmd | awk '{print $1}')

# Extract the workspace ID from the selected item
workspace_id=$(echo "$selected" | awk -F'[][]' '{print $2}')

# Switch to the selected workspace
hyprctl dispatch workspace "$workspace_id"
