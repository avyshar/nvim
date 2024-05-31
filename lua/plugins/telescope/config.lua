local M = {}

M.setup = function(opts)
  local telescope = require "telescope"
  telescope.setup(opts)

  pcall(require("telescope").load_extension, "ui-select")
  pcall(require("telescope").load_extension, "fzf")
end

return M
