local servers = {
  'lua_ls',
  'cssls',
  'html',
  'tsserver',
  'pyright',
  'bashls',
  'jsonls',
  'angularls',
  'gopls',
}

local M = {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    'folke/neodev.nvim',
  },
}

function M.config()

  require('mason').setup {
    ui = {
      border = 'rounded',
    },
  }

  require('mason-lspconfig').setup {
    ensure_installed = servers,
  }
end

return M
