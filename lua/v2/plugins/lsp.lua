return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        {"neovim/nvim-lspconfig"},
        {
            "williamboman/mason.nvim",
            build = function()
                vim.cmd("MasonUpdate")
            end,
        },
        {"williamboman/mason-lspconfig.nvim"},

        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"L3MON4D3/LuaSnip"},
        {"hrsh7th/cmp-nvim-lua"},
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"},
        {"saadparwaiz1/cmp_luasnip"},
        {"rafamadriz/friendly-snippets"},
        {"zbirenbaum/copilot.lua"},
        {"zbirenbaum/copilot-cmp"},
        {"jose-elias-alvarez/typescript.nvim"},
        {"jose-elias-alvarez/null-ls.nvim"},
        {"onsails/lspkind.nvim"},
        {"folke/lsp-colors.nvim"},
        {"MunifTanjim/prettier.nvim"},
    },
    config = function()
        local null_ls = require("null-ls")

        local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
        local event = "BufWritePre" -- or "BufWritePost"
        local async = event == "BufWritePost"

        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.keymap.set("n", "<Leader>f", function()
                        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                    end, { buffer = bufnr, desc = "[lsp] format" })

                    -- format on save
                    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
                    vim.api.nvim_create_autocmd(event, {
                        buffer = bufnr,
                        group = group,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr, async = async })
                        end,
                        desc = "[lsp] format on save",
                    })
                end

                if client.supports_method("textDocument/rangeFormatting") then
                    vim.keymap.set("x", "<Leader>f", function()
                        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
                    end, { buffer = bufnr, desc = "[lsp] format" })
                end
            end,
        })
        require("copilot").setup({
            suggestion = {enabled = false},
            panel = {enabled = false},
        })
        require("copilot_cmp").setup()

        require("lsp-colors").setup({
            Error = "#db4b4b",
            Warning = "#e0af68",
            Information = "#0db9d7",
            Hint = "#10B981"
        })

        local lsp = require("lsp-zero").preset("recommended")

        lsp.nvim_workspace()

        lsp.on_attach(function(_, bufnr)
            -- lsp.default_keymaps({buffer = bufnr})
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
            vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
            vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.rename() end, opts)
        end)

        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

        lsp.setup()

        require("typescript").setup({
            server = {
                on_attach = function(client, bufnr)
                    -- You can find more commands in the documentation:
                    -- https://github.com/jose-elias-alvarez/typescript.nvim#commands

                    vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<cr>", {buffer = bufnr})
                end
            }
        })

        local cmp = require("cmp")
        local cmp_action = require("lsp-zero").cmp_action()
        local lspkind = require("lspkind")

        cmp.setup({
            sources = {
                {name = "copilot"},
                {name = "path"},
                {name = "nvim_lsp"},
                {name = "buffer", keyword_length = 3},
                {name = "luasnip", keyword_length = 2},
            },
            mapping = {
                ["<CR>"] = cmp.mapping.confirm({
                    -- documentation says this is important.
                    -- I don"t know why.
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
                ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Tab>"] = nil,
                ["<S-Tab>"] = nil,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    before = function (_, vim_item)
                        return vim_item
                    end
                })
            }
        })
    end,
}
