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
      -- vim.cmd[[colorscheme tokyonight]]
      -- vim.cmd("hi WinSeparator guifg=#0288d1")
    end
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      vim.cmd("colorscheme poimandres")
      vim.cmd("hi WinSeparator guifg=#0288d1")
    end
  }
}
