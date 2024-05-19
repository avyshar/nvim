return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "folke/neodev.nvim", opts = {} },
    'hrsh7th/cmp-nvim-lsp',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("neodev").setup({})

    local servers = {
      "lua_ls",
      "tsserver",
      "gopls",
      "cssls",
      "rust_analyzer",
      "jsonls",
      "yamlls",
      "ocamllsp",
    }

    local lsp_config = require("lspconfig")
    local lsp_utils = require("utils.lsputils")

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    for i = 1, #servers do
      lsp_config[servers[i]].setup {
        on_attach = lsp_utils.on_attach,
        handlers = lsp_utils.handlers,
        capabilities = capabilities
      }
    end
  end
}
