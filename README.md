# my-dotfiles

My linux dotfiles


## Guide

### New
> You are at a root of repository.

#### Case 1: dotfile is at `~`
```bash
mv ~/.zshrc ./zshrc/
stow -t $HOME --adopt zshrc
```

#### Case 2: dotfile is at `~/.config`
```bash
mv ~/.config/nvim ./nvim/.config/
stow -t $HOME --adopt nvim
```
