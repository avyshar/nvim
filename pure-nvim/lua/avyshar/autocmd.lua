local utils = require('avyshar.utils')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
utils.autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = utils.augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
