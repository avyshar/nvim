return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	config = function()
		require("copilot").setup({
			-- panel = {
			-- 	enabled = true,
			-- 	auto_refresh = false,
			-- 	keymap = {
			-- 		jump_prev = "[[",
			-- 		jump_next = "]]",
			-- 		accept = "<CR>",
			-- 		refresh = "gr",
			-- 		open = "<C-S-c>",
			-- 	},
			-- 	layout = {
			-- 		position = "bottom", -- | top | left | right
			-- 		ratio = 0.4,
			-- 	},
			-- },
			-- suggestion = {
			-- 	enabled = true,
			-- 	auto_trigger = true,
			-- 	debounce = 75,
			-- 	keymap = {
			-- 		accept = "<Tab>",
			-- 		accept_word = false,
			-- 		accept_line = false,
			-- 		next = "<C-n>",
			-- 		prev = "<C-p>",
			-- 		dismiss = "<C-]>",
			-- 	},
			-- },
			-- filetypes = {
			-- 	yaml = false,
			-- 	markdown = false,
			-- 	help = false,
			-- 	gitcommit = false,
			-- 	gitrebase = false,
			-- 	hgcommit = false,
			-- 	svn = false,
			-- 	cvs = false,
			-- 	["."] = false,
			-- },
			-- copilot_node_command = "node", -- Node.js version must be > 18.x
			-- server_opts_overrides = {},
		})
	end,
}
