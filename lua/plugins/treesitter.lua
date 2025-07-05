-- Additional Language Support
return {
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
        -- "systemverilog", -- Parser not available, commented out
        "verilog",
        "cpp",
        "c",
        "python",
        "rust",
        "go",
      })
    end,
  },
}