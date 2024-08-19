#!/usr/bin/env sh

# Get the output of hyprctl clients
output=$(hyprctl clients)

# window -> workspace
declare -A windows
while IFS= read -r line; do
    if [[ $line == Window* ]]; then
        window_id=$(echo $line | awk '{print $2}')
        windows[$window_id]=""
    elif [[ $line == *workspace:* ]]; then
        workspace=$(echo $line | awk '{print $2}')
        windows[$window_id]=$workspace
    fi
done <<< "$output"

echo "${!windows[@]}"
for window_id in "${!windows[@]}"; do
    echo "Window: $window_id, Workspace: ${windows[$window_id]}"
done

# Get the output of hyprctl activewindow
current_workspace=$(hyprctl activewindow | awk '/workspace:/ {print $2}')
current_window=$(hyprctl activewindow | awk '/Window/ {print $2}')

hyprctl dispatch togglegroup

for window_id in "${!windows[@]}"; do
    if [[ $window_id == $current_window ]]; then
        continue
    fi

    workspace=${windows[$window_id]}
    if [[ $workspace == $current_workspace ]]; then
        hyprctl dispatch cyclenext r
        hyprctl dispatch moveintogroup r
        hyprctl dispatch moveintogroup l
    fi
done

hyprctl dispatch cyclenext r
