return {
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "neovim/nvim-lspconfig",

      "hrsh7th/cmp-nvim-lsp", -- lsp suggestions
      "hrsh7th/cmp-buffer", -- current file suggestions
      "hrsh7th/cmp-path", -- fs suggestions
      "hrsh7th/cmp-nvim-lua", -- neovim's lua API suggestions

      -- Snippets.
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- GitHub Copilot
      {
        "zbirenbaum/copilot-cmp",
        dependencies = {
          {
            "zbirenbaum/copilot.lua",
            opts = {
              suggestion = { enabled = false },
              panel = { enabled = false },
            },
          },
        },
        opts = function()
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup({})
        end,
      },
    },

    event = "InsertEnter",

    opts = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-i>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "nvim_lua" },
          { name = "luasnip" },
        }),
      })
    end,
  },
}
