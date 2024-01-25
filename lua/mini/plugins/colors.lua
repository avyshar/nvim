return {
  {
    'Biscuit-Colorscheme/nvim',
    config = function()
      -- vim.cmd[[colorscheme biscuit]]
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd[[colorscheme tokyonight]]
      vim.cmd("hi WinSeparator guifg=#0288d1")
    end
  }
}
