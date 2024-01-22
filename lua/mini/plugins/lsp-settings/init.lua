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
  'eslint',
  'yamlls',
  'tailwindcss',
}

local lsp_utils = require('mini.plugins.lsp-settings.utils')
local default_diagnostic_config = lsp_utils.default_diagnostics()
local setup_mason_config = require('mini.plugins.lsp-settings.mason_cfg')

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    setup_mason_config(servers)

    local lspconfig = require 'lspconfig'
    vim.diagnostic.config(default_diagnostic_config)
    lsp_utils.setup_diagnostic_sign()

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

    require('lspconfig.ui.windows').default_options.border = 'rounded'

    for _, server in pairs(servers) do
      local opts = {
        on_attach = lsp_utils.on_attach,
        capabilities = lsp_utils.common_capabilities(),
      }

      local require_ok, settings = pcall(require, 'mini.plugins.lsp-settings.servers' .. server)
      if require_ok then
        opts = vim.tbl_deep_extend('force', settings, opts)
      end

      if server == 'lua_ls' then
        require('neodev').setup {}
      end

      lspconfig[server].setup(opts)
    end

  end,
}

