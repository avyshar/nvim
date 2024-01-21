return function(servers)
  require('mason').setup {
    ui = {
      border = 'rounded',
    },
  }
  require('mason-lspconfig').setup {
    ensure_installed = servers,
  }
end
