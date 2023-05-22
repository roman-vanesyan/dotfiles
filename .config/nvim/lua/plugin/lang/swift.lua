return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "swift" })
    end,
  },

  {
    "neovim/nvim-lspconfig",

    -- @param opts lspconfig.options
    opts = {
      servers = {
        sourcekit = {},
      },
    },
  },

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
        nls.builtins.formatting["swift-format"],
        nls.builtins.formatting.swiftlint,
      })
    end,
  },
}
