#!/usr/bin/env bash

exclude='/go'

tofiCommand="tofi --font /home/coll/.nix-profile/share/fonts/opentype/FiraSans-Regular.otf --num-results=8 --width=90% --height=45% --num-results=15 --fuzzy-match=true --font-size=12"

function find () {
  fd -a --exclude $exclude --base-directory $1
}

toSearch=$(find ~/ && find ~/.local/share/bottles/bottles/)

pkill tofi || OUTPUT=$(echo "$toSearch" | $tofiCommand)
echo "$OUTPUT"

if [ "$OUTPUT" ]
then
  kitty -e yazi "$OUTPUT"
fi
