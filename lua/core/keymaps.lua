local set = vim.keymap.set

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

set("n", "]d", vim.diagnostic.goto_next)-- fn(vim.diagnostic.jump, { count = 1, float = true }))
set("n", "[d", vim.diagnostic.goto_prev)-- fn(vim.diagnostic.jump, { count = -1, float = true }))

set("t", "<esc><esc>", "<c-\\><c-n>")

set("n", ",st", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
