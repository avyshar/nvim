return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  dependencies = { 'echasnovski/mini.icons' },
  opts = {},
  config = function()
    local fzf = require 'fzf-lua'
    vim.keymap.set('n', '<leader>ff', fzf.files)
    vim.keymap.set('n', '<leader>fb', fzf.buffers)
    vim.keymap.set('n', '<leader>fw', fzf.grep_cword)
    vim.keymap.set('n', '<leader>fW', fzf.grep_cWORD)
    vim.keymap.set('n', '<leader>fg', fzf.live_grep)
    vim.keymap.set('n', '<leader>gl', fzf.live_grep_resume)
  end,
}
