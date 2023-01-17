return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    config = function(_, opts)
      vim.cmd([[colorscheme dayfox]])
    end,
  },
}
