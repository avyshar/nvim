return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        javascript = { "eslint", "prettierd", "prettier", stop_after_first = true },
        typescript = { "eslint", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "eslint", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "eslint", "prettierd", "prettier", stop_after_first = true },
      },
    })
  end,
}
