# 💤 LazyVim Configuration

A personalized [LazyVim](https://github.com/LazyVim/LazyVim) Neovim configuration with custom keybindings and optimizations.

## Features

### Custom Key Mappings
- **Line Movement**: Use `Alt+Up`/`Alt+Down` to move lines up/down in normal, insert, and visual modes
- **Quick Search**: `Ctrl+F` for fast search functionality (with noice.nvim integration disabled for this key)

### Configuration Structure
- Built on LazyVim framework with sensible defaults
- Custom plugin configurations in `lua/plugins/`
- Core settings in `lua/config/`
- Automatic plugin updates with silent notifications
- Tokyo Night colorscheme as default

### Development Tools
- **Code Formatting**: Stylua configured with 2-space indentation and 120-column width
- **Performance Optimized**: Disabled unnecessary runtime plugins (gzip, tar, zip, etc.)
- **Plugin Management**: Lazy.nvim with automatic update checking

## Installation

Make a backup of your current Neovim files:

```bash
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

Clone this configuration:

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

## Configuration Details

### Directory Structure
```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua         # Plugin manager setup
│   │   ├── keymaps.lua      # Custom key mappings
│   │   ├── options.lua      # Neovim options
│   │   └── autocmds.lua     # Auto commands
│   └── plugins/
│       ├── noice.lua        # Noice plugin customization
│       └── example.lua      # Plugin template (disabled)
├── stylua.toml              # Lua formatting rules
└── lazyvim.json             # LazyVim state file
```

### Key Customizations

#### Line Movement (`lua/config/keymaps.lua:9-14`)
- Move lines up/down with Alt+Arrow keys in all modes
- Maintains proper indentation and selection

#### Search Enhancement (`lua/config/keymaps.lua:17`)
- Quick search with Ctrl+F
- Works in normal and visual modes

#### Plugin Configuration
- **noice.nvim**: Disabled Ctrl+F binding to allow custom search mapping
- **lazy.nvim**: Silent update checking enabled

### Development

Format code with Stylua:
```bash
stylua .
```

### Notes
- Clipboard integration notes for ArchLinux users (requires `wl-clipboard`)
- Use `Ctrl+Shift+V` for pasting in some terminals
- Automatic plugin updates check enabled but notifications disabled for clean workflow

## Customization

Refer to [LazyVim documentation](https://www.lazyvim.org/) for extensive customization options. This configuration provides a solid foundation while maintaining LazyVim's flexibility.