#!/bin/bash

packages=(
  "cmake"
  "opi"
)
success=()
failed=()

# zypper?
if ! command -v zypper &> /dev/null; then
  echo "❔zypper is not installed."
  exit 1
fi

# install
for package in "${packages[@]}"; do
  echo "📦Installing $package"

  # -n: non-interactive (yes for all)
  if ! sudo zypper -n in "$package"; then
    echo "❌Error installing $package."
    failed+=("$package")
  else
    success+=("$package")
  fi
done

# success
if [[ ${#success[@]} -gt 0 ]]; then
  echo "✨success:"
  printf "\t%s\n" "${success[@]}"
else
  echo "✨success: (none)"
fi

# failed
if [[ ${#failed[@]} -gt 0 ]]; then
  echo ""
  echo "🔥failed:"
  printf "\t%s\n" "${failed[@]}"
  exit 1
else
  echo ""
  echo "✅All packages installed successfully."
  exit 0
fi
