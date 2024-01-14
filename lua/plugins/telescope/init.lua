return {
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you have trouble with this installation, refer to the README for telescope-fzf-native.
    build = 'make',
    dependencies = { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },
    config = function()
      require 'plugins.telescope.config'
    end,
  },
}
