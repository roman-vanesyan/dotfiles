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

    opts = {
      extensions = {
        file_browser = {
          hijack_netrw = true,
        },

        media_files = {
          filetypes = { "png", "webp", "jpg", "jpeg", "svg", "pdf" },
          find_cmd = "rg",
        },
      },
    },

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
