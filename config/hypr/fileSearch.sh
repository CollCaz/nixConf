#!/usr/bin/env bash

exclude='/go'

rofiCommand="rofi -async-pre-read 1 -dmenu"

function find() {
  fd -a --exclude $exclude --base-directory $1 --hidden
}

toSearch=$(find ~/ && find ~/.local/share/bottles/bottles/)

pkill tofi || OUTPUT=$(echo "$toSearch" | $rofiCommand)
echo "$OUTPUT"

if [ "$OUTPUT" ]; then
  kitty -e yazi "$OUTPUT"
fi
