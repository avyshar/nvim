return {
  -- "MunifTanjim/nui.nvim",
  -- {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {},
  config = function()
    require('toggleterm').setup({})
    vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { noremap = true })
  end,
  -- },
  -- { dir = "~/.config/mnvim/lua/myshit/myterm.nvim" },
}
