--[[
	Name: gitsigms.lua
	Description: Configuration files
	Link: https://github.com/lewis6991/gitsigns.nvim
--]]

--[[
	Configuration
--]]

-- Making a protected call
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	print('There is something wrong with gitsigns')
	return
end

-- Configuration
gitsigns.setup()
