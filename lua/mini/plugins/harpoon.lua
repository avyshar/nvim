return {
  'thePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
  },
  config = function()
    require 'harpoon':setup()
  end
}
