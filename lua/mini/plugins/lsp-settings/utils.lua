local M = {}

local function lsp_keymaps(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = bufnr, silent = true, noremap = true }
  local keymap = vim.keymap.set
  keymap('n', 'gD', vim.lsp.buf.declaration, opts)
  keymap('n', 'gd', vim.lsp.buf.definition, opts)
  keymap('n', 'K', vim.lsp.buf.hover, opts)
  keymap('n', 'gi', vim.lsp.buf.implementation, opts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  keymap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
  keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
  keymap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  keymap('n', 'gr', vim.lsp.buf.references, opts)
  keymap('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

function M.on_attach(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method 'textDocument/inlayHint' then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end


function M.common_capabilities()
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities.textDocument.completion.completionItem.snippetSupport = true
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  return capabilities
end

function M.toggle_inlay_hints()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

function M.default_diagnostics()
  return {
    signs = {
      active = true,
      values = {
        { name = 'DiagnosticSignError', text = "E" },
        { name = 'DiagnosticSignWarn', text = "W" },
        { name = 'DiagnosticSignHint', text = "H" },
        { name = 'DiagnosticSignInfo', text = "I" },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }
end

function M.setup_diagnostic_sign()
  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), 'signs', 'values') or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end
end

return M
