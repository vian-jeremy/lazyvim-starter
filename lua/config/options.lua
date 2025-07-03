-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Clipboard OS Integration
local function log_clipboard(message)
  vim.notify("[Clipboard] " .. message, vim.log.levels.INFO)
end

local function detect_clipboard_tool()
  local tools = {
    { name = "xsel", copy = "xsel --clipboard --input", paste = "xsel --clipboard --output" },
    { name = "xclip", copy = "xclip -selection clipboard", paste = "xclip -selection clipboard -o" },
    { name = "wl-clipboard", copy = "wl-copy", paste = "wl-paste" },
  }
  
  for _, tool in ipairs(tools) do
    if vim.fn.executable(tool.name) == 1 then
      log_clipboard("Using " .. tool.name .. " for clipboard operations")
      return tool
    end
  end
  
  log_clipboard("No clipboard tool found, using internal clipboard only")
  return nil
end

-- Configure clipboard
local clipboard_tool = detect_clipboard_tool()

if clipboard_tool then
  vim.g.clipboard = {
    name = clipboard_tool.name,
    copy = {
      ["+"] = clipboard_tool.copy,
      ["*"] = clipboard_tool.copy,
    },
    paste = {
      ["+"] = clipboard_tool.paste,
      ["*"] = clipboard_tool.paste,
    },
    cache_enabled = 1,
  }
  
  -- Enable clipboard integration
  vim.opt.clipboard = "unnamedplus"
  log_clipboard("OS clipboard integration enabled with " .. clipboard_tool.name)
else
  log_clipboard("Falling back to internal clipboard only")
  vim.opt.clipboard = ""
end

-- Debugging functions
function _G.debug_clipboard_status()
  local current_clipboard = vim.g.clipboard
  if current_clipboard then
    print("Clipboard tool: " .. current_clipboard.name)
    print("Copy command: " .. current_clipboard.copy["+"])
    print("Paste command: " .. current_clipboard.paste["+"])
    print("Cache enabled: " .. tostring(current_clipboard.cache_enabled == 1))
  else
    print("No external clipboard configured")
  end
  print("Clipboard option: " .. vim.o.clipboard)
end

function _G.test_clipboard_copy()
  local test_text = "Test clipboard copy - " .. os.date("%Y-%m-%d %H:%M:%S")
  vim.fn.setreg("+", test_text)
  log_clipboard("Copied test text: " .. test_text)
  print("Test text copied to clipboard: " .. test_text)
end

function _G.test_clipboard_paste()
  local pasted_text = vim.fn.getreg("+")
  log_clipboard("Pasted text: " .. pasted_text)
  print("Pasted from clipboard: " .. pasted_text)
  return pasted_text
end
