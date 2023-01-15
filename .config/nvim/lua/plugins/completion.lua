return {
  {
    'hrsh7th/nvim-cmp',

    opts = {
      ---@type cmp.source
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
      },
    },

    config = function (_, opts)
      local cmp = require('cmp')
      cmp.setup(opts)
    end,

    dependencies = {
      'neovim/nvim-lspconfig',

      'hrsh7th/cmp-nvim-lsp', -- lsp suggestions
      'hrsh7th/cmp-buffer',   -- current file suggestions
      'hrsh7th/cmp-path',     -- fs suggestions
      'hrsh7th/cmp-nvim-lua', -- neovim's lua API suggestions

      -- Snippets.
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    }
  }
}
