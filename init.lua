require("settings")
require("keymaps")
require("autocommands")

---@type LazySpec
local plugins = "plugins"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Configure plugins.
require("lazy").setup(plugins, {
	ui = { border = "rounded" },
	dev = { path = vim.g.projects_dir },
	install = {
		-- Do not automatically install on startup.
		missing = false,
	},
	-- Don't bother me when tweaking plugins.
	change_detection = { notify = false },
	performance = {
		rtp = {
			-- Stuff I don't use.
			disabled_plugins = {
				"gzip",
				-- 'netrwPlugin',
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
