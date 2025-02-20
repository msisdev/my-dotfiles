#!/bin/bash

folders=(
  "bin"
  "fastfetch"
  "nvim"
  "zshrc"
)

for folder in "${folders[@]}"; do
  # -n: ignore existing content
  stow -t "$HOME" -n "$folder"
done
