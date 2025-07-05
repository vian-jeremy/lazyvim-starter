# LazyVim Configuration - Keymaps Cheatsheet

## Custom Keymaps

### Line Movement
- `Alt+Up` - Move line/selection up
- `Alt+Down` - Move line/selection down
  - Works in Normal, Insert, and Visual modes

### Search
- `Ctrl+F` - Start search (custom override)

### Modern LSP Mappings (v0.11.2)
- `grn` - LSP Rename
- `grr` - LSP References  
- `gra` - LSP Code Action
- `gri` - LSP Implementation
- `gO` - LSP Document Symbols

### Enhanced Diagnostics
- `<leader>dx` - Reset Diagnostics
- `<leader>dv` - Toggle Virtual Lines
- `<leader>df` - Show Diagnostic Float

---

## General Navigation & Movement

### Basic Movement
- `j/k` - Move down/up (respects line wrapping)
- `h/l` - Move left/right
- `w/b` - Word forward/backward
- `0/$` - Beginning/end of line
- `gg/G` - First/last line

### Window Navigation
- `Ctrl+h/j/k/l` - Move between windows
- `Ctrl+Up/Down/Left/Right` - Resize windows
- `<leader>-` - Split window below
- `<leader>|` - Split window right
- `<leader>wd` - Delete window
- `<leader>wm` - Toggle window zoom

### Buffer Management
- `Shift+h/l` - Previous/next buffer
- `[b/]b` - Previous/next buffer (alternative)
- `<leader>bb` - Switch to other buffer
- `<leader>,` - Switch to other buffer (alternative)
- `<leader>bd` - Delete current buffer
- `<leader>bo` - Delete other buffers
- `<leader>bD` - Delete buffer and window

### Tab Management
- `<leader>tab` - Tab management commands

---

## Search & Navigation

### Finding Files & Content
- `<leader><space>` - Find files
- `<leader>ff` - Find files (alternative)
- `<leader>/` - Grep search in project
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `<leader>ss` - Search symbols

### Search Navigation
- `n/N` - Next/previous search result
- `*/#` - Search word under cursor forward/backward

---

## LSP & Code Navigation

### Go To Commands
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `gt` - Go to type definition

### Code Actions
- `<leader>ca` - Code actions
- `<leader>cr` - Rename symbol
- `<leader>cf` - Format document
- `<leader>co` - Organize imports (TypeScript)
- `<leader>cR` - Rename file (TypeScript)

### Diagnostics
- `<leader>cd` - Line diagnostics
- `]d/[d` - Next/previous diagnostic
- `]e/[e` - Next/previous error
- `]w/[w` - Next/previous warning

---

## Editing

### File Operations
- `Ctrl+s` - Save file
- `<leader>fn` - New file

### Comments
- `gcc` - Toggle line comment
- `gc` - Toggle comment (visual mode)
- `gco` - Add comment below
- `gcO` - Add comment above

### Indentation
- `</>` - Indent/unindent in visual mode
- `==` - Auto-indent line
- `gg=G` - Auto-indent entire file

---

## Git Integration

### Git Commands
- `<leader>gg` - Open LazyGit
- `<leader>gs` - Git status
- `<leader>gb` - Git blame
- `<leader>gf` - Git file history
- `<leader>gl` - Git log
- `<leader>gd` - Git diff

---

## Debugging

### Debug Controls
- `<leader>dc` - Debug: Continue/Start
- `<leader>db` - Debug: Toggle breakpoint
- `<leader>dB` - Debug: Conditional breakpoint
- `<leader>di` - Debug: Step into
- `<leader>do` - Debug: Step out
- `<leader>dO` - Debug: Step over
- `<leader>dr` - Debug: REPL
- `<leader>dt` - Debug: Terminate

---

## Terminal & External Tools

### Terminal
- `<leader>ft` - Open terminal (root dir)
- `<leader>fT` - Open terminal (cwd)
- `Ctrl+/` - Toggle terminal

### External Tools
- `<leader>L` - LazyVim changelog
- `<leader>l` - Lazy plugin manager

---

## Toggles & Utilities

### UI Toggles (under `<leader>u`)
- `<leader>uf` - Toggle format on save
- `<leader>us` - Toggle spelling
- `<leader>uw` - Toggle word wrap
- `<leader>ul` - Toggle line numbers
- `<leader>ud` - Toggle diagnostics
- `<leader>uc` - Toggle conceallevel
- `<leader>uh` - Toggle inlay hints
- `<leader>ub` - Toggle background (dark/light)

### Application
- `<leader>qq` - Quit all
- `<leader>qQ` - Quit all (force)

---

## Special Modes

### Visual Mode
- `v` - Character-wise visual mode
- `V` - Line-wise visual mode
- `Ctrl+v` - Block-wise visual mode

### Insert Mode
- `i/a` - Insert before/after cursor
- `I/A` - Insert at beginning/end of line
- `o/O` - New line below/above

---

## Notes

- `<leader>` is typically the space key in LazyVim
- Many commands work in multiple modes (normal, visual, insert)
- Custom line movement with Alt+Up/Down works in all modes
- Ctrl+F is overridden for search functionality
- Most LSP features require a language server to be active
- Git commands require the project to be in a git repository

---

*Generated for LazyVim-based Neovim configuration*