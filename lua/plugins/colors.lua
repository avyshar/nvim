return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = function()
            print "ignore gruvbox"
            vim.cmd[[colorscheme gruvbox]]
        end,
        enable = false,
    },
    {
        'ayu-theme/ayu-vim',
        config = function()
            vim.cmd[[colorscheme ayu]]
        end
    }
}
