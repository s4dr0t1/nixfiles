--[[
	Name: indentation.lua
	Description: Configuration file
	Contains: lukas-reineke/indent-blankline.nvim
--]]


--[[
	Configuration
--]]

-- The following options require Treesitter to work properly
local opt = vim.opt
opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"

-- Protected call
local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	print('There is something wrong with the indent-blankline plugin')
	return
end

-- Configuration
indent.setup {
	show_current_context = true,
	space_char_blankline = " ",
	show_current_context_start = true,
}
