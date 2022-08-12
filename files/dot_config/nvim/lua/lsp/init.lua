--[[
	Name: lsp/init.lua
	Description: Main configuration file for the LSP
--]]


-- Invoking the LSP functionality
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print('There is something wrong with lspconfig')
	return
end

--[[
	Responsible for:
		- Installing and maintaining LSP servers
--]]
require('lsp.mason')

--[[
	Responsible for everything when a LSP server is attached to a buffer, such as
		- Advertising to LSP servers about additional capabilities supported by nvim-cmp
		- Starting the LSP server
		- Passing configuration settings to LSP servers
--]]
require('lsp.server_attachment')

--[[
	Responsible for:
		- keymaps (but they're actually used by the server_attachment file)
		- showing diagnostic messages related to the lsp
--]]
require('lsp.config')

