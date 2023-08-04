return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup {}
        end
    },
    {
        "stevearc/oil.nvim",
        config = function()
            require('oil').setup()
        end
    },
}
