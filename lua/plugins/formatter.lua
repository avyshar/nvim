return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
        typescript = { "eslint_d", "prettierd", "prettier", stop_after_first = true },
      },
    })
  end,
}
