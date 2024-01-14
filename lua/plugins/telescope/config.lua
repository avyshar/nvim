require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', function()
  require('telescope.builtin').buffers { sort_lastused = true }
end)
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>sb', function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end)
vim.keymap.set('n', '<leader>sh', function()
  require('telescope.builtin').help_tags()
end)
vim.keymap.set('n', '<leader>st', function()
  require('telescope.builtin').tags()
end)
vim.keymap.set('n', '<leader>sd', function()
  require('telescope.builtin').grep_string()
end)
vim.keymap.set('n', '<leader>sp', function()
  require('telescope.builtin').live_grep()
end)
vim.keymap.set('n', '<leader>?', function()
  require('telescope.builtin').oldfiles()
end)
