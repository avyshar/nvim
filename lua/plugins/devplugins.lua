return {
	{
		dir = "~/Projects/npm-run.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			local npm_run = require("npm-run")
			vim.keymap.set("n", "<leader>np", npm_run.showRunner)
			vim.keymap.set("n", "<leader>hp", npm_run.hideRunner)
		end,
	},
}
