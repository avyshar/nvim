return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require('lualine').setup({
                options = {
                    theme = 'material',
                    section_separators = {'', ''},
                    component_separators = {'', ''},
                    icons_enabled = true,
                },
            })
        end,
    },
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            vim.opt.termguicolors = true
            require("bufferline").setup{}
        end
    }
}
