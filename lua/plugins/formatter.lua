return {
    'stevearc/conform.nvim',
    opts = {},
    config=  function ()
        require('conform').setup {
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { {"eslint_d", "prettierd", "prettier" } },
                typescript = {{ "eslint_d","prettierd", "prettier"}},
                go = {{"gofmt", "gofumpt", "goimports", "golines"}},
                html = {{"htmlbeautifier"}},
                ocaml = {{"ocamlformat"}},
                rust = {{ "rustfmt" }},
                css = {{ "stylelint" }}
            },
        }
    end
}
