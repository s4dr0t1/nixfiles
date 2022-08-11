--[[
	Name: settings.lua
	Description: Core settings for neovim
--]]



--[[
	Neovim UI
--]]

-- Leader key
vim.g.mapleader = ','

local options = {
	-- Numbering
	number = true,
	relativenumber = true,

	-- Ignore case when searching
	ignorecase = true,
	-- Show search results as you type
	incsearch = true,
	-- Highlight all matches on previous search pattern
	hlsearch = true,

	-- Background buffers
	hidden = true,

	-- Encoding
	encoding = 'utf-8',

	-- Spellchecking
	spell = true,

	-- Disable swap file
	swapfile = true,

	-- Lazy Redraw
	lazyredraw = true,

	-- Use bash to execute commands, instead of the default shell
	shell = "/usr/bin/bash",

	-- In which direction should the tmux split
	splitbelow = true,
	splitright = false,

	-- Miscellaneous
	termguicolors = true,

	-- Indentation
	smartindent = true,

	-- Don't show the current Vim node because it's shown by the lualine already
	showmode = false
}

-- Set those options
-- vim.opt acts like :set in Lua
local set = vim.opt
for k, v in pairs(options) do
	set[k] = v
end
