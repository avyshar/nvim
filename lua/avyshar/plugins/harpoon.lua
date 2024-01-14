local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
  },
}
function M.config()
  local harpoon = require 'harpoon'

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  vim.keymap.set('n', '<leader>had', function()
    harpoon:list():append()
  end, { desc = 'Harpoon it' })
  vim.keymap.set('n', '<leader>hl', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  vim.keymap.set('n', '<leader>hq', function()
    harpoon:list():select(1)
  end)
  vim.keymap.set('n', '<leader>hw', function()
    harpoon:list():select(2)
  end)
  vim.keymap.set('n', '<leader>he', function()
    harpoon:list():select(3)
  end)
  vim.keymap.set('n', '<leader>hr', function()
    harpoon:list():select(4)
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
  -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
end

return M
