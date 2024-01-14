local lspconfig = require 'lspconfig'
lspconfig.cssmodules_ls.setup {}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.cssls.setup {
  capabilities = capabilities,
}
