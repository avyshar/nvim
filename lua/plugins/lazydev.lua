local lsp_config = require("config.lsp")
return {
  "folke/lazydev.nvim",
  dependencies = lsp_config.get_deps(),
  config = function()
    require("lazydev").setup({
      library = {
        path = "luvit-meta/library",
        words = { "vim%.uv" },
      },
    })

    local servers = { "lua_ls" }

    lsp_config.cmp_setup()
    local capabilities = lsp_config.capabilities()
    local on_attach = lsp_config.on_attach

    local util = require("lspconfig.util")

    local root_dir = util.root_pattern(
      ".luarc.json",
      ".luarc.jsonc",
      ".luacheckrc",
      ".stylua.toml",
      "stylua.toml",
      "selene.toml",
      "selene.yml",
      ".git"
    )

    lsp_config.setup_servers(servers, capabilities, on_attach, root_dir)
  end,
}
