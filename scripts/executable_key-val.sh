#!/usr/bin/bash
# vim:ft=bash

menu="bemenu --fixed-height -c -p KV -i -l 5 -W 0.3 -H 30 --hp 5 --fn JetBrainsMono Nerd Font Mono -B 2"
cat $HOME/note/key-val.md | $menu | cut -d',' -f2 | tr -d '\n' | wl-copy 2>/dev/null
