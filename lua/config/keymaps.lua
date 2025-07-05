-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--
local map = LazyVim.safe_keymap_set

-- Line Moving
map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Search
map({ "n", "x" }, "<C-f>", "<esc><cmd>/", { desc = "Search" })
--vim.keymap.set("n", "<C-f>", "/", { noremap = true, silent = true })

-- Modern LSP Mappings (v0.11.2 defaults)
-- Note: These are now default in v0.11.2, but explicitly defined for clarity
map("n", "grn", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "grr", vim.lsp.buf.references, { desc = "LSP References" })
map("n", "gra", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
map("n", "gri", vim.lsp.buf.implementation, { desc = "LSP Implementation" })
map("n", "gO", vim.lsp.buf.document_symbol, { desc = "LSP Document Symbols" })

-- Enhanced diagnostic navigation
map("n", "<leader>dx", vim.diagnostic.reset, { desc = "Reset Diagnostics" })
map("n", "<leader>dv", function()
  vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
end, { desc = "Toggle Virtual Lines" })

-- Quick diagnostic float
map("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show Diagnostic Float" })
