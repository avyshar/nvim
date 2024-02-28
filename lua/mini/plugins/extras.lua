return {
  'christoomey/vim-tmux-navigator',
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    config = function()
      local zm = require('zen-mode')

      zm.setup {}

      vim.keymap.set('n', '<leader>zm', function()
        zm.toggle()
      end)
    end
  },
}
