#!/bin/bash

j4-dmenu-desktop \
  --usage-log ~/.cache/runner-log \
  --dmenu='bemenu \
    -i \
    --center \
    --bottom \
    --fixed-height \
    --line-height 34 \
    --list 6 \
    --width-factor 0.4 \
    --margin 30 \
    --border 2 \
    --border-radius 12 \
    --prompt " " \
    --fn "JetBrainsMono Nerd Font 14" \
    --tb "#000000" \
    --tf "#ffffff" \
    --nb "#000000" \
    --nf "#ffffff" \
    --hb "#1a1a1a" \
    --hf "#e5c07b" \
    --sb "#333333" \
    --sf "#ffffff" \
    --bdr "#555555"' \
  --term='kitty'
