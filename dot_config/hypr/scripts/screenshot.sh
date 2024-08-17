#!/usr/bin/env sh

temp_screenshot="/tmp/screenshot.png"

case $1 in
s) # draw a selection or click to select a window
	grimblast copysave area $temp_screenshot && swappy -f $temp_screenshot ;;
m) # print focused monitor
	grimblast copysave output $temp_screenshot && swappy -f $temp_screenshot ;;
*) # invalid option
  echo "Invalid option: $1" && exit 1 ;;
esac

rm "$temp_screenshot"
