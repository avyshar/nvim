return {
    'christoomey/vim-tmux-navigator',
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    {
        'vimpostor/vim-tpipeline',
        config = function()
            vim.g.tpipeline_autoembed = 0

        end
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
}
