#!/bin/bash

source ./stow-folders.sh

echo "⚠️  stow is about to land."
echo "Are you sure?: [yes]"
read continue
if [[ "$continue" != "yes" ]]; then
  echo "stow aborted."
  exit 1
fi

for folder in "${folders[@]}"; do
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
done
