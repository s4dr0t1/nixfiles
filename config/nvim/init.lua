--[[ 
	Name: init.lua
	Description: The root configuration file for neovim
--]]

-- Key mappings independent of any plugin
require('core')

-- Configuration files for the LSP
require('lsp')

-- Configuration files for plugins
require('plugins')
