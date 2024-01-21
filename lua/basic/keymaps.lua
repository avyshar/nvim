print 'keymaps'
local keymap = vim.keymap.set

local wk = require 'which-key'
local opts = { noremap = true, silent = true }

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
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

keymap('x', '<leader>p', [["_dP]])
keymap({ 'n', 'v' }, '<leader>y', [["+y]])
keymap('n', '<leader>Y', [["+Y]])

keymap('n', '<leader>-', ':Ex<CR>', { desc = 'Open Explorer' })
keymap('t', '<Esc>', '<C-\\><C-n>', opts)
keymap('n', '<Esc>', ':nohl<CR>', opts)


-- REQUIRED
local harpoon = require "harpoon"
keymap('n', '<leader>had', function()
  harpoon:list():append()
end, { desc = 'Harpoon it' })
keymap('n', '<leader>hl', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon list' })

keymap('n', '<leader>hq', function()
  harpoon:list():select(1)
end)
keymap('n', '<leader>hw', function()
  harpoon:list():select(2)
end)
keymap('n', '<leader>he', function()
  harpoon:list():select(3)
end)
keymap('n', '<leader>hr', function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
keymap("n", "<leader>hn", function() harpoon:list():prev() end, { desc = "Harpoon Prev" })
keymap("n", "<leader>hp", function() harpoon:list():next() end, { desc = "Harpoon Next" })


-- LSP
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostics next" } )
keymap('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostics prev" } )
