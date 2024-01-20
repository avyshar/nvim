local M = {
  'LunarVim/breadcrumbs.nvim',
  enabled = false,
}

function M.config()
  require('breadcrumbs').setup()
end

return M
