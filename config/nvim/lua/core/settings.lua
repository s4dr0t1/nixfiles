--[[
	Name: settings.lua
	Description: Core settings for neovim
--]]



--[[
	Neovim UI
--]]

-- Used later
local g = vim.g
-- Leader key
g.mapleader = ','

-- Contains settings
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
	shell = "/usr/bin/env bash",

	-- In which direction should the tmux split
	splitbelow = true,
	splitright = true,

	-- Miscellaneous
	termguicolors = true,

	-- Indentation
	smartindent = true,

	-- Don't show the current Vim node because it's shown by the lualine already
	showmode = false,

	-- Have a global statusline
	laststatus = 3,
}

-- Set those options
-- vim.opt acts like :set in Lua
local set = vim.opt
for k, v in pairs(options) do
	set[k] = v
end

-- Disable these built-in plugins
local default_plugins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(default_plugins) do
	g["loaded_" .. plugin] = 1
end


-- Disabling support for pynvim, and the likes: Default providers
local default_providers = {
	#"node",
	"perl",
	"python3",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	g["loaded_" .. provider .. "_provider"] = 0
end
