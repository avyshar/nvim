vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Hightlight on yank',
  group = vim.api.nvim_create_augroup('my-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
    end

    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = args.buf })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = args.buf })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = args.buf })
    vim.keymap.set('n', '<leader>cf', function()
      require('conform').format {}
    end, { buffer = args.buf })
    vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, { buffer = args.buf })
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Custom Terminal Open',
  group = vim.api.nvim_create_augroup('term open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})
