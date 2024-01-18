local M = {
  -- "LunarVim/darkplus.nvim",
  -- 'ayu-theme/ayu-vim',
  "navarasu/onedark.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  local one_dark = require('onedark')

  one_dark.setup {
    style = 'warmer'
  }
  one_dark.load()

end

return M
