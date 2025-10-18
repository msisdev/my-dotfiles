fish_add_path \
    $HOME/.local/bin \
    $HOME/bin \
    $HOME/.cargo/bin \
    /usr/local/sbin \
    /usr/local/bin \
    /usr/sbin \
    /usr/bin \
    /sbin \
    /bin \
    /usr/games \
    /usr/local/games \
    /snap/bin

if status is-interactive
	fastfetch
end

