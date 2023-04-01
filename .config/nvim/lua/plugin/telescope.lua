return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-media-files.nvim",
    },

    opts = function()
      local actions = require("telescope._extensions.file_browser.actions")

      return {
        pickers = {
          find_files = { hidden = true },
        },

        extensions = {
          file_browser = {
            respect_gitignore = true,
            auto_depth = true,
            use_fd = true,
            hijack_netrw = true,
            no_ignore = true,
            file_ignore_patterns = { "node_modules", ".git" },
          },

          mappings = {
            ["i"] = {
              ["<A-r>"] = actions.rename,
            },
          },

          media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "svg", "pdf" },
            find_cmd = "rg",
          },
        },
      }
    end,

    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("file_browser")
      telescope.load_extension("media_files")

      require("config.telescope")
    end,

    priority = 1024,
  },
}
