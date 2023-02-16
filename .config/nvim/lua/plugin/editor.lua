return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    config = function(_, opts)
      vim.cmd([[colorscheme dayfox]])
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", setup = true },
    },

    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",

        sections = {
          lualine_y = { "" },
        },
      },
    },
  },
}
