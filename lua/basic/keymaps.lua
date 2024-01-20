local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<C-i>', '<C-i>', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', '*', '*zz', opts)
keymap('n', '#', '#zz', opts)
keymap('n', 'g*', 'g*zz', opts)
keymap('n', 'g#', 'g#zz', opts)

-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move line up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap('x', '<leader>p', [["_dP]])
keymap({ 'n', 'v' }, '<leader>y', [["+y]])
keymap('n', '<leader>Y', [["+Y]])

keymap('n', '<leader>-', ':Ex<CR>', { desc = 'Open Explorer' })
keymap('t', '<Esc>', '<C-\\><C-n>', opts)
keymap('n', '<Esc>', ':nohl<CR>', opts)

local wk = require 'which-key'
wk.register {
  ['<leader>bb'] = { '<cmd>Telescope buffers previewer=false<cr>', 'Find' },
  ['<leader>fb'] = { '<cmd>Telescope git_branches<cr>', 'Checkout branch' },
  ['<leader>fc'] = { '<cmd>Telescope colorscheme<cr>', 'Colorscheme' },
  ['<leader>ff'] = { '<cmd>Telescope find_files<cr>', 'Find files' },
  ['<leader>fp'] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", 'Projects' },
  ['<leader>ft'] = { '<cmd>Telescope live_grep<cr>', 'Find Text' },
  ['<leader>fh'] = { '<cmd>Telescope help_tags<cr>', 'Help' },
  ['<leader>fl'] = { '<cmd>Telescope resume<cr>', 'Last Search' },
  ['<leader>fr'] = { '<cmd>Telescope oldfiles<cr>', 'Recent File' },
}
