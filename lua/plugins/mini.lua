return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local l = {
			statusline = {},
		}

		for key, val in pairs(l) do
			require("mini." .. key).setup(val)
		end
	end,
}
