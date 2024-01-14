local M = {
  -- "LunarVim/darkplus.nvim",
  "ayu-theme/ayu-vim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  -- vim.g.ayucolor="mirage"
  vim.cmd.colorscheme "ayu"
end

return M

