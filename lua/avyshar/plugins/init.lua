local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require('avyshar.plugins.telescope'),
    require('avyshar.plugins.lsp'),
    require('avyshar.plugins.trouble'),
    require('avyshar.plugins.treesitter'),
    require('avyshar.plugins.harpoon'),
    require('avyshar.plugins.fugitive'),
    require('avyshar.plugins.colorizer'),
    require('avyshar.plugins.theme'),
    require('avyshar.plugins.lualine'),
    require('avyshar.plugins.indentation'),
    require('avyshar.plugins.comments'),
    require('avyshar.plugins.zen-mode'),
}, {})
