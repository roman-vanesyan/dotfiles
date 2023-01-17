return {
  -- Better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',

    opts = function(_, opts)
      vim.list_extend(
        opts.ensure_installed,
        { 'javascript', 'typescript', 'tsx' }
      )
    end,
  },

  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = { 'jose-elias-alvarez/typescript.nvim' },
  --   opts = function(_, opts)
  --     vim.tbl_deep_extend('force', opts, {
  --       setup = {
  --         tsserver = function(_, opts)
  --           require('typescript').setup({
  --             server = opts,
  --           })
  --           return true
  --         end,
  --       },
  --     })
  --   end,
  -- },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'eslint', 'tsserver' })
    end,
  },
}
