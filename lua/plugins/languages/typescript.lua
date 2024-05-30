return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup {}
    local lsp_utils = require("utils.lsputils")
    require("nvim-lspconfig").tsserver.setup {
      on_attach = lsp_utils.on_attach,
      capabilities = lsp_utils.capabilities(),
      handlers = lsp_utils.handlers,
    }

  end
}
