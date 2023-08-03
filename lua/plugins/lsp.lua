return {
    {
        "zbirenbaum/copilot.lua",
        dependencies = {
            "zbirenbaum/copilot-cmp",
        },
        config = function()
            require('copilot').setup({
                suggestion = {enabled = false},
                panel = {enabled = false},
            })
            require('copilot_cmp').setup()
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.api.nvim_command, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            {'hrsh7th/nvim-cmp'},   
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-path'},   
            {'L3MON4D3/LuaSnip'},
            {'jose-elias-alvarez/typescript.nvim'},
        },
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()
            cmp.setup({
                sources = {
                    {name = 'copilot'},
                    {name = 'nvim_lsp'},
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({
                        -- documentation says this is important.
                        -- I don't know why.
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    ['<Tab>'] = cmp_action.luasnip_supertab(),
                    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                }
            })

            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})
            end)

            lsp.skip_server_setup({'tsserver'})

            lsp.setup()

            require('typescript').setup({
                server = {
                    on_attach = function(client, bufnr)
                        -- You can find more commands in the documentation:
                        -- https://github.com/jose-elias-alvarez/typescript.nvim#commands

                        vim.keymap.set('n', '<leader>ci', '<cmd>TypescriptAddMissingImports<cr>', {buffer = bufnr})
                    end
                }
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "lua", "vim", "vimdoc", "query", "typescript", "tsx", "scss", "prisma", "json", "graphql", "javascript" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                -- List of parsers to ignore installing (for "all")
                -- ignore_install = { "javascript" },

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    disable = { "c", "rust" },
                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    }
}
