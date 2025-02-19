#!/bin/bash

# Use this script when making a new npm package

npm-init() {
  # flag
  local git_flag=false

  # short flag
  while getopts "g" opt; do
    case "$opt" in
      g)
        git_flag=true
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
    esac
  done
  shift $(( OPTIND - 1 ))

  # long flag
  for arg in "$@"; do
    if [[ "$arg" == "--git" ]]; then
      git_flag=true
      break
    fi
  done

  # config list
  local license=$(npm get init.license)
  local author_name=$(npm get init.author.name)
  local author_email=$(npm get init.author.email)

  # run
  npm init -y
  if $git_flag; then
    git init
    npx license "$license" -o "$author_name" > LICENSE
    npx gitignore node
    npx covgen "$author_email"

    git add -A
    git commit -m "Initial commit"
  fi
}

npm-init
