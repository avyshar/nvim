return {
  {
    "tjdevries/express_line.nvim",
    config = function()
      require("plugins.statusline.config").setup()
    end,
  },
}
