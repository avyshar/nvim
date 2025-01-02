local function get_probe_dir(root_dir)
  local project_root = vim.fs.find('node_modules', { path = root_dir, upward = true })[1]

  return project_root and (project_root .. '/node_modules') or ''
end

local default_probe_dir = get_probe_dir(vim.fn.getcwd())

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- 'saghen/blink.cmp',
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        },
      },
    },
    { 'Bilal2453/luvit-meta', lazy = true },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/SchemaStore.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('mason').setup {}
    require('mason-lspconfig').setup {
      ensure_installed = { 'lua_ls', 'ts_ls', 'angularls' },
    }
    local lspconfig = require 'lspconfig'

    -- local capabilities = require('blink.cmp').get_lsp_capabilities()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local servers = {
      lua_ls = {},
      ts_ls = {},
      gopls = {},
      jsonls = {
        server_capabilities = {
          documentFormattingProvider = false,
        },
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      },
      angularls = {
        cmd = {
          'ngserver',
          '--stdio',
          '--tsProbeLocations',
          default_probe_dir,
          '--ngProbeLocations',
          default_probe_dir,
        },
      },
    }

    for server, config in pairs(servers) do
      if config ~= true then
        config = {
          capabilities = capabilities,
        }
      end
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end
  end,
}
