-- Enhanced LSP Configuration
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Essential language servers (use system-installed versions)
        bashls = { mason = false },
        clangd = { mason = false },
        pyright = { mason = false },
        ruff_lsp = { mason = false }, -- Fast Python linting
        taplo = { mason = false }, -- TOML language server
        yamlls = { mason = false },
        dockerls = { mason = false },
        cmake = { mason = false },
      },
    },
  },

  -- Disable Mason auto-installation for restricted environments
  {
    "williamboman/mason.nvim",
    opts = {
      -- Remove ensure_installed to prevent automatic downloads
      -- Use system-installed tools instead
      ensure_installed = {},
    },
  },
}