local lspconfig = require'lspconfig'

local capabilities = require("cmp_nvim_lsp").default_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup {
  capabilities = capabilities,
}

lspconfig.yamlls.setup {
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                ["/path/from/root/of/project"] = "/.github/workflows/*",
            },
        },
    }
}

lspconfig.sqlls.setup{}
