-- Set <space> as leader key.
-- Important: This must be set before any plugins are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')


-- Highlight on copy (yank).
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end
})

-- Setup neovide if it is installed.
if vim.g.neovide then
  vim.opt.guifont = 'SF Mono:h13'

  vim.g.neovide_cursor_trail_length = 0
  vim.g.neovide_cursor_animation_length = 0 -- Disable cursor animation.

  -- Treat alt key as meta key.
  vim.g.neovide_input_macos_alt_is_meta = true
end

vim.opt.smartindent = true

-- Disable backup file.
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable file write on buffer switch.
vim.opt.autowriteall = true

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.updatetime = 100

-- Sets terminal title to the current file name.
vim.opt.title = true

-- Show line numbers.
-- At current line number is absolute number,
-- surronding lines are relative numbers to current line.
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight cursor line.
vim.opt.cursorline = true

-- Enables 24-bit RGB colors.
vim.opt.termguicolors = true
vim.cmd [[ colorscheme dayfox ]]

-- Case insientive search unless capital in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set vertical rulers.
vim.opt.colorcolumn = '80,120'

-- Set completeopt to have a better completion experience.
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Pefer splitting to the bottom and to the right.
vim.opt.splitbelow = true
vim.opt.splitright = true