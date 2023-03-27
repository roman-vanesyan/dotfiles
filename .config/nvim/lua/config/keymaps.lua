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
