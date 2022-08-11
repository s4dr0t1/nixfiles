--[[
	Name: symbols-outline.lua
	Description: Configuration file for the symbols-outline.nvim plugin
	Link: https://github.com/simrat39/symbols-outline.nvim
--]]

-- Custom keymaps
map('n', '<C-t>', ':SymbolsOutline<CR>')

-- Configuration for the plugin
vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = true,
	position = 'right',
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = 'Pmenu',
	keymaps = {
		close = {"<Esc>", "q"},
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
}
