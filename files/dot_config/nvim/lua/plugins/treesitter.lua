--[[
	Name: treesitter.lua
	Description: Configuration file for the nvim-treesitter plugin
	Link: https://github.com/nvim-treesitter/nvim-treesitter
--]]

require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = {
		"c",
		"rust",
		"bash",
		"cpp",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = {},

	-- Let treesitter augment syntax highlighting
	highlight = {
		enable = true,
		disable = {}
	}
}
