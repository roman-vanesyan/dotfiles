if not pcall(require, 'telescope') then
  return
end

vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  ':Telescope file_browser<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>ff',
  ':Telescope find_files<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fg',
  ':Telescope live_grep<CR>',
  { noremap = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fh',
  ':Telescope help_tags<CR>',
  { noremap = true }
)
