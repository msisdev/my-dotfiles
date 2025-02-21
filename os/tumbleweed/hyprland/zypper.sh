#!/bin/bash

echo "💧 zypper"

source ../zypper.sh

packages=(
  "git"
  "hyprland"                    # https://wiki.hyprland.org/Getting-Started/Master-Tutorial/#in-hyprland-with-the-default-config
  "hyprland-devel"
  "hyprland-qtutils"
  "hyprpaper"                   # https://wiki.hyprland.org/Hypr-Ecosystem/hyprpaper/
  "hyprpicker"                  # https://github.com/hyprwm/hyprpicker
  "hyprpolkitagent"             # https://wiki.hyprland.org/Hypr-Ecosystem/hyprpolkitagent/

  "kitty"                       # https://sw.kovidgoyal.net/kitty/
  "fuzzel"
  "mako"                        # https://github.com/emersion/mako

  "qt5-wayland"                 # just a library
  "qt6-wayland"                 # just a library
  
  "waybar"                      # https://wiki.hyprland.org/Useful-Utilities/Status-Bars/
  "wireplumber"                 # 
  "xdg-desktop-portal-hyprland" # https://wiki.hyprland.org/Hypr-Ecosystem/xdg-desktop-portal-hyprland/
)

zypper_install "$(ask_interactive)" "${packages[@]}"
