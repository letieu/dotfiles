#!/usr/bin/env bash

# history | grep 'sudo pacman -S'
sudo pacman -S less
sudo pacman -S --needed base-devel git
sudo pacman -S htop
sudo pacman -S neovim
sudo pacman -S zoxide
sudo pacman -S tldr
sudo pacman -S skim
sudo pacman -S ranger
sudo pacman -S openssh
sudo pacman -S inetutils
sudo pacman -S docker
sudo pacman -S docker-compose

# history search --contains "yay -S"
yay -S chezmoi
yay -S libpg
yay -S ripgrep
yay -S fd
yay -S skim
