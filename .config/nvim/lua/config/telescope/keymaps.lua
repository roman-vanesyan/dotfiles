if not pcall(require, "telescope") then
  return
end

local util = require("util")
local map = util.map

map("n", "<leader>pb", ":Telescope file_browser<CR>", { noremap = true })
map("n", "<leader>fb<CR>", ":Telescope find_buffer<CR>", { noremap = true })
map("n", "<leader>pf", ":Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
