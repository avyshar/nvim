return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.statusline').setup()
    require('mini.bracketed').setup()
    require('mini.comment').setup()
    -- require('mini.fuzzy').setup()
  end,
}
