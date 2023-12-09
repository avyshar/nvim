return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencie = { {"nvim-lua/plenary.nvim"} },
        config = function ()
            local harpoon = require("harpoon")

            print("harpoon setup")
            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "harpoon it" })
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end)
        end
    }
}
