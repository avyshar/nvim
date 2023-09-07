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

local plugins = {
    require('avyshar.plugins.telescope'),
    require('avyshar.plugins.colorscheme'),
    require('avyshar.plugins.treesitter'),
    require('avyshar.plugins.lsp'),
    require('avyshar.plugins.ui'),
}

require("lazy").setup(plugins)
