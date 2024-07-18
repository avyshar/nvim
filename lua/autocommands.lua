vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('mariasolos/yank_highlight', { clear = true }),
    desc = 'Highlight on yank',
    callback = function()
        -- Setting a priority higher than the LSP references one.
        vim.highlight.on_yank { higroup = 'Visual', priority = 250 }
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
