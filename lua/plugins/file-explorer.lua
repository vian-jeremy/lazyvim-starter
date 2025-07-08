-- Modern file explorer with enhanced performance and features
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = false,
      enable_git_status = true,
      enable_diagnostics = true,

      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            added = "✚",
            modified = "✱",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },

      window = {
        position = "left",
        width = 35,
        mappings = {
          ["<space>"] = "none",
          ["<2-LeftMouse>"] = "open",
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["l"] = "focus_preview",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["Z"] = "expand_all_nodes",
          ["a"] = { "add", config = { show_path = "relative" } },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
          ["Y"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          ["gy"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local relative_path = vim.fn.fnamemodify(path, ":~:.")
            vim.fn.setreg("+", relative_path, "c")
          end,
        },
      },

      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            "node_modules",
            ".git",
            ".svn",
            ".hg",
          },
          hide_by_pattern = {
            "*.tmp",
            "*.bak",
            "*.swp",
            "*.pyc",
            "__pycache__",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
        find_by_full_path_words = false,
        group_empty_dirs = false,
        hijack_netrw_behavior = "open_default",
        scan_mode = "shallow",
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
          end,
        },
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
            ["o"] = "system_open",
          },
        },
      },

      buffers = {
        follow_current_file = { enabled = true },
        group_empty_dirs = true,
        show_unloaded = true,
        window = {
          mappings = {
            ["bd"] = "buffer_delete",
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["o"] = "system_open",
          },
        },
      },

      git_status = {
        window = {
          position = "float",
          mappings = {
            ["A"] = "git_add_all",
            ["gu"] = "git_unstage_file",
            ["ga"] = "git_add_file",
            ["gr"] = "git_revert_file",
            ["gc"] = "git_commit",
            ["gp"] = "git_push",
            ["gg"] = "git_commit_and_push",
            ["o"] = "system_open",
          },
        },
      },

      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}

