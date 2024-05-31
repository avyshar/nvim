return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.6',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-treesitter/nvim-treesitter",
    "NvChad/base46"
  },
  -- cmd = "Telescope",
  -- opts = function()
  --   return require("plugins.telescope.options")
  -- end,
  config = function(_, opts)
    print "init telescope"
    require("plugins.telescope.config").setup(opts)
    require("plugins.telescope.mappings").init_keymap()
  end
}

