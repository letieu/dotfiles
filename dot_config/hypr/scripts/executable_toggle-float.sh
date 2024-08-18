#!/usr/bin/env sh

hyprctl activewindow | grep 'floating: 1' && hyprctl dispatch settiled || hyprctl dispatch setfloating && hyprctl dispatch resizeactive exact 90% 90% && hyprctl dispatch centerwindow
