if not pcall(require, "telescope") then
  return
end

local util = require("util")
local map = util.map

map("n", "<leader>bp", ":Telescope file_browser<CR>", { noremap = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
