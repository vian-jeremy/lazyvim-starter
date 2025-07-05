-- Modern plugin configurations for enhanced development experience
return {
  -- Additional Language Support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add additional parsers for comprehensive language support
      vim.list_extend(opts.ensure_installed, {
        "dockerfile",
        "cmake",
        "make",
        "toml",
        "yaml",
        "json5",
        "jsonc",
        "gitignore",
        "gitcommit",
        "diff",
        "ssh_config",
        "systemverilog", -- For hardware development
        "verilog",
        "cpp",
        "c",
        "python",
        "rust",
        "go",
      })
    end,
  },

  -- Enhanced LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Essential language servers
        bashls = {},
        clangd = {},
        pyright = {},
        ruff_lsp = {}, -- Fast Python linting
        taplo = {}, -- TOML language server
        yamlls = {},
        dockerls = {},
        cmake = {},
      },
    },
  },

  -- Additional Mason tools
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua",
        "black",
        "isort",
        "prettier",
        "shfmt",
        "cmake-format",
        
        -- Linters
        "shellcheck",
        "flake8",
        "ruff",
        "pylint",
        
        -- Language Servers
        "bash-language-server",
        "clangd",
        "pyright",
        "taplo",
        "yaml-language-server",
        "dockerfile-language-server",
      },
    },
  },

  -- Modern file explorer with better performance
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["Y"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
        },
      },
    },
  },

  -- Enhanced git integration
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
      },
    },
  },

  -- Better terminal integration
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
    },
  },

  -- Enhanced search and replace
  {
    "nvim-pack/nvim-spectre",
    opts = {
      color_devicons = true,
      highlight = {
        ui = "String",
        search = "DiffChange",
        replace = "DiffDelete",
      },
    },
  },
}
