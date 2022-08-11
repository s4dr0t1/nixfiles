--[[
	Name: lsp/init.lua
	Description: Main configuration file for the LSP
--]]


local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print('There is something wrong with lspconfig')
	return
end

require('lsp.mason')
require('lsp.handlers').setup()
