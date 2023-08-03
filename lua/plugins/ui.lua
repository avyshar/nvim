return {
    {
        "kyoh86/momiji",
        config = function()
            -- vim.cmd('colorscheme momiji')
        end,
    },
    {
        "joshdick/onedark.vim",
        config = function()
            vim.cmd('colorscheme onedark')
        end,
    },
    {
        "itchyny/lightline.vim",
        config = function()
            -- Set the lightline configuration
            vim.g.lightline = {
                colorscheme = 'onedark',
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
