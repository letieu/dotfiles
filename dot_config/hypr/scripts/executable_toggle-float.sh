#!/usr/bin/env sh

hyprctl activewindow | grep 'floating: 1' && hyprctl dispatch settiled || hyprctl dispatch setfloating && hyprctl dispatch resizeactive exact 80% 90% && hyprctl dispatch centerwindow
