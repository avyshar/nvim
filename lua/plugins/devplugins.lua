return {
  {
    dir = '~/plugins/terminals.nvim',
    config = function()
      local terminals = require 'terminals'

      terminals.setup {}

      vim.keymap.set({ 'n', 't' }, '<leader>tb', terminals.toggle)
      vim.keymap.set({ 'n', 't' }, '<leader>ts', terminals.show_terminals)
    end,
  },
}
