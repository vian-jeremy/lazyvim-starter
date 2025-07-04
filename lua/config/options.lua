-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Clipboard Configuration
-- Custom clipboard provider that uses our existing clipboard utilities
-- Works with standard desktop environments and remote SSH sessions (EVIDEN)
local function setup_clipboard()
  -- Path to our custom clipboard utilities
  local clipboard_copy = vim.fn.expand("~/dotfiles/bin/dual-clipboard-copy")
  local tmux_copy = vim.fn.expand("~/dotfiles/bin/tmux-clipboard-copy")
  
  -- Check if we're in a tmux session
  local in_tmux = vim.env.TMUX ~= nil
  
  -- Choose the appropriate copy command based on environment
  local copy_cmd = in_tmux and tmux_copy or clipboard_copy
  
  -- Ensure the script exists and is executable
  if vim.fn.executable(copy_cmd) == 1 then
    vim.g.clipboard = {
      name = "custom-clipboard",
      copy = {
        ["+"] = copy_cmd,
        ["*"] = copy_cmd,
      },
      paste = {
        ["+"] = function()
          -- Try to read from clipboard directory first
          local clipboard_dir = vim.fn.expand("~/.config/tmux/clipboard")
          if vim.fn.isdirectory(clipboard_dir) == 0 then
            clipboard_dir = "/tmp/tmux-clipboard-" .. vim.env.USER
          end
          
          local latest_file = clipboard_dir .. "/buffer-latest.txt"
          if vim.fn.filereadable(latest_file) == 1 then
            local content = vim.fn.readfile(latest_file)
            return content
          end
          
          -- Fallback to system clipboard
          if vim.fn.executable("xsel") == 1 then
            local output = vim.fn.system("xsel -o -b"):gsub("\n$", "")
            return vim.split(output, "\n")
          elseif vim.fn.executable("xclip") == 1 then
            local output = vim.fn.system("xclip -o -selection clipboard"):gsub("\n$", "")
            return vim.split(output, "\n")
          elseif vim.fn.executable("wl-paste") == 1 then
            local output = vim.fn.system("wl-paste"):gsub("\n$", "")
            return vim.split(output, "\n")
          end
          
          return {""}
        end,
        ["*"] = function()
          -- Same as + register
          return vim.g.clipboard.paste["+"]()
        end,
      },
      cache_enabled = 0,
    }
  else
    -- Fallback to system clipboard if our custom utilities aren't available
    vim.opt.clipboard = "unnamedplus"
  end
end

-- Set up clipboard configuration
setup_clipboard()
