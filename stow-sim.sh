#!/bin/bash

source ./stow-folders.sh

for folder in "${folders[@]}"; do
  echo "🔗 $folder"
  echo ""
  stow -R --simulate -vvv -t "$HOME" "$folder"
  echo ""
done
