#!/bin/bash

# If already running, just toggle the special workspace
if pgrep -f "chatgpt.com" > /dev/null; then
  hyprctl dispatch togglespecialworkspace pad
  exit
fi

# Launch Firefox with custom class (name)
firefox-developer-edition --name chatgpt-panel --new-window https://chat.openai.com
