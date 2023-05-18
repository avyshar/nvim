vim.g.mapleader = ' '

local map = vim.keymap.set

map('n', '<leader>q', ':q<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

map('n', '<leader>h', ':bp<CR>')
map('n', '<leader>l', ':bn<CR>')

map('i', 'jj', '<ESC>')

