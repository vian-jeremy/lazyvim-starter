# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).

## Installation

Make a backup of your current Neovim files:

```bash
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

Clone the starter:

```bash
git clone https://github.com/vian-jeremy/dotfiles-nvim ~/.config/nvim
```

Remove the `.git` folder, so you can add it to your own repo later:

```bash
rm -rf ~/.config/nvim/.git
```

Start Neovim!

```bash
nvim
```

Refer to the comments in the files on how to customize LazyVim.