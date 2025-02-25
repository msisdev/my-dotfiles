#!/bin/sh

# NOW=$(date +%s)
# grim -g "$(slurp)" -t jpeg $HOME/Pictures/ScreenShot-$NOW.jpg
grim -g "$(slurp)" - | swappy -f -
