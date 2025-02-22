#!/bin/bash

# Stow single folder: ./stow.sh kitty
# Stow all folders: ./stow.sh

source ./stow-folders.sh

echo "⚠️  stow is about to land."
echo "Are you sure?: [yes]"
read continue
if [[ "$continue" != "yes" ]]; then
  echo "stow aborted."
  exit 1
fi

stow_folder() {
  local folder="$1"

  echo "🔗 $folder"
  echo ""
  result=$(stow -v -t "$HOME" "$folder")

  if [[ -z "$result" && $? -eq 0 ]]; then
    echo "(no change)"
  elif [[ $? -ne 0 ]]; then
    echo "Error: $result"
  else
    echo "$result"
  fi

  echo ""
}

if [ $# -gt 0 ]; then
  # Stow given folder.
  folder="$1"
  stow_folder "$folder"
else
  # Stow all folders.
  for folder in "${folders[@]}"; do
    stow_folder "$folder"
  done
fi
