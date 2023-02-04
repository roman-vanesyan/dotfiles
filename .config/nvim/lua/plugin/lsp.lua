return {
    {
        'neovim/nvim-lspconfig',
        event = 'BufReadPre',

        dependencies = {
            -- LSP auto installer
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            'hrsh7th/cmp-nvim-lsp', -- lsp suggestions

            -- LSP progess handler
            {
                'j-hui/fidget.nvim',
            },

            -- lua LSP and some extra goodies
            {
                'folke/neodev.nvim',
                config = true
            },
        },

        opts = {
            servers = {
                sumneko_lua = {
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                        },
                    },
                },
            },

            setup = {}
        },

        config = function(_, opts)
            local servers = opts.servers
            local capabilities = require('cmp_nvim_lsp').default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            local function setup(server)
                local server_opts = servers[server] or {}
                server_opts.capabilities = capabilities
                if opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        return
                    end
                elseif opts.setup['*'] then
                    if opts.setup['*'](server, server_opts) then
                        return
                    end
                end
                require('lspconfig')[server].setup(server_opts)
            end

            local mlsp = require('mason-lspconfig')
            local available = mlsp.get_available_servers()

            local ensure_installed = {} ---@type string[]
            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    if not vim.tbl_contains(available, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end

            mlsp.setup({
                ensure_installed = ensure_installed,
            })
            mlsp.setup_handlers({ setup })
        end,
    },

    -- -- Formatters.
    -- {
    --   'jose-elias-alvarez/null-ls.nvim',
    --   event = 'BufReadPre',
    --   dependencies = {
    --     'nvim-lua/plenary.nvim',
    --     'williamboman/mason.nvim',
    --   },
    --   opts = function()
    --     local nls = require('null-ls')

    --     return {
    --       sources = {
    --         -- TypeScript
    --         nls.builtins.formatting.prettierd,
    --         nls.builtins.diagnostics.eslint,

    --         -- Lua
    --         nls.builtins.formatting.stylua,
    --       },
    --     }
    --   end,
    --   config = true,
    -- },

    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            ensure_installed = {
                'stylua',
            },
        },

        config = function(_, opts)
            require('mason').setup(opts)
            local mr = require("mason-registry")
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
    },
}
