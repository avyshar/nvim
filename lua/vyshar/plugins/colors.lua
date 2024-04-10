return {
  {
    'rebelot/kanagawa.nvim',
    -- enabled = false,
    -- config = function()
    --   vim.cmd.colorscheme 'kanagawa'
    -- end,
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
    enabled = false,
  },
  {
    'morhetz/gruvbox',
    config = function()
      vim.cmd 'colorscheme gruvbox'
    end,
  },
}
