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
    require('v2.plugins.fzf'),
    require('v2.plugins.telescope'),
    require('v2.plugins.oil'),
    require('v2.plugins.lsp'),
    require('v2.plugins.git'),
    require('v2.plugins.theme'),
    require('v2.plugins.treesitter'),
    require('v2.plugins.harpoon'),
    require('v2.plugins.indent'),
    require('v2.plugins.colorizer'),
    require('v2.plugins.comments'),
})
