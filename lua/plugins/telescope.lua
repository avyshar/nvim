return {
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',

			build = 'make',

			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-telescope/telescope-file-browser.nvim' },
		{ 'nvim-tree/nvim-web-devicons' }
	},
	config = function()
		local function set_pickers()
			local pickers = { "find_files", "live_grep" }
			local theme_settings = {
				theme = "ivy",
				layout_config = {
					height = 0.9
				}
			}

			local result = {}

			for i = 1, #pickers do
				result[pickers[i]] = theme_settings
			end

			return result
		end
		local fb_actions = require "telescope._extensions.file_browser.actions"
		require('telescope').setup {
			pickers = set_pickers(),
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["C-a"] = fb_actions.create,
						},
					},
				},
			},
		}
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'file_browser')
		pcall(require('telescope').load_extension, 'ui-select')
	end,
}
