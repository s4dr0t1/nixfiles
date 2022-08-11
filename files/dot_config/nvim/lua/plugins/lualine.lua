--[[
	Name: lualine.lua
	Description: Configuration files for the neovim statusline
	Contains: nvim-lualine/lualine.nvim
--]]

--[[
	Configuration
--]]

-- Making a protected call
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print('There is something wrong with lualine')
	return
end

lualine.setup {
	theme = 'auto',

	-- Make sure there is a single lualine at the bottom of neovim instead of having each for every single window
	globalstatus = false,

	options = {
		-- Load specific extensions
		extensions = {
			'nvim-tree',
			'man',
			'symbols-outline',
			'toggleterm'
		}
	},
}
