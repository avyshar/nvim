local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Better window navigation replaced with vim-tmux-navigator
-- keymap('n', '<C-h>', '<C-w>h', opts)
-- keymap('n', '<C-j>', '<C-w>j', opts)
-- keymap('n', '<C-k>', '<C-w>k', opts)
-- keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)
keymap('n', 'g*', 'g*zz', opts)
keymap('n', 'g#', 'g#zz', opts)

keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move line up/down
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

keymap('x', '<leader>p', [["_dP]])
keymap({ 'n', 'v' }, '<leader>y', [["+y]])
keymap('n', '<leader>Y', [["+Y]])

keymap('n', '<leader>-', ':Ex<CR>', { desc = 'Open Explorer' })
keymap('t', '<Esc>', '<C-\\><C-n>', opts)
keymap('n', '<Esc>', ':nohl<CR>', opts)


vim.keymap.set('n', '<leader>tw', ':Twilight<CR>', { desc = "Twilight" })
