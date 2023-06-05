local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'WinEnter', 'WinNew', 'BufWinEnter' }, {
    group = augroup('CursorLineHighlight', {}),
    pattern = "*",
    callback = function()
        vim.cmd('highlight CursorLine guibg=black ctermbg=4 ctermfg=226')
    end,
})

autocmd('TextYankPost', {
    group = augroup('HighlightYank', {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})
