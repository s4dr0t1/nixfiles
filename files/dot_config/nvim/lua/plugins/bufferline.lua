--[[
	Name: bufferline.lua
	Description: Configuration files
	Link: https://github.com/akinsho/bufferline.nvim#installation
--]]

--require("bufferline").setup{}
require('bufferline').setup {
	options = {
		diagnostics = "nvim_lsp",
		color_icons = true,
		show_close_icon = false,
		separator_style = "thin",
		offsets = {
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left"
		}
	}
}
