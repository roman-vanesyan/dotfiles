return {
    {
        'hrsh7th/nvim-cmp',

        dependencies = {
            'neovim/nvim-lspconfig',

            'hrsh7th/cmp-nvim-lsp', -- lsp suggestions
            'hrsh7th/cmp-buffer', -- current file suggestions
            'hrsh7th/cmp-path', -- fs suggestions
            'hrsh7th/cmp-nvim-lua', -- neovim's lua API suggestions

            -- Snippets.
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },

        event = 'InsertEnter',

        opts = function()
            local cmp = require('cmp')

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'nvim_lua' },
                    { name = 'luasnip' },
                }),
            })
        end,
    },
}
