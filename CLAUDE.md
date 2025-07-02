# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration repository. LazyVim is a Neovim setup that provides sensible defaults and plugin management through lazy.nvim.

## Key Files and Structure

- `init.lua` - Entry point that bootstraps the configuration by requiring `config.lazy`
- `lua/config/` - Core configuration files:
  - `lazy.lua` - Sets up lazy.nvim plugin manager and LazyVim
  - `options.lua` - Custom Neovim options (currently minimal, mostly clipboard notes)
  - `keymaps.lua` - Custom keybindings (line movement with Alt+Up/Down, search with Ctrl+F)
  - `autocmds.lua` - Custom autocommands (currently empty)
- `lua/plugins/` - Custom plugin configurations that extend/override LazyVim defaults
- `lazyvim.json` - LazyVim state file tracking installed extras and version
- `stylua.toml` - Lua code formatting configuration (2 spaces, 120 column width)

## Development Commands

### Formatting
```bash
stylua .
```
Format Lua code according to stylua.toml configuration.

### Installation
The configuration is installed by cloning to `~/.config/nvim` and starting Neovim, which will automatically install plugins via lazy.nvim.

## Architecture Notes

- Built on LazyVim framework which provides base configuration and plugin management
- Plugin configurations in `lua/plugins/` are automatically loaded and merged with LazyVim defaults
- Custom keymaps include Alt+Up/Down for line movement and Ctrl+F for search
- Uses lazy loading for plugins with automatic checking for updates
- Mason is configured to ensure installation of stylua, shellcheck, shfmt, and flake8
- The example.lua plugin file is disabled but shows patterns for extending LazyVim

## Plugin Management

- Plugins are managed through lazy.nvim
- LazyVim plugins are imported automatically
- Custom plugins go in `lua/plugins/` directory
- Plugin updates are checked automatically but notifications are disabled
- Use `:Lazy` command in Neovim to manage plugins interactively

## Customization Patterns

- Override LazyVim defaults by creating files in `lua/plugins/` that return plugin specifications
- Add new keymaps in `lua/config/keymaps.lua` using `LazyVim.safe_keymap_set`
- Add options in `lua/config/options.lua`
- Add autocommands in `lua/config/autocmds.lua`