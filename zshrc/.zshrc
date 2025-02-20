# Created by newuser for 5.9

# plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# fastfetch
if [[ -o interactive ]]; then
  fastfetch
fi

# bindkey
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
