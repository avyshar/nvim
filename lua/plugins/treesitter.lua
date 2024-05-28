---@diagnostic disable: missing-fields
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    -- "nvim-treesitter/nvim-treesitter-context",
    -- "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    local langs = {}

    langs = vim.tbl_deep_extend("force", langs, {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "heex",
      "javascript",
      "html",
      "typescript",
      "go",
      "rust",
    })

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "query", "heex", "javascript", "html", "typescript", "go", "rust", "ron", "toml" },
      sync_install = false,
      highlight = { enable = true },
      -- indent = { enable = true },
    })

    -- require('nvim-ts-autotag').setup()
  end
}
