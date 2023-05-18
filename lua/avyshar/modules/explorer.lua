vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 50

local map = vim.keymap.set

map('n', '<leader>e', ':40vs +Ex<CR>', { desc = "Open Explorer" })
