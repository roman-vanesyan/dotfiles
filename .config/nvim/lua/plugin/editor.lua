return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    config = function()
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

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    end,
  },
}
