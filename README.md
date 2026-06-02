# dotfiles

## Neovim

The Neovim config lives in [`.config/nvim`](.config/nvim) and is loaded by symlinking it into `~/.config/nvim`

### Create the symlink

```sh
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

If `~/.config` doesn't exist yet, create it first:

```sh
mkdir -p ~/.config
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

If `~/.config/nvim` already exists, back it up before linking:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
```

### Verify

```sh
ls -l ~/.config/nvim
# ~/.config/nvim -> ~/dotfiles/.config/nvim
```
