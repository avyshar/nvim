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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local conform = require('conform')

vim.keymap.set('n', '<leader>cf', conform.format, {})
