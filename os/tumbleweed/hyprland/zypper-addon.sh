#!/bin/bash

echo "💧 zypper-addon"

source ../zypper.sh

packages=(

)

zypper_install "$(ask_interactive)" "${packages[@]}"
