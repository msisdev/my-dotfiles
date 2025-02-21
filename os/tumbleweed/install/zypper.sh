#!/bin/bash

source ../zypper.sh

packages=(
  "cmake"
  "opi"
)

zypper_install "$(ask_interactive)" "${packages[@]}"
