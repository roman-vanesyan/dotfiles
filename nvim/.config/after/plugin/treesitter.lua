require('nvim-treesitter/configs').setup {
        ensure_installed = {
                'javascript',
                'typescript',
                'python',
                'lua',

                'c',
                'cpp',

                'rust',
                'go'
        },

        auto_install = true,

        highlight = {
                enable = true,

                -- Speedup highlighting
                additional_vim_regex_highlight = false
        }
}
