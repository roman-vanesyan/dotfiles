return { -- Better syntax highlighting
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
          require("typescript").setup({
            server = server_options,
          })
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
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.eslint,
        nls.builtins.diagnostics.eslint,
      })
    end,
  },
}
