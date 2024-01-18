local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'AndreM222/copilot-lualine',
  },
}

function M.config()
  require('lualine').setup {
    options = {
      theme = 'onedark',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      ignore_focus = { 'NvimTree' },
    },
    sections = {
      lualine_a = {},
      lualine_b = { 'branch' },
      lualine_c = { 'diagnostics' },
      lualine_x = { 'copilot', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = {},
    },
    tabline = {
      lualine_a = { 'buffers' },
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' }
    },
    extensions = { 'quickfix', 'man', 'fugitive' },
  }
end

return M
