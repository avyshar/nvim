local scheme = 'dark'

local theme_map = {
  dark = 'base16-onedark',
  light = 'base16-one-light',
}

vim.keymap.set('n', '<leader>tt', function()
  if scheme == 'dark' then
    scheme = 'light'
  else
    scheme = 'dark'
  end
  vim.cmd.colorscheme(theme_map[scheme])
end, { desc = 'toggle theme' })

vim.cmd.colorscheme(theme_map[scheme])
