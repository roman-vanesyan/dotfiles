return {
  -- Better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(
        opts.ensure_installed,
        { "javascript", "typescript", "tsx" }
      )
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "jose-elias-alvarez/typescript.nvim" },

    -- @param opts lspconfig.options
    opts = {
      servers = {
        tsserver = {},
      },

      setup = {
        tsserver = function(_, server_options)
          require("typescript").setup({ server = server_options })
          return true
        end,
      },
    },
  },

  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
    },
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        require("typescript.extensions.null-ls.code-actions"),
        nls.builtins.formatting.eslint_d,
        nls.builtins.formatting.prettierd,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.code_actions.eslint_d,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint = { settings = { workingDirectory = { mode = "auto" } } },
      },
    },

    setup = {
      eslint = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function(event)
            if
              require("lspconfig.util").get_active_client_by_name(
                event.buf,
                "eslint"
              )
            then
              vim.cmd("EslintFixAll")
            end
          end,
        })
      end,
    },
  },
}
