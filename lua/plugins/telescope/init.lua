return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.6',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-treesitter/nvim-treesitter",
    "NvChad/base46"
  },
  -- opts = function()
  --   return require("plugins.telescope.options")
  -- end,
  config = function()
    local opts = require("plugins.telescope.options")
    require("plugins.telescope.config").setup(opts)
    require("plugins.telescope.mappings").init_keymap()
  end
}

