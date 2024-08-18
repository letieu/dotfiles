#!/usr/bin/env bash

selected=$(nmcli device wifi list | sk | awk -F 'In' '{print $1}' | awk '{$1 = ""; print $0}' | xargs)

nmcli device wifi connect "$selected" --ask
