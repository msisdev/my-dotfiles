#!/bin/bash

# Plan single folder: ./stow-plan.sh kitty
# Plan all folders: ./stow-plan.sh

source ./stow-folders.sh

plan_folder() {
  local folder="$1"

  echo "🔗 $folder"
  echo ""
  stow -R --simulate -vv -t "$HOME" "$folder"
  echo ""
}

if [ $# -gt 0 ]; then
  # Plan given folder.
  folder="$1"
  if [[ " ${folders[*]} " =~ " ${folder} " ]]; then
    plan_folder "$folder"
  else
    echo "Folder '$folder' not found in the list."
    exit 1
  fi
else
  # Plan all folders.
  for folder in "${folders[@]}"; do
    plan_folder "$folder"
  done
fi
