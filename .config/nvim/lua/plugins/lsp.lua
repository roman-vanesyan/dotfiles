return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',

    dependencies = {
      -- LSP auto installer
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- LSP progess handler
      {
        'j-hui/fidget.nvim',
        config = true
      },
      
      -- lua LSP and some extra goodies
      {
        'folke/neodev.nvim',
        config = true
      }
    }
  },

  -- Formatters.
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'williamboman/mason.nvim'
    },
    opts = function()
      local nls = require('null-ls')

      return {
        sources = {
          -- TypeScript
          nls.builtins.formatting.prettierd,
          nls.builtins.diagnostics.eslint,

          -- Lua
          nls.builtins.formatting.stylua,
        },
      }
    end,
    config = true
  },

  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      ensure_installed = {
        'stylua'
      }
    },

    config = function (_, opts)
      local mason = require('mason')

      mason.setup(opts)
    end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      automatic_installation = true,
      ensure_installed = {
        'eslint',
        'tsserver',

        'graphql',
        'jsonls',

        'grammarly',

        'sumneko_lua',

        'clangd',
        'rust_analyzer',
        'gopls',

        'pyright',
        'bashls',

        'astro',
        'html',
        'remark_ls',
      },
    }
  }
}
