-- Install packer to 
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'neovim/nvim-lspconfig',
        requires = {
                -- LSP aut
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',

                -- LSP progess handler
                'j-hui/fzf-lsp.nvim'
        }
    }

    -- lua LSP and some extra goodies
    use 'folke/neodev.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Better syntax highlighting
    use {
        'treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- 
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- GitHub Copilot
    use 'github/copilot.vim'
end)
