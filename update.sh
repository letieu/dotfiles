#!/usr/bin/env bash

echo "Updating the system..."

function add {
  chezmoi add $1
}

add ~/.config/fish
add ~/.config/hypr
add ~/.config/kitty
add ~/.config/ranger
add ~/.config/swappy
add ~/.config/mako
add ~/scripts
add ~/.local/share/applications
add ~/.mozilla/firefox/tieu/chrome

git status
