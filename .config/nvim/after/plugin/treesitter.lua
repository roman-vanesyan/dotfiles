require('nvim-treesitter/configs').setup {
  ensure_installed = {
    'javascript',
    'typescript',
    'json',

    'python',
    'lua',
    'bash',

    'c',
    'cpp',

    'rust',
    'go',

    'html',
    'css'
  },

  auto_install = true,

  highlight = {
    enable = true,

    -- Speedup highlighting
    additional_vim_regex_highlight = false
  }
}
