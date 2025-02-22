#!/bin/bash

echo "💧 zypper-addon"

source ../zypper.sh

packages=(
  "blueman"       # https://github.com/blueman-project/blueman
  "hyprcursor"    # https://wiki.hyprland.org/Hypr-Ecosystem/hyprcursor/
  "hyprpicker"    # https://github.com/hyprwm/hyprpicker
  "playerctl"
)

zypper_install "$(ask_interactive)" "${packages[@]}"
