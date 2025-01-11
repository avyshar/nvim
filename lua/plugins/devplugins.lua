return {
  {
    dir = '~/plugins/terminals.nvim',
    config = function()
      local terminals = require 'terminals'
      vim.keymap.set({ 'n', 't' }, '<leader>tt', terminals.create_new_term)
      vim.keymap.set('n', '<leader>tn', terminals.show_next)
      vim.keymap.set('n', '<leader>tp', terminals.show_prev)
      vim.keymap.set('n', '<leader>th', terminals.hide_term)
      vim.keymap.set({ 'n' }, '<leader>tl', terminals.show_term)
      vim.keymap.set({ 'n', 't' }, '<leader>ta', terminals.show_all)
    end,
  },
}
