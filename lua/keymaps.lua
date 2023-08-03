vim.g.mapleader = ' '
local map = vim.keymap.set

map('n', '<leader>q', vim.cmd.quit)
map('n', '<leader>e', vim.cmd.Explore)
map('n', '<leader>w', vim.cmd.write)

map('n', '<leader>;', '<cmd>lua vim.lsp.buf.code_action()<cr>')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

map('n', '<leader>ll', '<C-w>l')
map('n', '<leader>hh', '<C-w>h')
map('n', '<leader>jj', '<C-w>j')
map('n', '<leader>kk', '<C-w>k')

map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')
map('n', '<leader>fo', ':Telescope oldfiles<cr>')

map('n', '<leader>gs', ':Telescope git_status<cr>')
