return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function ()
            vim.cmd[[colorscheme tokyonight-day]]
        end
    },
    {
        "itchyny/lightline.vim",
        config = function()
            -- Set the lightline configuration
            vim.g.lightline = {
                colorscheme = 'tokyonight',
                active = {
                    left = {
                        { 'mode', 'paste' },
                        { 'gitbranch', 'readonly', 'filename', 'modified' }
                    }
                },
                component_function = {
                    gitbranch = 'FugitiveHead'
                }
            }

        end,
    }
}
