#!/usr/bin/env bash

app=$(tofi-drun --font /home/coll/.nix-profile/share/fonts/opentype/FiraSans-Regular.otf --num-results=8 --terminal="kitty -e" --ascii-input=true)

hyprctl dispatch exec "$app"
