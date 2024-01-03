local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}

lspconfig.eslint.setup({
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
