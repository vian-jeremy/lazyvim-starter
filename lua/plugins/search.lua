-- Enhanced search and replace
return {
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