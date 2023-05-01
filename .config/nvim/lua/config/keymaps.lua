local util = require("util")
local map = util.map

map({ "i", "v" }, "<C-c>", "<Esc>", { desc = "Escape to normal mode" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><Esc>", {
  desc = "Save file",
})
map("n", "<leader>nf", "<cmd>enew<cr>", {
  desc = "New File",
})

-- Autoclose brackets, quotes, etc.
map({ "i" }, '"', '""<left>')
map({ "i" }, "'", "''<left>")
map({ "i" }, "(", "()<left>")
map({ "i" }, "[", "[]<left>")
map({ "i" }, "{", "{}<left>")
map({ "i" }, "<", "<><left>")
map({ "i" }, "{<cr>", "{<cr>}<left><left><Esc>O")
map({ "i" }, "{;<cr>", "{<cr>};<left><left><reft><Esc>O")

-- LSP
map(
  { "n", "v" },
  "gd",
  "<cmd>Telescope lsp_definitions<CR>",
  { desc = "Goto definition" }
)
map(
  { "n", "v" },
  "<leader>rn",
  "<cmd>lua vim.lsp.buf.rename()<CR>",
  { desc = "Rename definition" }
)
map(
  { "n", "v" },
  "<leader>ca",
  "<cmd>lua vim.lsp.buf.code_action()<CR>",
  { desc = "Code actions" }
)
map(
  { "n", "v" },
  "<leader>f",
  "<cmd>lua vim.lsp.buf.format()<CR>",
  { desc = "Code actions" }
)

-- Code navigation
map(
  { "n", "v" },
  "[",
  "<C-o>",
  { desc = "Move cursor to the previous location" }
)
map({ "n", "v" }, "]", "<C-i>", { desc = "Move cursor to the next location" })
map(
  { "n", "v" },
  "<leader>e[",
  "g;",
  { desc = "Move cursor to previous change location" }
)
map(
  { "n", "v" },
  "<leader>e]",
  "g,",
  { desc = "Move cursor to next change location" }
)
map({ "n", "v" }, "<leader>el", "gi", {
  desc = "Move cursor to the last position where cursor was in the insert mode",
})
