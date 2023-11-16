return {
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			{ 'j-hui/fidget.nvim', opts = {} },
			'folke/neodev.nvim',
		},
    config = require('plugins.lsp.config').get_lsp_config,
	},
}
