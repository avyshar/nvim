local M = {}

M.setup = function(opts)
    -- dofile(vim.g.base46_cache .. "telescope")
    local telescope = require "telescope"
    telescope.setup(opts)
    -- for _, ext in ipairs(opts.extensions_list) do
    --   telescope.load_extension(ext)
    -- end
end

return M
