local api = vim.api

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- auto close brackets
-- this
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- change the background color of floating windows and borders.
    -- vim.cmd('highlight NormalFloat guibg=none guifg=none')
    -- vim.cmd('highlight FloatBorder guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight NormalNC guibg=none guifg=none')

    -- vim.cmd('highlight TelescopeBorder guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopePromptBorder guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopeResultsBorder guifg=' .. colors.fg .. ' guibg=none')
    --
    -- vim.cmd('highlight TelescopePromptTitle guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopeResultsTitle guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight TelescopePreviewTitle guifg=' .. colors.fg .. ' guibg=none')
    --

    -- change neotree background colors
    -- Default: NeoTreeNormal  xxx ctermfg=223 ctermbg=232 guifg=#d4be98 guibg=#141617
    -- vim.cmd('highlight NeoTreeNormal guibg=#252e33 guifg=none')
    -- vim.cmd('highlight NeoTreeFloatNormal guifg=none guibg=none')
    -- vim.cmd('highlight NeoTreeFloatBorder gui=none guifg=' .. colors.fg .. ' guibg=none')
    -- vim.cmd('highlight NeoTreeEndOfBuffer guibg=#252e33') -- 1d2021

    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })

    vim.cmd("highlight Winbar guibg=none")

    -- vim.cmd("highlight Comment guifg=#475558")
    -- vim.cmd("highlight Comment guifg=green")
  end,
})

-- -- Golang format on save
-- local goformat_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     require('go.format').gofmt()
--   end,
--   group = goformat_sync_grp,
-- })
--
-- Run gofmt + goimport on save
local goimport_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  group = goimport_sync_grp,
})

