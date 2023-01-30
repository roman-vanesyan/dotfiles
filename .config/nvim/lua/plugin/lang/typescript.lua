return { -- Better syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',

        opts = function(_, opts)
            vim.list_extend(
                opts.ensure_installed,
                { 'javascript', 'typescript', 'tsx' }
            )
        end,
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'jose-elias-alvarez/typescript.nvim' },

        -- @param opts lspconfig.options
        -- opts = function(_, opts)
        --     vim.tbl_deep_extend('keep', {
        --         servers = {
        --             tsserver = function(_, server_options)
        --                 require('typescript').setup({
        --                     server = server_options,
        --                 })
        --                 return true
        --             end,
        --         },
        --     }, opts or {})
        -- end
    },
}
