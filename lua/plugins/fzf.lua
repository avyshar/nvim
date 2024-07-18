return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		local fzf = require("fzf-lua")
		fzf.setup({})

		vim.keymap.set("n", "<leader>fo", fzf.builtin, { desc = "fzf builtin" })
		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "find buffers" })
		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "find files" })
		vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "find files" })
		vim.keymap.set("n", "<leader>fw", fzf.grep_cword, { desc = "find word" })
		vim.keymap.set("n", "<leader>fW", fzf.grep_cWORD, { desc = "find WORD" })
	end,
}
