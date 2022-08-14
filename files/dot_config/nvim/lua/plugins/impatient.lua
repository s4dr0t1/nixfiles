--[[
	Name: impatient.lua
	Description: Configuration files for the impatient.nvim plugin, used to increase the startup time of neovim
	Contains: lewis6991/impatient.nvim
--]]

-- Making a pcall
local status_ok, autopairs = pcall(require, "impatient")
if not status_ok then
	print('There is something wrong with impatient.nvim')
	return
end
