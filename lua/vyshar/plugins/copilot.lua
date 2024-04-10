return {
  'zbirenbaum/copilot.lua',
  event = 'InsertEnter',
  cmd = 'Copilot',
  config = function()
    local ok, copilot = pcall(require, 'copilot')
    if not ok then
      return
    end

    require('copilot').setup {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<Tab>',
          accept_word = false,
          accept_line = false,
          next = '<C-J>',
          prev = '<C-K>',
          dismiss = '<C-0>',
        },
      },
    }
  end,
}
