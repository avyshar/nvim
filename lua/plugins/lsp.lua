local lsp_config = require("config.lsp")

return {
  "neovim/nvim-lspconfig",
  dependencies = lsp_config.get_deps(),
  config = function()
    lsp_config.cmp_setup()
    local capabilities = lsp_config.capabilities()
    local on_attach = lsp_config.on_attach

    local servers = {
      "tsserver",
      "eslint",
      "eslint_d",
      "angularls",
      "gopls",
    }

    local file_types = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" }

    local util = require("lspconfig.util")

    local root_dir =
      util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", "angular.json", ".git")

    lsp_config.setup_servers(servers, capabilities, on_attach, root_dir, file_types)
  end,
}
