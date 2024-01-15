local servers = {
    "lua_ls",
    "angularls",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "dotls",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "tsserver",
    "lua_ls",
    "marksman",
    "terraformls",
    "yamlls"

}
return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
        'hrsh7th/nvim-cmp',     -- Autocompletion plugin
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'hrsh7th/cmp-path',
        'zbirenbaum/copilot.lua',
        'zbirenbaum/copilot-cmp',
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        'L3MON4D3/LuaSnip',         -- Snippets plugin
    },
    config = function()
        require("neodev").setup({
            -- add any options here, or leave empty to use the default settings
        })
        require("mason").setup({
            -- add any options here, or leave empty to use the default settings
        })
        require("mason-lspconfig").setup({
            ensure_installed = servers,
            automatic_installation = false,
        });
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require('lspconfig')

        for i = 1, #servers do
            lspconfig[servers[i]].setup {
                capabilities = capabilities,
            }
        end
        local luasnip = require 'luasnip'
        local cmp = require 'cmp'

        require('copilot').setup {}
        require('copilot_cmp').setup {}
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
                -- C-b (back) C-f (forward) for snippet placeholder navigation.
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = 'copilot' },
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
            },
        }
    end
}
