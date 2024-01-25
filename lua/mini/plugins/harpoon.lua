return {
  'thePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
  },
  config = function()
    require 'harpoon':setup()
    local keymap = vim.keymap.set
    -- REQUIRED
    local harpoon = require "harpoon"
    keymap('n', '<leader>had', function()
      harpoon:list():append()
    end, { desc = 'Harpoon it' })
    keymap('n', '<leader>hl', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon list' })

    keymap('n', '<leader>hq', function()
      harpoon:list():select(1)
    end)
    keymap('n', '<leader>hw', function()
      harpoon:list():select(2)
    end)
    keymap('n', '<leader>he', function()
      harpoon:list():select(3)
    end)
    keymap('n', '<leader>hr', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    keymap("n", "<leader>hn", function() harpoon:list():prev() end, { desc = "Harpoon Prev" })
    keymap("n", "<leader>hp", function() harpoon:list():next() end, { desc = "Harpoon Next" })


    -- LSP
    keymap('n', '[d', vim.diagnostic.goto_prev, { desc = "Diagnostics next" } )
    keymap('n', ']d', vim.diagnostic.goto_next, { desc = "Diagnostics prev" } )
  end
}
