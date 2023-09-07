local Utils = {}
Utils.new_tab = function(tabName)
    vim.api.nvim_command('tabnew' .. ' ' .. tabName)
end

Utils.resize_win_height = function(new_height)
    local current_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_height(current_win, new_height)
end

return Utils
