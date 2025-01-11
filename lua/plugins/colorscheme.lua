return {
  'rose-pine/neovim',
  'lifepillar/vim-solarized8',
  'morhetz/gruvbox',
  'AlexvZyl/nordic.nvim',
  'comfysage/evergarden',
  'zootedb0t/citruszest.nvim',
  'Mofiqul/vscode.nvim',
  {
    'tiagovla/tokyodark.nvim',
    config = function()
      vim.cmd 'colorscheme tokyodark'
    end,
  },
  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = { -- set to setup table
    },
  },
}
