#!/bin/bash

# Usage: interactive=$(ask_interactive)
ask_interactive() {
  while true; do
    read -r -p "💬 Interactive install? (y/n): " interactive
    case "$interactive" in
      y) return 0 ;;
      n) echo "-n"; return 0 ;;
      *) echo "💬 Please enter 'y' or 'n'." ;;
    esac
  done
}

# Usage:
#   zypper_install "-in" "${packages[@]}"
#   zypper_install "$(ask_interactive)" "${packages[@]}"
zypper_install() {
  local interactive="$1"
  shift

  local packages=("$@")
  local success=()
  local failed=()

  # zypper?
  if ! command -v zypper &> /dev/null; then
    echo "📦❔ zypper is not installed."
    return 1  # Return error code
  fi

  for package in "${packages[@]}"; do
    echo "📦 Installing $package"

    if ! sudo zypper $interactive in --no-recommends "$package"; then
      echo "📦❌ Error installing $package."
      failed+=("$package")
    else
      success+=("$package")
    fi
  done

  # success
  echo "📦✨ success:"
  if [[ ${#success[@]} -gt 0 ]]; then
    printf "\t%s\n" "${success[@]}"
  else
    echo "\t(none)"
  fi

  # failed
  if [[ ${#failed[@]} -gt 0 ]]; then
    echo ""
    echo "📦🔥 failed:"
    printf "\t%s\n" "${failed[@]}"
    return 1 # Return error code if any package failed
  else
    echo ""
    echo "📦✅ All packages installed successfully."
    return 0 # Return success code
  fi
}
