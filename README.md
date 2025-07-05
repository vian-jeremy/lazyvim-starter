# 💤 LazyVim Configuration

A personalized [LazyVim](https://github.com/LazyVim/LazyVim) Neovim configuration with custom keybindings and optimizations.

## Features

### Modern Neovim v0.11.2 Support
- **Built-in LSP Completion**: Leverages Neovim's native LSP completion capabilities
- **Enhanced Diagnostics**: Modern diagnostic configuration with virtual text and optional virtual lines
- **New Default Mappings**: Includes v0.11.2 standard LSP mappings (grn, grr, gra, etc.)
- **Smart Clipboard Integration**: Advanced multi-environment clipboard detection and fallback

### Custom Key Mappings
- **Line Movement**: Use `Alt+Up`/`Alt+Down` to move lines up/down in normal, insert, and visual modes
- **Quick Search**: `Ctrl+F` for fast search functionality (with noice.nvim integration disabled for this key)
- **LSP Enhanced**: Modern LSP mappings with buffer-specific keybindings
- **Diagnostic Controls**: Toggle virtual lines, reset diagnostics, and quick diagnostic float

### Configuration Structure
- Built on LazyVim framework with sensible defaults
- Custom plugin configurations in `lua/plugins/`
- Core settings in `lua/config/`
- Language-specific configurations for Python, C/C++, Rust, Go, Lua, and more
- Comprehensive autocommands for modern workflow
- Automatic plugin updates with silent notifications
- Tokyo Night colorscheme as default

### Development Tools
- **Multi-Language Support**: Enhanced LSP configurations for 10+ languages
- **Code Formatting**: Stylua configured with 2-space indentation and 120-column width
- **Performance Optimized**: Disabled unnecessary runtime plugins, leverages v0.11.2 performance improvements
- **Plugin Management**: Lazy.nvim with automatic update checking
- **Modern Tooling**: Integrated terminal, enhanced git support, and advanced search/replace

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

## Recent Enhancements (v0.11.2 Compatible)

### Modern LSP Features
- **Native Completion**: Enabled `vim.lsp.completion.enable()` for built-in LSP completion
- **Enhanced Diagnostics**: Virtual text only on current line, with optional virtual lines toggle
- **Standard Mappings**: Added v0.11.2 default LSP mappings (grn, grr, gra, gri, gO)
- **Buffer-specific LSP**: Enhanced autocommands for LSP attachment with buffer-local keymaps

### Language Support
- **Python**: Pyright + Ruff with optimized settings
- **C/C++**: Clangd with advanced features (background index, clang-tidy)
- **Rust**: rust-tools.nvim with inlay hints and cargo integration
- **Go**: go.nvim with gofumpt and gopls integration
- **SystemVerilog/Verilog**: Hardware development support
- **YAML**: Schema validation for Kubernetes, GitHub Actions, Docker Compose
- **And more**: Lua, JSON, Dockerfile, Shell scripting support

### Modern Workflow
- **Auto-save**: Intelligent auto-save on focus lost and buffer leave
- **Smart Navigation**: Relative line numbers toggle, cursor line in active window only
- **Directory Creation**: Auto-create directories when saving new files
- **Enhanced Git**: Blame integration with gitsigns
- **Terminal**: Integrated toggleterm for better terminal management

## Customization

Refer to [LazyVim documentation](https://www.lazyvim.org/) for extensive customization options. This configuration provides a solid foundation while maintaining LazyVim's flexibility.