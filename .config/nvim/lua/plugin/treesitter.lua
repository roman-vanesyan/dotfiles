return {
    -- Better syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',

        event = 'BufReadPost',

        ---@type TSConfig
        opts = {
            indent = { enable = true },

            ensure_installed = {
                'javascript',
                'typescript',
                'tsx',

                'python',
                'lua',
                'bash',

                'c',
                'cpp',

                'rust',
                'go',

                'html',
                'css',

                'markdown',

                'json',
                'yaml',
                'toml',
            },

            auto_install = true,

            highlight = {
                enable = true,

                -- Speedup highlighting
                additional_vim_regex_highlight = false,
            },
        },

        ---@param opts TSConfig
        config = function(opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },

    -- Sticky header for scope context.
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            enable = true,
        },
    },
}
