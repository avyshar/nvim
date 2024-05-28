return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup()

    vim.keymap.set("n", "<leader>-", function()
      local current_dir = oil.get_current_dir()
      oil.open(current_dir)
      -- oil.toggle_float(current_dir)
    end)
  end
}
