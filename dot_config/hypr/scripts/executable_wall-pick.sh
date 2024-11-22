#!/bin/bash

# Check if a directory is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory=$1

# Check if the provided argument is a directory
if [ ! -d "$directory" ]; then
    echo "The specified path is not a directory: $directory"
    exit 1
fi

# Temporary file to store the selected file path
temp_file=$(mktemp)

# Open ranger to select an image from the specified directory and store the path in the temporary file
ranger --choosefile="$temp_file" "$directory"

# Read the selected file path from the temporary file
image_path=$(cat "$temp_file")

# Remove the temporary file
rm "$temp_file"

# Check if a file was selected
if [ -z "$image_path" ]; then
    echo "No file selected."
    exit 1
fi

# Preview the selected image using feh
feh --bg-scale "$image_path"

# Ask for confirmation to set the wallpaper
read -p "Do you want to set this image as your wallpaper? (y/n): " confirm

if [ "$confirm" = "y" ]; then
    # Get the monitor name
    monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')

    # Convert to absolute path if the image path is not absolute
    if [[ "$image_path" != /* ]]; then
        image_path="$(pwd)/$image_path"
    fi

    # Set the wallpaper using hyprctl
    if [ -f "$image_path" ]; then
        echo "hyprctl hyprpaper unload all"
        hyprctl hyprpaper unload all
        
        echo "hyprctl hyprpaper preload $image_path"
        hyprctl hyprpaper preload "$image_path"

        echo "hyprctl hyprpaper wallpaper $monitor, $image_path"
        hyprctl hyprpaper wallpaper "$monitor, $image_path"

        # move to use.png for persistent
        cp $image_path ~/.config/hypr/wallpapers/use.png
    else
        echo "Image file does not exist: $image_path"
    fi
else
    echo "Wallpaper change canceled."
fi
