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
	Responsible for:
		- keymaps
		- showing diagnostic messages related to the lsp
		- disabling formatting based on some LSP
--]]
require('lsp.handlers').setup()


--[[
	Responsible for:
		- Making sure LSP servers get attached to the buffers
		- Advertising to LSP servers about additional capabilities supported by nvim-cmp
--]]
require('lsp.server_attachment')
