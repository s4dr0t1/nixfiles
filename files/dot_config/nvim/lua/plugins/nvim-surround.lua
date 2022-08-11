--[[
	Name: nvim-surround.lua
	Description: Configuration files
	Contains: kylechui/nvim-surround
--]]

--[[
	Configuration
--]]

-- Making a protected call
local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
	print('There is something wrong with nvim-surround')
	return
end

surround.setup {}
