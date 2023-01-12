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

-- Show line numbers.
-- At current line number is absolute number, surronding lines are relative numbers to current line.
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight cursor line.
vim.opt.cursorline = true

-- TODO(roman@vanesyan.com): set proper styles.
vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 242 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true })

vim.opt.colorcolumn = '80,120'

-- Highlight on copy (yank).
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end
})
