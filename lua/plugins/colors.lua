return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = function()
            vim.cmd[[colorscheme gruvbox]]
        end,
        enabled = false,
    },
    {
        'ayu-theme/ayu-vim',
        config = function()
            vim.cmd[[colorscheme ayu]]
        end
    }
}
