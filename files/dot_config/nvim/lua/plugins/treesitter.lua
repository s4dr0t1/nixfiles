--[[
	Name: treesitter.lua
	Description: Configuration file for the nvim-treesitter plugin
	Link: 
		- nvim-treesitter/nvim-treesitter
		- p00f/nvim-ts-rainbow
		- windwp/nvim-autopairs
--]]

-- Making a protective call
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print('There is something wrong with nvim-treesitter')
	return
end

treesitter.setup {
	-- A list of parser names, or "all"
	ensure_installed = {
		"c",
		"rust",
		"bash",
		"cpp",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = {},

	-- Let treesitter augment syntax highlighting
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true,
	},


	-- p00f/nvim-ts-rainbow Configuration
	rainbow = {
		enable = true,
		extended_mode = true,
		disable = {},
	},

	-- Make the nvim-autopair plugin Treesitter aware
	autopairs = {
		enable = true
	}
}
