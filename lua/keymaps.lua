local map = vim.keymap.set

map("t", "<Esc><Esc>", "<C-\\><C-n>")

local oil = require("oil")

map("n", "<leader>ee", function()
  local buf = vim.api.nvim_get_current_buf()
  local dir = oil.get_current_dir(buf)

  oil.open(dir)
end)

map("n", "<leader>fr", function()
  local win = vim.api.nvim_get_current_win()

  local dir = vim.fn.getcwd(win)

  oil.open_float(dir)
end)

map("n", "<leader>fe", function()
  local buf = vim.api.nvim_get_current_buf()

  local dir = oil.get_current_dir(buf)

  oil.open_float(dir)
end)

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})
map("n", "<leader>ht", function() require("telescope").extensions.harpoon.marks() end, {})
-- require("telescope").extensions.lazygit.lazygit()
local conform = require("conform")

map("n", "<leader>cf", function()
  print("format it")
  conform.format()
end, {})

map("n", "<leader>tn", ":tabnew<CR>", {})

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

map("n", "<leader>ha", harpoon_mark.add_file, {})
map("n", "<leader>hm", harpoon_ui.toggle_quick_menu, {})
map("n", "<leader>hp", harpoon_ui.nav_prev, {})
map("n", "<leader>hn", harpoon_ui.nav_next, {})

for i = 1, 5, 1 do
  map("n", "<leader>h" .. i .. "", function() harpoon_ui.nav_file(i) end, {})
end

vim.keymap.set("n", "<leader>q", function() require("quicker").toggle() end, {
  desc = "Toggle quickfix",
})
vim.keymap.set("n", "<leader>l", function() require("quicker").toggle({ loclist = true }) end, {
  desc = "Toggle loclist",
})
