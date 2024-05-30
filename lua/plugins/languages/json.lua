return {
  "b0o/schemastore.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    local lsp_utils = require('utils.lsputils')
    require('lspconfig').jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
      on_attach = lsp_utils.on_attach,
      capabilities = lsp_utils.capabilities(),
      handlers = lsp_utils.handlers,
    }
  end
}

