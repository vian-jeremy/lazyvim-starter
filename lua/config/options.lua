-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Clipboard OS Integration
local function log_clipboard(message)
  vim.notify("[Clipboard] " .. message, vim.log.levels.INFO)
end

local function check_display_environment()
  local display = vim.fn.getenv("DISPLAY")
  local wayland_display = vim.fn.getenv("WAYLAND_DISPLAY")
  local ssh_client = vim.fn.getenv("SSH_CLIENT")
  local xdg_session_type = vim.fn.getenv("XDG_SESSION_TYPE")
  local tmux = vim.fn.getenv("TMUX")
  
  local has_x11 = display ~= vim.NIL and display ~= ""
  local has_wayland = wayland_display ~= vim.NIL and wayland_display ~= ""
  local is_ssh = ssh_client ~= vim.NIL and ssh_client ~= ""
  local is_tty = xdg_session_type == "tty"
  local is_tmux = tmux ~= vim.NIL and tmux ~= ""
  
  return {
    has_x11 = has_x11,
    has_wayland = has_wayland,
    is_ssh = is_ssh,
    is_tty = is_tty,
    is_tmux = is_tmux,
    has_display = has_x11 or has_wayland
  }
end

local function detect_clipboard_tool()
  local env = check_display_environment()
  
  -- Log environment info for debugging
  if env.is_ssh then
    log_clipboard("Running in SSH session")
  end
  if env.is_tty then
    log_clipboard("Running in TTY session")
  end
  if env.is_tmux then
    log_clipboard("Running inside tmux session")
  end
  if not env.has_display then
    log_clipboard("No display environment available (DISPLAY and WAYLAND_DISPLAY not set)")
  end
  
  local tools = {}
  
  -- When in tmux without display, use tmux's built-in clipboard integration
  if env.is_tmux and not env.has_display then
    log_clipboard("Detected tmux without display - using tmux clipboard integration")
    
    -- Use custom script to copy to both tmux and OS clipboard
    -- This combines tmux clipboard with OSC52 for terminal clipboard
    table.insert(tools, {
      name = "tmux-dual",
      copy = "dual-clipboard-copy",
      paste = "tmux save-buffer -",
      requires_x11 = false,
      requires_wayland = false
    })
    
    -- Use OSC52 escape sequence for terminal clipboard (fallback)
    -- This works in many modern terminals even without X11
    table.insert(tools, {
      name = "osc52",
      copy = "sh -c 'printf \"\\033]52;c;$(base64 -w0)\\033\\\\\"'",
      paste = "echo ''", -- OSC52 is copy-only
      requires_x11 = false,
      requires_wayland = false
    })
  end
  
  -- Standard clipboard tools (work both inside and outside tmux when display is available)
  table.insert(tools, { 
    name = "xsel", 
    copy = "xsel --clipboard --input", 
    paste = "xsel --clipboard --output",
    requires_x11 = true
  })
  table.insert(tools, { 
    name = "xclip", 
    copy = "xclip -selection clipboard", 
    paste = "xclip -selection clipboard -o",
    requires_x11 = true
  })
  table.insert(tools, { 
    name = "wl-clipboard", 
    copy = "wl-copy", 
    paste = "wl-paste",
    requires_wayland = true
  })
  
  for _, tool in ipairs(tools) do
    -- Check if the tool is available
    local tool_name = tool.name
    local is_available = false
    
    -- Handle special tools
    if tool_name == "tmux-builtin" then
      is_available = vim.fn.executable("tmux") == 1
    elseif tool_name == "tmux-dual" then
      is_available = vim.fn.executable("dual-clipboard-copy") == 1
    elseif tool_name == "xclip-tmux" then
      is_available = vim.fn.executable("xclip") == 1
    elseif tool_name == "osc52" then
      is_available = true -- OSC52 doesn't need external tools
    else
      is_available = vim.fn.executable(tool_name) == 1
    end
    
    if is_available then
      -- Check if tool requirements are met
      local can_use = false
      local reason = ""
      
      if tool.requires_x11 and env.has_x11 then
        can_use = true
      elseif tool.requires_wayland and env.has_wayland then
        can_use = true
      elseif not tool.requires_x11 and not tool.requires_wayland then
        -- Special fallback tools that don't require display
        can_use = true
      elseif tool.requires_x11 and not env.has_x11 then
        reason = "requires X11 display (DISPLAY not set)"
      elseif tool.requires_wayland and not env.has_wayland then
        reason = "requires Wayland display (WAYLAND_DISPLAY not set)"
      end
      
      if can_use then
        log_clipboard("Using " .. tool.name .. " for clipboard operations")
        return tool
      else
        log_clipboard("Skipping " .. tool.name .. " - " .. reason)
      end
    else
      log_clipboard("Skipping " .. tool.name .. " - not installed")
    end
  end
  
  -- Provide helpful message for common scenarios
  if env.is_ssh and not env.has_display then
    log_clipboard("In SSH session without display forwarding - using internal clipboard only")
    log_clipboard("Tip: Enable X11 forwarding with 'ssh -X' or 'ssh -Y' to use system clipboard")
  elseif env.is_tmux then
    log_clipboard("In tmux session but no suitable clipboard tool found - using internal clipboard only")
    log_clipboard("Tip: Install xsel, xclip, or wl-clipboard for OS clipboard integration in tmux")
  else
    log_clipboard("No suitable clipboard tool found - using internal clipboard only")
  end
  
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
  log_clipboard("Clipboard option set to: " .. vim.o.clipboard)
else
  log_clipboard("Falling back to internal clipboard only")
  vim.opt.clipboard = ""
end

-- Debugging functions
function _G.debug_clipboard_status()
  local env = check_display_environment()
  
  print("=== Environment Status ===")
  print("X11 display: " .. tostring(env.has_x11))
  print("Wayland display: " .. tostring(env.has_wayland))
  print("SSH session: " .. tostring(env.is_ssh))
  print("TTY session: " .. tostring(env.is_tty))
  print("tmux session: " .. tostring(env.is_tmux))
  
  print("\n=== Clipboard Configuration ===")
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

-- Modern LSP Features (v0.11.2)
-- Enable builtin LSP completion
if vim.lsp.completion and vim.lsp.completion.enable then
  vim.lsp.completion.enable()
end

-- Enhanced diagnostic configuration with v0.11 features
vim.diagnostic.config({
  -- Show virtual text only on current line to reduce noise
  virtual_text = { 
    only_current_line = true,
    prefix = "●",
    source = "if_many"
  },
  -- Enable virtual lines for multiline diagnostics
  virtual_lines = false, -- Can be enabled with toggle
  -- Show diagnostics in insert mode
  update_in_insert = false,
  -- Severity sorting
  severity_sort = true,
  -- Float window configuration
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
