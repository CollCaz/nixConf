#!/usr/bin/env bash

modes="active\noutput\nregion\nwindow\n"


tofiCommand="tofi --font /home/coll/.nix-profile/share/fonts/opentype/FiraSans-Regular.otf --num-results=4 --height=25% --width=10% --prompt-text="

pkill tofi || mode=$(echo -e $modes | $tofiCommand)

hyprshot --mode $mode --raw | satty -f -
