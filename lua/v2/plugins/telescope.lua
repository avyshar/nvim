return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-hop.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            {
                "ThePrimeagen/git-worktree.nvim",
                config = function()
                    require("git-worktree").setup {}
                end,
            },
            {
                "AckslD/nvim-neoclip.lua",
                config = function()
                    require("neoclip").setup()
                end,
            },

        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            width = 0.9,
                            preview_width = 0.75,
                        }
                    },
                },
            })  
            require("telescope").load_extension "git_worktree"
            require("telescope").load_extension "fzf"
            local builtin = require('telescope.builtin')
            vim.keymap.set('n','<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end,
    },
}
