local map = vim.keymap.set

-- Switch windows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Switch tabs
map('n', '<leader>tn', ':tabnew<CR>')
map('n', '<leader>tl', ':tablast<CR>')
map('n', '<leader>th', ':tabfirst<CR>')
map('n', '<leader>tx', ':tabclose<CR>')

-- Switch buffers
map('n', '<leader>bn', ':bnext<CR>')
map('n', '<leader>bp', ':bprev<CR>')

-- File explorer
-- map('n', '<leader>-', ':lua MiniFiles.open()<CR>')

-- Move up/down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- ESC
map('t', '<Esc><Esc>', '<C-\\><C-n>')
map('n', '<Esc>', ':noh<CR>')

map('n', '<leader>wq', ':wq<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>Q', ':q!<CR>')

