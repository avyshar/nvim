return {
  "folke/neodev.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "folke/neoconf.nvim",
  },
  config = function()
    require("neodev").setup({
      -- add any options here, or leave empty to use the default settings
    })

    require("neoconf").setup({
      -- override any of the default settings here
    })

    -- then setup your lsp server as usual
    local lspconfig = require('lspconfig')

    -- example to setup lua_ls and enable call snippets
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      },
      on_attach = require('utils.lsputils').on_attach,
      capabilities = require('utils.lsputils').capabilities(),
      handlers = require('utils.lsputils').handlers,
    })
  end
}
