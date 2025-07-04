return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<S-Up>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<S-Down>"] = { "preview_scroll_down", mode = { "i", "n" } },
          },
        },
        list = {
          keys = {
            ["<S-Up>"] = { "preview_scroll_up", mode = { "n", "x" } },
            ["<S-Down>"] = { "preview_scroll_down", mode = { "n", "x" } },
          },
        },
      },
    },
  },
}