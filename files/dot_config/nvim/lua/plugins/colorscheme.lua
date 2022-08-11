--[[
	Name: colorscheme.lua
	Description: Configuration file for the colorscheme in usage
	Link: https://github.com/EdenEast/nightfox.nvim#carbonfox
--]]

--[[
	Handle the colorscheme error better
	If the colorscheme we're looking for, doesn't exist, print out an error
--]]

-- Enter the colorscheme you want here
local colorscheme = "carbonfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

