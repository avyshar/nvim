return {
  "hachy/eva01.vim",
  dependencies = {
    "slugbyte/lackluster.nvim",
    "sainnhe/gruvbox-material",
    "savq/melange-nvim",
  },
  config = function()
    vim.cmd.colorscheme('eva01')
  end,
}
