return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.statusline').setup()
    require('mini.tabline').setup()
  end
}
