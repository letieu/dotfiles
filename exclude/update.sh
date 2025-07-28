#!/usr/bin/env bash

echo "Updating the system..."

function add {
  chezmoi add $1
  echo  "Added $1"
}

add ~/.config/fish
add ~/.config/kitty
add ~/.config/ranger
add /mnt/c/Users/tieu.le/.config/wezterm
add ~/scripts
add ~/.gitconfig
add ~/.ssh/config

git status
