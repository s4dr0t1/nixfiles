--[[
	Name: bufferline.lua
	Description: Configuration files
	Contains: akinsho/bufferline.nvim
--]]

--[[
	Configuration
--]]

-- Making a protected call
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	print('There is something wrong with bufferline')
	return
end

bufferline.setup {
	options = {
		-- Show buffer_id along with the buffer name, useful with dealing with :b commands
		numbers = "buffer_id",

		-- Show diagnostic information from the LSP
		diagnostics = "nvim_lsp",
		color_icons = true,
		show_close_icon = false,
		separator_style = "thin",
		offsets = {
			filetype = "NvimTree",
			text = "File Explorer",
			highlight = "Directory",
			text_align = "left"
		},
		offsets = 
		{
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center"
			}
		}

	}
}
